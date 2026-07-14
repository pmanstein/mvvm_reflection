import 'package:mvvm_reflaction/features/counter/domain/repositories/counter_repository.dart';

class IncrementCounterUseCase {
  final CounterRepository _counterRepository;

  IncrementCounterUseCase(this._counterRepository);

  int execute() {
    return _counterRepository.increment();
  }
}
