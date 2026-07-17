import 'package:go_router/go_router.dart';
import 'package:advanced_demo/features/counter/counter.dart';
import 'package:advanced_demo/utils/converters/converters.dart';
import 'package:resolve_di/resolve_di.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => resolveView<CounterView, CounterViewModel>({
          const Bind('count', 'count'),
          const Bind(
            'incrementCommand',
            'incrementCommand',
            converter: CommandRunConverter(),
          ),
          // Alternatively, you can use a MapConverter to achieve the same effect as CommandRunConverter:
          // Bind(
          //   'incrementCommand',
          //   'incrementCommand',
          //   converter: MapConverter<Command<void, void>, void Function()>(
          //     (incrementCommand) =>
          //         () => incrementCommand.run(),
          //   ),
          // ),
        }),
      ),
    ],
  );
}
