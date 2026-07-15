import 'package:reflectable/reflectable.dart';

class AppReflector extends Reflectable {
  const AppReflector()
    : super(
        invokingCapability,
        newInstanceCapability,
        reflectedTypeCapability,
        metadataCapability,
        typeCapability,
        declarationsCapability,
      );
}

const appReflector = AppReflector();
