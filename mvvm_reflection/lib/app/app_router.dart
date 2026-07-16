import 'package:go_router/go_router.dart';
import 'package:mvvm_reflection/features/counter/counter.dart';
import 'package:resolve_di/resolve_di.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            resolveView<CounterView, CounterViewModel>(),
      ),
    ],
  );
}
