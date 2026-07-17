import 'package:flutter/painting.dart';

/// Font families bundled with the `design_system` package.
///
/// The `packages/design_system/` prefix is required because the fonts are
/// declared in this package's pubspec, not in the consuming app.
abstract final class SpFonts {
  static const String sans = 'packages/design_system/Inter';
  static const String mono = 'packages/design_system/JetBrainsMono';
}

/// Sprint Poker type scale.
///
/// Port of `Sprint Poker Design System/tokens/typography.css` (1rem = 16px).
/// Inter for UI text, JetBrains Mono for anything numeric or identity-like
/// (vote values, averages, session codes, timestamps).
///
/// Styles carry no color - color comes from the theme or the component.
abstract final class SpTypography {
  // --- Sans (Inter) ------------------------------------------------------

  /// Hero numerals / display headline.
  static const TextStyle display = TextStyle(
    fontFamily: SpFonts.sans,
    fontSize: 40,
    fontWeight: FontWeight.w800,
    height: 1.15,
    letterSpacing: -0.8, // -0.02em
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: SpFonts.sans,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.64,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: SpFonts.sans,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.48,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: SpFonts.sans,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: SpFonts.sans,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle body = TextStyle(
    fontFamily: SpFonts.sans,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: SpFonts.sans,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: SpFonts.sans,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.35,
    letterSpacing: 0.48, // 0.04em
  );

  // --- Mono (JetBrains Mono) - numbers are data, not prose ---------------

  static const TextStyle monoLg = TextStyle(
    fontFamily: SpFonts.mono,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static const TextStyle mono = TextStyle(
    fontFamily: SpFonts.mono,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle monoSm = TextStyle(
    fontFamily: SpFonts.mono,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  /// ALL-CAPS metadata labels ("ROUND 3", "AVG"): caption size, mono,
  /// widest tracking (0.12em). Uppercase the content yourself.
  static const TextStyle meta = TextStyle(
    fontFamily: SpFonts.mono,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.35,
    letterSpacing: 1.44, // 0.12em
  );
}
