import 'package:go_router/go_router.dart';
import 'package:mvvm_reflaction/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:mvvm_reflaction/features/counter/domain/usecases/increment_counter_use_case.dart';
import 'package:mvvm_reflaction/features/counter/presentation/view/counter_page.dart';
import 'package:mvvm_reflaction/features/counter/presentation/view_models/counter_view_model.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          final viewModel = CounterViewModel(
            incrementCounterUseCase: IncrementCounterUseCase(
              CounterRepositoryImpl(),
            ),
          );
          return CounterPage(viewModel: viewModel);
        },
      ),
    ],
  );
}
