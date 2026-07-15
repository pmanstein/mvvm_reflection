import 'package:flutter/widgets.dart';
import 'package:reflectable/reflectable.dart';
import 'package:mvvm_reflection/app/reflector.dart';
import 'package:mvvm_reflection/app/service_locator.dart';
import 'package:mvvm_reflection/main.reflectable.dart';

class ViewResolver {
  static final Map<String, ClassMirror> _viewMirrors = {};
  static final Map<String, ClassMirror> _viewModelMirrors = {};
  static bool _initialized = false;

  ViewResolver._();

  static void initialize() {
    if (_initialized) return;

    initializeReflectable();

    for (final classMirror in appReflector.annotatedClasses) {
      final name = classMirror.simpleName;
      if (name.endsWith('Page')) {
        _viewMirrors[name] = classMirror;
      } else if (name.endsWith('ViewModel')) {
        _viewModelMirrors[name] = classMirror;
      }
    }

    _initialized = true;
  }

  static Widget resolvePage(String pageName) {
    initialize();

    final viewMirror = _viewMirrors[pageName];
    if (viewMirror == null) {
      throw StateError(
        'No page registered for "$pageName". '
        'Make sure the page is annotated with @appReflector and follows the naming convention.',
      );
    }

    final viewModelName = _viewModelNameForPage(pageName);
    final viewModelMirror = _viewModelMirrors[viewModelName];
    if (viewModelMirror == null) {
      throw StateError(
        'No ViewModel registered for "$viewModelName". '
        'Make sure the ViewModel is annotated with @appReflector and named after the page.',
      );
    }

    final viewModel = _instantiateClass(viewModelMirror);
    return _instantiateView(viewMirror, viewModel);
  }

  static String _viewModelNameForPage(String pageName) {
    return '${pageName.replaceFirst(RegExp(r'Page$'), '')}ViewModel';
  }

  static Object _instantiateClass(ClassMirror mirror) {
    final constructor = _defaultConstructorMirror(mirror);
    final positional = <Object?>[];
    final named = <Symbol, Object?>{};

    for (final parameter in constructor.parameters) {
      final dependency = _resolveParameter(parameter);
      if (parameter.isNamed) {
        named[Symbol(parameter.simpleName)] = dependency;
      } else {
        positional.add(dependency);
      }
    }

    return mirror.newInstance('', positional, named);
  }

  static Object _resolveParameter(ParameterMirror parameter) {
    final dependencyType = parameter.type.reflectedType;
    final resolved =
        ServiceLocator.tryGet(dependencyType) ??
        _resolveReflectableDependency(dependencyType);

    if (resolved != null) {
      return resolved;
    }

    throw StateError(
      'Unable to resolve constructor parameter '
      '"${parameter.simpleName}" of type "$dependencyType". '
      'Register the dependency in ServiceLocator or make it reflectable.',
    );
  }

  static Object? _resolveReflectableDependency(Type dependencyType) {
    final classMirror =
        appReflector.reflectType(dependencyType) as ClassMirror?;
    if (classMirror == null) {
      return null;
    }

    return _instantiateClass(classMirror);
  }

  static Widget _instantiateView(ClassMirror viewMirror, Object viewModel) {
    final constructor = _defaultConstructorMirror(viewMirror);
    final positional = <Object?>[];
    final named = <Symbol, Object?>{};

    for (final parameter in constructor.parameters) {
      if (parameter.isNamed &&
          (parameter.simpleName == 'viewModel' ||
              parameter.type.reflectedType == viewModel.runtimeType)) {
        named[Symbol(parameter.simpleName)] = viewModel;
      } else {
        final dependency = _resolveParameter(parameter);
        if (parameter.isNamed) {
          named[Symbol(parameter.simpleName)] = dependency;
        } else {
          positional.add(dependency);
        }
      }
    }

    return viewMirror.newInstance('', positional, named) as Widget;
  }

  static MethodMirror _defaultConstructorMirror(ClassMirror mirror) {
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
}
