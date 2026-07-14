import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_reflaction/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:mvvm_reflaction/features/counter/presentation/view_models/counter_view_model.dart';
import 'package:mvvm_reflaction/utils/result.dart';

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
