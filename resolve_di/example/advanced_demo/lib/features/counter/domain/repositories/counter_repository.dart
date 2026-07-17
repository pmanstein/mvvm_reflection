import 'package:advanced_demo/utils/result.dart';
import 'package:resolve_di/resolve_di.dart';

@inject
abstract interface class CounterRepository {
  Result<int> getCurrentCount();
  Result<int> increment();
}
