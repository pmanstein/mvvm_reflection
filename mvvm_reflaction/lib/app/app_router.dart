import 'package:go_router/go_router.dart';
import 'package:mvvm_reflaction/app/view_resolver.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ViewResolver.resolvePage('CounterPage'),
      ),
    ],
  );
}
