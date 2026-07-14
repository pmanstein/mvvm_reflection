import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_reflaction/utils/result.dart';

void main() {
  group('map', () {
    test('should map to Ok<Type>', () {
      final result = Result.ok(1);
      final mappedResult = result.map(
        onOk: (val) => val == 1,
        onError: (e) => e,
      );

      expect(mappedResult, isA<Ok<bool>>());
      expect((mappedResult as Ok<bool>).value, isTrue);
    });

    test('should map to Exception', () {
      final result = Result.error(Exception());

      expect(
        () => result.map(onOk: (_) {}, onError: (err) => throw err),
        throwsA(isA<Exception>()),
      );
    });
  });
}
