import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_reflection/utils/converters/converters.dart';

void main() {
  group('CommandRunConverter', () {
    test('converts Command<void,void> to a void Function()', () {
      final converter = const CommandRunConverter();
      final command = Command.createSyncNoParamNoResult(() {});

      final callback = converter(command);

      expect(callback, isA<void Function()>());
    });

    test('returned callback executes the command when called', () {
      bool executed = false;
      final command = Command.createSyncNoParamNoResult(() {
        executed = true;
      });

      final callback = const CommandRunConverter()(command);
      callback();

      expect(executed, isTrue);
    });

    test('can be used multiple times on the same command', () {
      int callCount = 0;
      final command = Command.createSyncNoParamNoResult(() => callCount++);

      final callback = const CommandRunConverter()(command);
      callback();
      callback();
      callback();

      expect(callCount, equals(3));
    });

    test('is const-constructible and stateless', () {
      const a = CommandRunConverter();
      const b = CommandRunConverter();

      // Both instances behave identically – const ensures no state.
      final command = Command.createSyncNoParamNoResult(() {});
      expect(a(command), isA<void Function()>());
      expect(b(command), isA<void Function()>());
    });
  });
}
