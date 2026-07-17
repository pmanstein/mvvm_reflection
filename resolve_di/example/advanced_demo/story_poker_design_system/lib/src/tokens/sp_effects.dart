import 'package:flutter/animation.dart';
import 'package:flutter/painting.dart';

import 'sp_colors.dart';

/// Motion durations - fast and functional, no decorative motion.
abstract final class SpDurations {
  static const Duration fast = Duration(milliseconds: 120);
  static const Duration base = Duration(milliseconds: 180);
  static const Duration slow = Duration(milliseconds: 280);
}

/// Motion curves.
abstract final class SpCurves {
  /// cubic-bezier(0.2, 0.8, 0.2, 1)
  static const Curve standard = Cubic(0.2, 0.8, 0.2, 1);

  /// cubic-bezier(0.16, 1, 0.3, 1)
  static const Curve easeOut = Cubic(0.16, 1, 0.3, 1);

  /// cubic-bezier(0.4, 0, 1, 1)
  static const Curve easeIn = Cubic(0.4, 0, 1, 1);
}

/// Shadows and glows. Cards use borders, not drop shadows, at rest.
/// The accent glow is the one "glow" motif - used deliberately and rarely
/// (the user's selected vote card, live/active indicators).
abstract final class SpShadows {
  static const List<BoxShadow> sm = [
    BoxShadow(offset: Offset(0, 1), blurRadius: 2, color: Color(0x66000000)),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(offset: Offset(0, 4), blurRadius: 12, color: Color(0x73000000)),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(offset: Offset(0, 12), blurRadius: 32, color: Color(0x80000000)),
  ];

  static const List<BoxShadow> overlay = [
    BoxShadow(offset: Offset(0, 24), blurRadius: 64, color: Color(0x99000000)),
  ];

  /// 0 0 0 1px accent-border, 0 0 24px -8px accent
  static const List<BoxShadow> glowAccent = [
    BoxShadow(color: SpColors.accentBorder, spreadRadius: 1),
    BoxShadow(color: SpColors.accent, blurRadius: 24, spreadRadius: -8),
  ];

  /// 0 0 0 1px accent, 0 0 32px -4px accent
  static const List<BoxShadow> glowAccentStrong = [
    BoxShadow(color: SpColors.accent, spreadRadius: 1),
    BoxShadow(color: SpColors.accent, blurRadius: 32, spreadRadius: -4),
  ];
}

/// Misc effect tokens.
abstract final class SpEffects {
  /// Blur sigma for modal backdrops (the only place blur is allowed).
  static const double overlayBlurSigma = 8;

  /// Hairline border width.
  static const double borderWidth = 1;
}
