import 'package:flutter/material.dart';

import '../tokens/sp_colors.dart';
import '../tokens/sp_effects.dart';
import '../tokens/sp_spacing.dart';
import '../tokens/sp_typography.dart';

/// Sprint Poker theme.
///
/// The system is dark-only: flat layered surfaces, 1px hairline borders,
/// a single lime-green accent, no ripples, no elevation shadows at rest.
abstract final class SpTheme {
  static ThemeData dark() {
    const colorScheme = ColorScheme.dark(
      primary: SpColors.accent,
      onPrimary: SpColors.textOnAccent,
      secondary: SpColors.accent,
      onSecondary: SpColors.textOnAccent,
      surface: SpColors.bgSurface,
      onSurface: SpColors.textPrimary,
      surfaceContainerHighest: SpColors.bgCardRaised,
      onSurfaceVariant: SpColors.textSecondary,
      error: SpColors.danger,
      onError: SpColors.white,
      outline: SpColors.borderDefault,
      outlineVariant: SpColors.borderSubtle,
    );

    final textTheme = TextTheme(
      displayLarge: SpTypography.display.copyWith(color: SpColors.textPrimary),
      headlineLarge: SpTypography.h1.copyWith(color: SpColors.textPrimary),
      headlineMedium: SpTypography.h2.copyWith(color: SpColors.textPrimary),
      headlineSmall: SpTypography.h3.copyWith(color: SpColors.textPrimary),
      bodyLarge: SpTypography.bodyLg.copyWith(color: SpColors.textPrimary),
      bodyMedium: SpTypography.body.copyWith(color: SpColors.textPrimary),
      bodySmall: SpTypography.bodySm.copyWith(color: SpColors.textSecondary),
      labelLarge: SpTypography.body.copyWith(
        color: SpColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: SpTypography.caption.copyWith(color: SpColors.textSecondary),
      labelSmall: SpTypography.meta.copyWith(color: SpColors.textSecondary),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: SpColors.bgCanvas,
      canvasColor: SpColors.bgSurface,
      cardColor: SpColors.bgCard,
      dividerColor: SpColors.borderSubtle,
      fontFamily: SpFonts.sans,
      textTheme: textTheme,
      // No ripples - press feedback is scale + color, like a physical card.
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: SpColors.bgCardRaised,
      focusColor: SpColors.focusRing.withValues(alpha: 0.4),
      iconTheme: const IconThemeData(color: SpColors.textSecondary, size: 20),
      appBarTheme: AppBarThemeData(
        backgroundColor: SpColors.bgCanvas,
        foregroundColor: SpColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: SpTypography.h3.copyWith(color: SpColors.textPrimary),
      ),
      cardTheme: const CardThemeData(
        color: SpColors.bgCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: SpRadius.mdBr,
          side: BorderSide(color: SpColors.borderSubtle),
        ),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: SpColors.bgCard,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: SpRadius.lgBr,
          side: BorderSide(color: SpColors.borderDefault),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: SpColors.borderSubtle,
        thickness: SpEffects.borderWidth,
        space: SpEffects.borderWidth,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: SpColors.gray4,
          borderRadius: SpRadius.xsBr,
          border: Border.all(color: SpColors.borderStrong),
        ),
        textStyle: SpTypography.caption.copyWith(color: SpColors.textPrimary),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        waitDuration: const Duration(milliseconds: 300),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: SpColors.accent,
        selectionColor: SpColors.accent.withValues(alpha: 0.3),
        selectionHandleColor: SpColors.accent,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: const WidgetStatePropertyAll(SpColors.gray5),
        radius: const Radius.circular(SpRadius.pill),
      ),
    );
  }
}
