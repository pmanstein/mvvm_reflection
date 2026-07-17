/// Abstract base class for converters used in [Bind].
///
/// A [BindConverter] transforms a ViewModel value of type [I] into
/// a View-compatible value of type [O].
///
/// Implement this class to create reusable, statically-definable converters:
///
/// ```dart
/// class CommandRunConverter extends BindConverter<Command<void, void>, void Function()> {
///   const CommandRunConverter();
///
///   @override
///   void Function() call(Command<void, void> command) => () => command.run();
/// }
/// ```
abstract class BindConverter<I, O> {
  const BindConverter();

  O call(I input);
}

/// Declares a binding between a View constructor parameter and a ViewModel
/// property, with an optional [converter] to transform the value.
///
/// ```dart
/// // Direct binding – same name, same type:
/// Bind('count', 'count')
///
/// // Converted binding – Command → void Function():
/// Bind('onPressed', 'saveCommand', converter: const CommandRunConverter())
/// ```
class Bind {
  /// The name of the View's constructor parameter to bind to.
  final String viewProperty;

  /// The name of the ViewModel's property to read the value from.
  final String viewModelProperty;

  /// Optional converter that transforms the ViewModel value before it is
  /// passed to the View. When null the value is forwarded unchanged.
  final BindConverter? converter;

  /// Creates a [Bind] instance with the given [viewProperty], [viewModelProperty],
  /// and optional [converter].
  const Bind(this.viewProperty, this.viewModelProperty, {this.converter});
}
