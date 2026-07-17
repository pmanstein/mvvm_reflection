import 'package:story_poker_features/src/counter/domain/repositories/counter_repository.dart';
import 'package:story_poker_shared/shared.dart';
import 'package:resolve_di/resolve_di.dart';

@inject
class CounterRepositoryImpl implements CounterRepository {
  int _count = 0;

  @override
  Result<int> getCurrentCount() => Result.ok(_count);

  @override
  Result<int> increment() => Result.ok(++_count);
}
