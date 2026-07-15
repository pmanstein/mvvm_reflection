import 'package:mvvm_reflection/features/counter/domain/repositories/counter_repository.dart';
import 'package:mvvm_reflection/utils/result.dart';

class CounterRepositoryImpl extends CounterRepository {
  int _count = 0;

  @override
  Result<int> getCurrentCount() => Result.ok(_count);

  @override
  Result<int> increment() => Result.ok(++_count);
}
