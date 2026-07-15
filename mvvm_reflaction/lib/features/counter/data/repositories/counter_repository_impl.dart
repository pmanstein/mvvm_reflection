import 'package:mvvm_reflaction/features/counter/domain/repositories/counter_repository.dart';
import 'package:mvvm_reflaction/utils/result.dart';

class CounterRepositoryImpl extends CounterRepository {
  int _count = 0;

  @override
  Result<int> getCurrentCount() => Result.ok(_count);

  @override
  Result<int> increment() => Result.ok(++_count);
}
