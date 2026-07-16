import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:reflectable/mirrors.dart';
import 'package:resolve_di/src/injectable_page.dart';
import 'package:resolve_di/src/reflector.dart';

class DependencyContainer {
  final _log = Logger('DependencyContainer');

  final Map<String, dynamic> _instances = {};
  final Map<Type, Type> _selectedBindings = {};

  final Reflector _inject;

  DependencyContainer(this._inject);

  T resolve<T>() {
    final classMirror = _findConcreteClassMirrorForType(T);
    return _resolveFromMirror(classMirror) as T;
  }

  ClassMirror _findConcreteClassMirrorForType(Type type) {
    final boundImplementationType = _selectedBindings[type];

    if (boundImplementationType != null) {
      return _inject.annotatedClasses.firstWhere(
        (classMirror) =>
            classMirror.simpleName == boundImplementationType.toString() &&
            !classMirror.isAbstract,
        orElse: () => throw StateError(
          'No concrete class found for bound implementation type '
          '$boundImplementationType.',
        ),
      );
    }

    try {
      return _inject.annotatedClasses.firstWhere(
        (classMirror) =>
            classMirror.simpleName == type.toString() &&
            !classMirror.isAbstract,
      );
    } catch (_) {
      return _inject.annotatedClasses.firstWhere(
        (classMirror) =>
            !classMirror.isAbstract &&
            classMirror.superinterfaces.any(
              (interface) => interface.simpleName == type.toString(),
            ),
        orElse: () => throw StateError(
          'No class found for type $type. Remember to annotate the class '
          'and its parameter classes with @inject (or the Reflector instance '
          'used by this container)!',
        ),
      );
    }
  }

  dynamic _resolveFromMirror(ClassMirror classMirror) {
    if (_instances.containsKey(classMirror.simpleName)) {
      _log.info('Using existing instance of class: ${classMirror.simpleName}');
      return _instances[classMirror.simpleName];
    }

    if (classMirror.superinterfaces.isNotEmpty &&
        _instances.containsKey(
          classMirror.superinterfaces.firstOrNull?.simpleName,
        )) {
      _log.info(
        'Using existing instance of class: '
        '${classMirror.superinterfaces.firstOrNull?.simpleName}',
      );
      return _instances[classMirror.superinterfaces.firstOrNull?.simpleName];
    }

    final instance = _createInstanceFromDefaultConstructor(classMirror);

    _log.info(
      'Adding instance of class: ${classMirror.simpleName} to instances map',
    );
    _instances[classMirror.simpleName] = instance;

    if (classMirror.superinterfaces.isNotEmpty) {
      _log.info(
        'Adding instance of class: '
        '${classMirror.superinterfaces.firstOrNull!.simpleName} to instances map',
      );
      _instances[classMirror.superinterfaces.firstOrNull!.simpleName] =
          instance;
    }

    _log.info(
      'Instance of class: ${classMirror.simpleName} created successfully',
    );
    return instance;
  }

  dynamic _createInstanceFromDefaultConstructor(ClassMirror classMirror) {
    final constructorMirror = _defaultConstructorMirror(classMirror);
    final parameters = constructorMirror.parameters;

    final positionalArgs = <dynamic>[];
    final namedArgs = <Symbol, dynamic>{};

    for (final param in parameters) {
      final paramType = param.type.reflectedType;
      final mirrorClassForParameter = _findConcreteClassMirrorForType(
        paramType,
      );
      final dependency = _resolveFromMirror(mirrorClassForParameter);

      if (param.isNamed) {
        namedArgs[Symbol(param.simpleName)] = dependency;
      } else {
        positionalArgs.add(dependency);
      }
    }

    _log.info('Creating instance of class: ${classMirror.simpleName}');
    return classMirror.newInstance('', positionalArgs, namedArgs);
  }

  MethodMirror _defaultConstructorMirror(ClassMirror mirror) {
    final unnamedConstructor = mirror.declarations[''] as MethodMirror?;
    if (unnamedConstructor != null && unnamedConstructor.isConstructor) {
      return unnamedConstructor;
    }

    return mirror.declarations.values.whereType<MethodMirror>().firstWhere(
          (declaration) =>
              declaration.isConstructor && declaration.constructorName == '',
          orElse: () => throw StateError(
            'Unable to find default constructor for ${mirror.simpleName}.',
          ),
        );
  }

  void registerDependencies(Map<Type, Type> selectedBindings) {
    _selectedBindings.addAll(selectedBindings);
  }

  dynamic _readInstanceMember(Object instance, String memberName) {
    return _inject.reflect(instance).invokeGetter(memberName);
  }

  VoidCallback? _tryCreateRunCallback(dynamic value) {
    final dynamic candidate = value;
    try {
      final run = candidate.run;
      if (run is Function) {
        return () => run();
      }
    } on NoSuchMethodError {
      return null;
    }
    return null;
  }

  dynamic _bindViewParameterValue(dynamic memberValue) {
    if (memberValue is Function) {
      return memberValue;
    }

    return _tryCreateRunCallback(memberValue) ?? memberValue;
  }

  W _createViewForViewModel<W extends Widget>(
    ClassMirror viewClassMirror,
    ClassMirror viewModelClassMirror,
    ChangeNotifier viewModelInstance,
  ) {
    final viewConstructorMirror = _defaultConstructorMirror(viewClassMirror);
    final parameters = viewConstructorMirror.parameters;

    final positionalArgs = <dynamic>[];
    final namedArgs = <Symbol, dynamic>{};

    for (final param in parameters) {
      final paramName = param.simpleName;
      if (paramName == 'key') continue;

      final viewModelMember = viewModelClassMirror.declarations[paramName];
      if (viewModelMember is VariableMirror ||
          viewModelMember is MethodMirror) {
        final memberValue = _readInstanceMember(viewModelInstance, paramName);
        final boundValue = _bindViewParameterValue(memberValue);
        _log.info(
          'Binding view model member: $paramName '
          'to view constructor parameter: $paramName',
        );

        if (param.isNamed) {
          namedArgs[Symbol(paramName)] = boundValue;
        } else {
          positionalArgs.add(boundValue);
        }
      } else {
        _log.warning(
          'No matching view model member found for view constructor parameter: $paramName. '
          'Binding between view and view model will not be set up for this parameter.',
        );

        final paramType = param.type.reflectedType;
        final mirrorClassForParameter = _findConcreteClassMirrorForType(
          paramType,
        );
        if (param.isNamed) {
          namedArgs[Symbol(paramName)] = _resolveFromMirror(
            mirrorClassForParameter,
          );
        } else {
          positionalArgs.add(_resolveFromMirror(mirrorClassForParameter));
        }
      }
    }

    final viewInstance =
        viewClassMirror.newInstance('', positionalArgs, namedArgs) as W;

    _log.info(
      'Instance of class: ${viewClassMirror.simpleName} created successfully',
    );

    return viewInstance;
  }

  InjectablePage<W, VM>
      resolveView<W extends Widget, VM extends ChangeNotifier>() {
    final viewModelClassMirror = _findConcreteClassMirrorForType(VM);
    final viewClassMirror = _findConcreteClassMirrorForType(W);

    final viewModelInstance =
        _createInstanceFromDefaultConstructor(viewModelClassMirror) as VM;

    _log.info(
      'Instance of class: ${viewModelClassMirror.simpleName} created successfully',
    );

    return InjectablePage<W, VM>(
      key: UniqueKey(),
      viewModel: viewModelInstance,
      viewBuilder: (viewModel) => _createViewForViewModel<W>(
        viewClassMirror,
        viewModelClassMirror,
        viewModel,
      ),
    );
  }
}
