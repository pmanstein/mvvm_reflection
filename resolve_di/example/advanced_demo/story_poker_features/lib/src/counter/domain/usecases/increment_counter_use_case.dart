import 'package:story_poker_features/src/counter/domain/repositories/counter_repository.dart';
import 'package:story_poker_shared/shared.dart';
import 'package:resolve_di/resolve_di.dart';

@inject
class IncrementCounterUseCase {
  final CounterRepository _counterRepository;

  IncrementCounterUseCase(this._counterRepository);

  Result<int> execute() {
    return _counterRepository.increment();
  }
}
