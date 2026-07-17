import 'package:flutter/material.dart';
import 'package:resolve_di/src/bind.dart';
import 'package:resolve_di/src/dependency_container.dart';
import 'package:resolve_di/src/reflector.dart';
import 'package:resolve_di/src/injectable_page.dart';

export 'src/bind.dart';
export 'src/injectable_page.dart';

/// Annotation to register for reflection
const inject = Reflector();

/// default container for dependecies, using the `@inject`-annotation
final _defaultContainer = DependencyContainer(inject);

/// Resolves the depency and all it sub-dependcies as lazy singletons
T resolve<T>() => _defaultContainer.resolve<T>();

/// Resolves a new [InjectablePage] with its ViewModel and explicit [bindings].
///
/// Each [Bind] in [bindings] declares which ViewModel property maps to which
/// View constructor parameter, and how to convert the value (if needed).
///
/// ```dart
/// resolveView<CounterView, CounterViewModel>({
///   Bind('count', 'count'),
///   Bind('onPressed', 'saveCommand', converter: const CommandRunConverter()),
/// })
/// ```
InjectablePage<W, VM> resolveView<W extends Widget, VM extends ChangeNotifier>(
  Set<Bind> bindings,
) => _defaultContainer.resolveView<W, VM>(bindings);

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
