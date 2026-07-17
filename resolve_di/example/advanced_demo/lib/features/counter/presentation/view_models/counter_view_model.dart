import 'package:flutter/foundation.dart';
import 'package:command_it/command_it.dart';
import 'package:logging/logging.dart';
import 'package:advanced_demo/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:resolve_di/resolve_di.dart';

@inject
class CounterViewModel extends ChangeNotifier {
  final _log = Logger('CounterViewModel');

  final IncrementCounterUseCase _incrementCounterUseCase;

  int _count = 0;
  int get count => _count;

  late final Command<void, void> incrementCommand =
      Command.createSyncNoParamNoResult(_handleIncrement);

  CounterViewModel({required IncrementCounterUseCase incrementCounterUseCase})
    : _incrementCounterUseCase = incrementCounterUseCase;

  void _handleIncrement() {
    try {
      final nextCount = _incrementCounterUseCase.execute().fold(
        onOk: (value) => value,
        onError: (error) {
          _log.log(Level.WARNING, 'Failed to increment counter: $error');
          return _count;
        },
      );

      _count = nextCount;
      notifyListeners();
    } catch (error, stackTrace) {
      _log.log(
        Level.WARNING,
        'Increment command failed unexpectedly.',
        error,
        stackTrace,
      );
    }
  }

  @override
  void dispose() {
    incrementCommand.dispose();
    super.dispose();
  }
}
