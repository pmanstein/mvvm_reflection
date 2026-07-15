import 'package:mvvm_reflection/utils/result.dart';

abstract class CounterRepository {
  Result<int> getCurrentCount();
  Result<int> increment();
}
