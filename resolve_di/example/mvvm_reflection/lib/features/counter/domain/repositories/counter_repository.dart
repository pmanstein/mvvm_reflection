import 'package:mvvm_reflection/utils/result.dart';
import 'package:resolve_di/resolve_di.dart';

@inject
abstract interface class CounterRepository {
  Result<int> getCurrentCount();
  Result<int> increment();
}
