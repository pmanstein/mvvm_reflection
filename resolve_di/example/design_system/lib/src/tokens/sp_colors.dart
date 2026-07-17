import 'dart:ui';

/// Sprint Poker color tokens.
///
/// Port of `Sprint Poker Design System/tokens/colors.css`.
/// Near-black slate neutrals with a single bold accent (signal lime-green).
abstract final class SpColors {
  // Neutrals (gray-0 ... gray-10).
  static const Color gray0 = Color(0xFF0A0C10);
  static const Color gray1 = Color(0xFF12151B);
  static const Color gray2 = Color(0xFF171B22);
  static const Color gray3 = Color(0xFF1E232C);
  static const Color gray4 = Color(0xFF2A303B);
  static const Color gray5 = Color(0xFF3A4150);
  static const Color gray6 = Color(0xFF535C6C);
  static const Color gray7 = Color(0xFF7A8496);
  static const Color gray8 = Color(0xFFA6AEBC);
  static const Color gray9 = Color(0xFFCDD3DC);
  static const Color gray10 = Color(0xFFEDEFF2);
  static const Color white = Color(0xFFFFFFFF);

  // Accent scale (signal lime-green).
  static const Color accent1 = Color(0xFF0E1A08);
  static const Color accent2 = Color(0xFF1B2E0C);
  static const Color accent3 = Color(0xFF2C4A12);
  static const Color accent4 = Color(0xFF456B18);
  static const Color accent5 = Color(0xFF6B9E24);
  static const Color accent6 = Color(0xFF9FEF00);
  static const Color accent7 = Color(0xFFB8FF33);
  static const Color accent8 = Color(0xFFD2FF80);

  // Semantic color scales (semantic-only, never decorative).
  static const Color red6 = Color(0xFFF0435E);
  static const Color red8 = Color(0xFFFF8FA3);
  static const Color amber6 = Color(0xFFF5A623);
  static const Color amber8 = Color(0xFFFFCC70);
  static const Color blue6 = Color(0xFF3D9CF5);
  static const Color blue8 = Color(0xFF9CCBFA);

  // Backgrounds (layered surface tones: canvas -> surface -> card -> raised).
  static const Color bgCanvas = gray0;
  static const Color bgSurface = gray1;
  static const Color bgCard = gray2;
  static const Color bgCardRaised = gray3;
  static const Color bgInset = gray0;

  /// rgba(6, 8, 11, 0.72) - modal/overlay scrim.
  static const Color bgOverlay = Color(0xB806080B);

  // Borders (1px hairlines are the primary structure on dark surfaces).
  static const Color borderSubtle = gray3;
  static const Color borderDefault = gray4;
  static const Color borderStrong = gray5;
  static const Color borderAccent = accent6;

  // Text.
  static const Color textPrimary = gray10;
  static const Color textSecondary = gray8;
  static const Color textTertiary = gray6;
  static const Color textDisabled = gray5;
  static const Color textOnAccent = gray0;
  static const Color textInverse = gray0;

  // Accent semantics.
  static const Color accent = accent6;
  static const Color accentHover = accent7;
  static const Color accentActive = accent5;
  static const Color accentMuted = accent2;
  static const Color accentBorder = accent4;

  // Status.
  static const Color success = accent6;
  static const Color danger = red6;
  static const Color dangerMuted = Color(0xFF2A1116);
  static const Color warning = amber6;
  static const Color warningMuted = Color(0xFF3A2A0C);
  static const Color info = blue6;
  static const Color focusRing = accent6;

  // Vote card semantics.
  static const Color voteFill = accent2;
  static const Color voteBorder = accent4;
  static const Color voteSelectedBg = accent6;
  static const Color voteSelectedText = gray0;
}
