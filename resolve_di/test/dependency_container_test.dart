import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resolve_di/resolve_di.dart';
import 'package:resolve_di/src/bind.dart';
import 'package:resolve_di/src/dependency_container.dart';
import 'package:resolve_di/src/reflector.dart';
import 'package:command_it/command_it.dart';

import 'dependency_container_test.reflectable.dart';

/// Converter used in tests to turn a [Command<void,void>] into a [void Function()].
class _VoidCommandConverter
    extends BindConverter<Command<void, void>, void Function()> {
  const _VoidCommandConverter();

  @override
  void Function() call(Command<void, void> command) =>
      () => command.run();
}

const testReflector = Reflector();

@testReflector
class A {
  bool isGreaterThan(int value) => 5 > value;
}

@testReflector
abstract interface class InterfaceA {
  bool isGreaterThan(int value);
}

@testReflector
class B implements InterfaceA {
  @override
  bool isGreaterThan(int value) => 10 > value;
}

@testReflector
class C implements InterfaceA {
  @override
  bool isGreaterThan(int value) => 2 > value;
}

@testReflector
class NamedDependency {
  bool isGreaterThan(int value) => 20 > value;
}

@testReflector
class NamedConsumer {
  final NamedDependency dependency;

  NamedConsumer({required this.dependency});
}

@testReflector
class ViewModel extends ChangeNotifier {
  final A dependency;

  ViewModel({required this.dependency});

  bool isGreaterThan(int value) => dependency.isGreaterThan(value);
}

@testReflector
class View extends StatelessWidget {
  final bool Function(int value) isGreaterThan;

  const View({required this.isGreaterThan})
    : super(key: const ValueKey('View'));

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('Button'),
      onPressed: () {
        final _ = isGreaterThan(5);
      },
    );
  }
}

class NonInjectedView extends StatelessWidget {
  const NonInjectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@testReflector
class CommandViewModel extends ChangeNotifier {
  final A dependency;

  int _count = 0;
  int get count => _count;

  late final Command<void, void> incrementCommand =
      Command.createSyncNoParamNoResult(_runIncrementCommand);

  CommandViewModel({required this.dependency});

  void _runIncrementCommand() {
    _count++;
    notifyListeners();
  }
}

@testReflector
class CommandView extends StatelessWidget {
  final void Function() incrementCommand;

  const CommandView({required this.incrementCommand})
    : super(key: const ValueKey('CommandView'));

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@testReflector
class CounterSnapshotView extends StatelessWidget {
  final int count;
  final void Function() incrementCommand;

  const CounterSnapshotView({
    required this.count,
    required this.incrementCommand,
  }) : super(key: const ValueKey('CounterSnapshotView'));

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

void main() {
  initializeReflectable();

  late DependencyContainer testContainer;

  setUp(() {
    testContainer = DependencyContainer(testReflector);
  });

  group('resolve', () {
    test('should resolve a dependency', () {
      final a = testContainer.resolve<A>();

      expect(a.isGreaterThan(3), isTrue);
      expect(a.isGreaterThan(6), isFalse);
    });

    test('should resolve a dependency with named constructor parameters', () {
      final namedConsumer = testContainer.resolve<NamedConsumer>();

      expect(namedConsumer.dependency.isGreaterThan(15), isTrue);
      expect(namedConsumer.dependency.isGreaterThan(25), isFalse);
    });

    test(
      'should throw an error when trying to resolve a dependency that is not registered',
      () {
        expect(
          () => testContainer.resolve<String>(),
          throwsA(isA<StateError>()),
        );
      },
    );
  });

  group('register', () {
    test('should register a dependency', () {
      testContainer.registerDependencies({InterfaceA: B});

      final a = testContainer.resolve<InterfaceA>();

      expect(a, isA<B>());
      expect(a.isGreaterThan(5), isTrue);
      expect(a.isGreaterThan(11), isFalse);
    });

    test(
      'should override a dependency when registering a new implementation for the same interface',
      () {
        testContainer.registerDependencies({InterfaceA: B});
        testContainer.registerDependencies({InterfaceA: C});

        final a = testContainer.resolve<InterfaceA>();

        expect(a, isA<C>());
        expect(a.isGreaterThan(1), isTrue);
        expect(a.isGreaterThan(3), isFalse);
      },
    );
  });

  group('resolveView', () {
    test('should resolve a view with its view model', () {
      final injectedPage = testContainer.resolveView<View, ViewModel>({
        Bind('isGreaterThan', 'isGreaterThan'),
      });

      expect(injectedPage.view.isGreaterThan(4), isTrue);
    });

    test(
      'should resolve a view with its view model, but resolving the view model fails due to missing dependencies',
      () {
        final injectedPage = testContainer.resolveView<View, ViewModel>({});

        expect(injectedPage, isA<InjectablePage<View, ViewModel>>());

        expect(
          () => injectedPage.viewBuilder(injectedPage.viewModel),
          throwsA(isA<StateError>()),
        );
      },
    );

    test(
      'should throw an error when trying to resolve a view that is not registered',
      () {
        expect(
          () => testContainer.resolveView<NonInjectedView, ViewModel>({}),
          throwsA(isA<StateError>()),
        );
      },
    );

    test('should bind Command to void Function() via converter', () {
      final injectedPage = testContainer
          .resolveView<CommandView, CommandViewModel>({
            Bind(
              'incrementCommand',
              'incrementCommand',
              converter: const _VoidCommandConverter(),
            ),
          });

      expect(injectedPage.viewModel.count, equals(0));

      injectedPage.view.incrementCommand();

      expect(injectedPage.viewModel.count, equals(1));
    });

    test('should create a fresh view model instance per resolved view', () {
      const bindings = {
        Bind(
          'incrementCommand',
          'incrementCommand',
          converter: _VoidCommandConverter(),
        ),
      };

      final firstPage = testContainer
          .resolveView<CommandView, CommandViewModel>(bindings);
      final secondPage = testContainer
          .resolveView<CommandView, CommandViewModel>(bindings);

      expect(identical(firstPage.viewModel, secondPage.viewModel), isFalse);
    });

    test(
      'should rebuild view with updated view model values after command run',
      () {
        final injectedPage = testContainer
            .resolveView<CounterSnapshotView, CommandViewModel>({
              Bind('count', 'count'),
              Bind(
                'incrementCommand',
                'incrementCommand',
                converter: const _VoidCommandConverter(),
              ),
            });

        expect(injectedPage.view.count, equals(0));

        injectedPage.view.incrementCommand();

        expect(injectedPage.view.count, equals(1));
      },
    );
  });
}
