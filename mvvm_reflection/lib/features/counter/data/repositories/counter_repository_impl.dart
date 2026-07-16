import 'package:mvvm_reflection/features/counter/domain/repositories/counter_repository.dart';
import 'package:mvvm_reflection/utils/result.dart';
import 'package:resolve_di/resolve_di.dart';

@inject
class CounterRepositoryImpl implements CounterRepository {
  int _count = 0;

  @override
  Result<int> getCurrentCount() => Result.ok(_count);

  @override
  Result<int> increment() => Result.ok(++_count);
}
