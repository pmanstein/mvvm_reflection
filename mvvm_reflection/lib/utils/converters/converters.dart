import 'package:command_it/command_it.dart';
import 'package:resolve_di/resolve_di.dart';

/// Converts a [Command<void, void>] into a [void Function()] callback.
///
/// Used to bind a ViewModel's command to a View's `onPressed`-style parameter:
///
/// ```dart
/// Bind('onPressed', 'submitCommand', converter: const CommandRunConverter())
/// ```
class CommandRunConverter
    extends BindConverter<Command<void, void>, void Function()> {
  const CommandRunConverter();

  @override
  void Function() call(Command<void, void> command) =>
      () => command.run();
}

/// Converts a [I] into a [O] using a provided mapping function.
///
/// Used for converting a ViewModel's property to a View's property.
///
/// ```dart
/// Bind('userList', 'firstUser', converter: MapConverter((vm) => vm.first))
/// ```
class MapConverter<I, O> extends BindConverter<I, O> {
  final O Function(I) _mapper;

  const MapConverter(this._mapper);

  @override
  O call(I input) => _mapper(input);
}
