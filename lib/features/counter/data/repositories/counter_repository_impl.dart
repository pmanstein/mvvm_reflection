import 'package:mvvm_reflaction/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl extends CounterRepository {
  int _count = 0;

  @override
  int getCurrentCount() => _count;

  @override
  int increment() => ++_count;
}
