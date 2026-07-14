import 'package:mvvm_reflaction/utils/result.dart';

abstract class CounterRepository {
  Result<int> getCurrentCount();
  Result<int> increment();
}
