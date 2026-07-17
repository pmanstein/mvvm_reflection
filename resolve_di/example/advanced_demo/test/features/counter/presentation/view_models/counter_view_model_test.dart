import 'package:advanced_demo/features/counter/counter.dart';
import 'package:advanced_demo/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:advanced_demo/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IncrementCounterUseCase>()])
void main() {
  late CounterViewModel viewModel;

  late MockIncrementCounterUseCase incrementCounterUseCase;

  setUp(() {
    incrementCounterUseCase = MockIncrementCounterUseCase();

    viewModel = CounterViewModel(
      incrementCounterUseCase: incrementCounterUseCase,
    );

    provideDummy<Result<int>>(Result.ok(1));
  });

  group('incrementCommand', () {
    test('updates counter state', () {
      viewModel.incrementCommand.run();

      expect(viewModel.count, 1);
    });

    test('does not update counter state when use case fails', () {
      when(
        incrementCounterUseCase.execute(),
      ).thenReturn(Result.error(Exception()));

      viewModel.incrementCommand.run();

      expect(viewModel.count, 0);
    });
  });
}
