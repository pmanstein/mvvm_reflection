import 'package:flutter/painting.dart';

/// Sprint Poker spacing scale (4px base unit).
///
/// Port of `Sprint Poker Design System/tokens/spacing.css`.
abstract final class SpSpacing {
  static const double s0 = 0;
  static const double s1 = 4;
  static const double s2 = 8;
  static const double s3 = 12;
  static const double s4 = 16;
  static const double s5 = 20;
  static const double s6 = 24;
  static const double s8 = 32;
  static const double s10 = 40;
  static const double s12 = 48;
  static const double s16 = 64;
  static const double s20 = 80;
  static const double s24 = 96;

  static const double containerMax = 1200;
  static const double gutter = 24;
}

/// Corner radii - small-to-medium, tool-like. Pill radius is reserved for
/// tags/badges/avatars only.
abstract final class SpRadius {
  static const double xs = 4;
  static const double sm = 6;
  static const double md = 10;
  static const double lg = 14;
  static const double xl = 20;
  static const double pill = 999;

  /// Default card radius.
  static const double card = md;

  static const BorderRadius xsBr = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius smBr = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdBr = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgBr = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlBr = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius pillBr = BorderRadius.all(Radius.circular(pill));
}
