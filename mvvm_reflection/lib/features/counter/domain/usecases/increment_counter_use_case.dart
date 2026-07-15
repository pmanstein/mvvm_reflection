import 'package:mvvm_reflection/app/reflector.dart';
import 'package:mvvm_reflection/features/counter/domain/repositories/counter_repository.dart';
import 'package:mvvm_reflection/utils/result.dart';

@appReflector
class IncrementCounterUseCase {
  final CounterRepository _counterRepository;

  IncrementCounterUseCase(this._counterRepository);

  Result<int> execute() {
    return _counterRepository.increment();
  }
}
