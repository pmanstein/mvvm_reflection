import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';
import '../internal/sp_pressable.dart';

@Preview(name: 'SpButton')
Widget spButtonPreview() => SpButton(label: 'Label');

/// Button emphasis. Use [primary] for the single main action per screen
/// ("Start round", "Reveal votes"), [secondary] for supporting actions,
/// [ghost] for low-emphasis/inline actions, [danger] for destructive ones
/// ("Leave session", "End round").
enum SpButtonVariant { primary, secondary, ghost, danger }

enum SpButtonSize { sm, md, lg }

/// Sprint Poker button.
///
/// Hover lightens (never darkens), press scales down to 0.97,
/// disabled renders at 45% opacity. No ripple.
class SpButton extends StatelessWidget {
  const SpButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = SpButtonVariant.primary,
    this.size = SpButtonSize.md,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final SpButtonVariant variant;
  final SpButtonSize size;

  /// Optional leading icon (16-20px, monochrome).
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final (padding, fontSize) = switch (size) {
      SpButtonSize.sm => (
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        13.0,
      ),
      SpButtonSize.md => (
        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        15.0,
      ),
      SpButtonSize.lg => (
        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        17.0,
      ),
    };

    final enabled = onPressed != null;

    return Opacity(
      opacity: enabled ? 1 : 0.45,
      child: SpPressable(
        onPressed: onPressed,
        semanticLabel: label,
        builder: (context, state) {
          final (background, foreground, border) = switch (variant) {
            SpButtonVariant.primary => (
              state.hovered ? SpColors.accentHover : SpColors.accent,
              SpColors.textOnAccent,
              state.hovered ? SpColors.accentHover : SpColors.accent,
            ),
            SpButtonVariant.secondary => (
              state.hovered ? SpColors.gray4 : SpColors.bgCardRaised,
              SpColors.textPrimary,
              SpColors.borderDefault,
            ),
            SpButtonVariant.ghost => (
              state.hovered ? SpColors.bgCardRaised : Colors.transparent,
              state.hovered ? SpColors.textPrimary : SpColors.textSecondary,
              Colors.transparent,
            ),
            SpButtonVariant.danger => (
              state.hovered
                  ? SpColors.danger.withValues(alpha: 0.12)
                  : Colors.transparent,
              SpColors.danger,
              SpColors.danger,
            ),
          };

          return AnimatedContainer(
            duration: SpDurations.fast,
            curve: SpCurves.easeOut,
            padding: padding,
            decoration: BoxDecoration(
              color: background,
              borderRadius: SpRadius.smBr,
              border: Border.all(color: border),
              boxShadow: state.focused ? spFocusRing() : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  IconTheme.merge(
                    data: IconThemeData(color: foreground, size: fontSize + 2),
                    child: icon!,
                  ),
                  const SizedBox(width: SpSpacing.s2),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: SpFonts.sans,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                    color: foreground,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
