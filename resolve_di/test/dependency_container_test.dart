import 'package:flutter_test/flutter_test.dart';
import 'package:resolve_di/src/dependency_container.dart';
import 'package:resolve_di/src/reflector.dart';

import 'dependency_container_test.reflectable.dart';

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
}
