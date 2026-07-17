import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:reflectable/mirrors.dart';
import 'package:resolve_di/src/bind.dart';
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

  W _createViewFromBindings<W extends Widget>(
    ClassMirror viewClassMirror,
    ChangeNotifier viewModelInstance,
    Set<Bind> bindings,
  ) {
    final namedArgs = <Symbol, dynamic>{};

    final ctor = _defaultConstructorMirror(viewClassMirror);

    // Positional parameters (other than 'key') are not supported for view bindings.
    final positionalParams = ctor.parameters
        .where((p) => !p.isNamed && p.simpleName != 'key')
        .toList();
    if (positionalParams.isNotEmpty) {
      throw StateError(
        'View ${viewClassMirror.simpleName} has positional constructor '
        'parameters (${positionalParams.map((p) => p.simpleName).join(', ')}). '
        'Only named parameters are supported for view bindings.',
      );
    }

    // Check that bindings are provided for all required (non-optional) parameters.
    final requiredParams = ctor.parameters
        .where((p) => p.simpleName != 'key' && !p.isOptional)
        .toList();

    if (bindings.isEmpty && requiredParams.isNotEmpty) {
      final paramNames = requiredParams.map((p) => p.simpleName).join(', ');
      throw StateError(
        'No bindings provided for view: ${viewClassMirror.simpleName}. '
        'Required parameters without bindings: $paramNames.',
      );
    }

    for (final bind in bindings) {
      final vmValue = _readInstanceMember(
        viewModelInstance,
        bind.viewModelProperty,
      );
      final viewValue = bind.converter != null
          ? bind.converter!.call(vmValue)
          : vmValue;

      _log.info(
        'Binding vm.${bind.viewModelProperty} → view.${bind.viewProperty}'
        '${bind.converter != null ? " (converted)" : ""}',
      );

      namedArgs[Symbol(bind.viewProperty)] = viewValue;
    }

    final viewInstance = viewClassMirror.newInstance('', [], namedArgs) as W;

    _log.info(
      'Instance of class: ${viewClassMirror.simpleName} created successfully',
    );

    return viewInstance;
  }

  InjectablePage<W, VM>
  resolveView<W extends Widget, VM extends ChangeNotifier>(Set<Bind> bindings) {
    final viewModelClassMirror = _findConcreteClassMirrorForType(VM);
    final viewClassMirror = _findConcreteClassMirrorForType(W);

    final viewModelInstance =
        _createInstanceFromDefaultConstructor(viewModelClassMirror) as VM;

    _log.info(
      'Instance of class: ${viewModelClassMirror.simpleName} created successfully',
    );

    return InjectablePage<W, VM>(
      viewModel: viewModelInstance,
      viewBuilder: (viewModel) =>
          _createViewFromBindings<W>(viewClassMirror, viewModel, bindings),
    );
  }
}
