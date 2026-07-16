import 'package:flutter/material.dart';
import 'package:resolve_di/resolve_di.dart';
import 'package:resolve_di/src/dependency_container.dart';
import 'package:resolve_di/src/reflector.dart';

export 'src/injectable_page.dart';

/// Annotation to register for reflection
const inject = Reflector();

/// default container for dependecies, using the `@inject`-annotation
final _defaultContainer = DependencyContainer(inject);

/// Resolves the depency and all it sub-dependcies as lazy singletons
T resolve<T>() => _defaultContainer.resolve<T>();

/// Resolves a new InjectablePage  and all it sub-dependcies as lazy singletons
T resolveView<T extends InjectablePage<VM>, VM extends ChangeNotifier>() =>
    _defaultContainer.resolveView<T, VM>();

/// Override dependencies with this method
/// Example, using an explixit Interface for a Repository:
/// ```dart
/// void main() {
/// // Initialize reflectable from generarted file:
/// // import 'package:mvvm_reflection/main.reflectable.dart';
///  initializeReflectable();
///  // Use CounterRepositoryImpl as implementation of CounterRepository Interface
///  registerDependencies({CounterRepository: CounterRepositoryImpl});
///
///  runApp(const App());
/// }
/// ```
void registerDependencies(Map<Type, Type> selectedBindings) =>
    _defaultContainer.registerDependencies(selectedBindings);
