import 'package:mvvm_reflaction/app/reflector.dart';
import 'package:mvvm_reflaction/features/counter/domain/repositories/counter_repository.dart';
import 'package:mvvm_reflaction/utils/result.dart';

@appReflector
class IncrementCounterUseCase {
  final CounterRepository _counterRepository;

  IncrementCounterUseCase(this._counterRepository);

  Result<int> execute() {
    return _counterRepository.increment();
  }
}
