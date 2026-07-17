import 'package:flutter_test/flutter_test.dart';
import 'package:resolve_di/src/bind.dart';

class _DoubleConverter extends BindConverter<int, int> {
  const _DoubleConverter();

  @override
  int call(int input) => input * 2;
}

class _StringLengthConverter extends BindConverter<String, int> {
  const _StringLengthConverter();

  @override
  int call(String input) => input.length;
}

void main() {
  group('Bind', () {
    test('stores viewProperty and viewModelProperty', () {
      const bind = Bind('count', 'counter');

      expect(bind.viewProperty, equals('count'));
      expect(bind.viewModelProperty, equals('counter'));
    });

    test('has null converter by default', () {
      const bind = Bind('count', 'count');

      expect(bind.converter, isNull);
    });

    test('stores a converter when provided', () {
      const converter = _DoubleConverter();
      const bind = Bind('count', 'count', converter: converter);

      expect(bind.converter, same(converter));
    });

    test('can be instantiated as const', () {
      const bind = Bind('a', 'b', converter: _DoubleConverter());

      expect(bind, isNotNull);
    });
  });

  group('BindConverter', () {
    test('transforms input to output via call', () {
      const converter = _DoubleConverter();

      expect(converter(4), equals(8));
      expect(converter(0), equals(0));
      expect(converter(-3), equals(-6));
    });

    test('different converter types work correctly', () {
      const converter = _StringLengthConverter();

      expect(converter('hello'), equals(5));
      expect(converter(''), equals(0));
    });

    test('can be used as callable object (implicit call)', () {
      const converter = _DoubleConverter();

      final result = converter(7);

      expect(result, equals(14));
    });
  });
}
