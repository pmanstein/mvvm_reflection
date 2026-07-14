import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_reflaction/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:mvvm_reflaction/features/counter/presentation/view_models/counter_view_model.dart';

import 'counter_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IncrementCounterUseCase>()])
void main() {
  late CounterViewModel viewModel;

  late MockIncrementCounterUseCase incrementCounterUseCase;

  setUp(() {
    incrementCounterUseCase = MockIncrementCounterUseCase();

    when(incrementCounterUseCase.execute()).thenReturn(1);

    viewModel = CounterViewModel(
      incrementCounterUseCase: incrementCounterUseCase,
    );
  });

  test('incrementCommand updates counter state', () {
    viewModel.incrementCommand.run();

    expect(viewModel.count, 1);
  });
}
