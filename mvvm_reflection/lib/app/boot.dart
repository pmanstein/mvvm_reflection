import 'package:mvvm_reflection/app/service_locator.dart';
import 'package:mvvm_reflection/app/view_resolver.dart';
import 'package:mvvm_reflection/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:mvvm_reflection/features/counter/domain/repositories/counter_repository.dart';
import 'package:mvvm_reflection/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:mvvm_reflection/features/counter/presentation/view/counter_page.dart';
import 'package:mvvm_reflection/features/counter/presentation/view_models/counter_view_model.dart';
import 'package:mvvm_reflection/main.reflectable.dart';

void bootstrapApp() {
  initializeReflectable();
  _registerDependencies();
  _ensureReflectableTypes();
  ViewResolver.initialize();
}

void _registerDependencies() {
  ServiceLocator.registerSingleton<CounterRepository>(CounterRepositoryImpl());
  ServiceLocator.registerFactory<IncrementCounterUseCase>(
    () => IncrementCounterUseCase(ServiceLocator.get<CounterRepository>()),
  );
}

void _ensureReflectableTypes() {
  // Keep the annotated view and view model types referenced so the tree
  // shaker does not remove them before reflectable can instantiate them.
  final types = <Type>[CounterPage, CounterViewModel];
  if (types.isEmpty) {
    throw StateError('No reflectable types were initialized.');
  }
}
