import 'package:flutter/foundation.dart';
import 'package:command_it/command_it.dart';
import 'package:mvvm_reflection/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:resolve_di/resolve_di.dart';

@inject
class CounterViewModel extends ChangeNotifier {
  final IncrementCounterUseCase _incrementCounterUseCase;

  int _count = 0;

  CounterViewModel({required IncrementCounterUseCase incrementCounterUseCase})
    : _incrementCounterUseCase = incrementCounterUseCase;

  late final Command<void, void> incrementCommand =
      Command.createSyncNoParamNoResult(_handleIncrement);

  int get count => _count;

  void _handleIncrement() {
    final nextCount = _incrementCounterUseCase.execute().fold(
      onOk: (value) => value,
      onError: (error) {
        if (kDebugMode) {
          debugPrint('Failed to increment counter: $error');
        }
        return _count;
      },
    );

    _count = nextCount;
    notifyListeners();
  }

  @override
  void dispose() {
    incrementCommand.dispose();
    super.dispose();
  }
}
