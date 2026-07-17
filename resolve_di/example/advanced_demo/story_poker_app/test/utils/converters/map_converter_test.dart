import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_poker_app/utils/converters/converters.dart';

void main() {
  group('MapConverter', () {
    test('converts Command<void,void> to a void Function()', () {
      final converter = MapConverter<Command<void, void>, void Function()>(
        (input) =>
            () => input.run(),
      );

      final command = Command.createSyncNoParamNoResult(() {});

      final callback = converter(command);

      expect(callback, isA<void Function()>());
    });

    test('returned callback executes the command when called', () {
      bool executed = false;
      final command = Command.createSyncNoParamNoResult(() {
        executed = true;
      });

      final converter = MapConverter<Command<void, void>, void Function()>(
        (input) =>
            () => input.run(),
      );
      final callback = converter(command);

      callback();

      expect(executed, isTrue);
    });

    test('can be used multiple times on the same command', () {
      int callCount = 0;
      final command = Command.createSyncNoParamNoResult(() => callCount++);

      final converter = MapConverter<Command<void, void>, void Function()>(
        (input) =>
            () => input.run(),
      );
      final callback = converter(command);

      callback();
      callback();
      callback();

      expect(callCount, equals(3));
    });
  });
}
