import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../internal/sp_pressable.dart';

@Preview(name: 'SpIconButton')
Widget spIconButtonPreview() =>
    SpIconButton(icon: const Icon(Icons.add), label: 'Add');

enum SpIconButtonVariant { ghost, outline }

/// Square icon-only button. Always provide a [label] - it becomes the
/// tooltip and the semantic label.
class SpIconButton extends StatelessWidget {
  const SpIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.size = 36,
    this.active = false,
    this.variant = SpIconButtonVariant.ghost,
  });

  final Widget icon;
  final String label;
  final VoidCallback? onPressed;
  final double size;

  /// Active/toggled state - accent icon on a raised surface (ghost variant).
  final bool active;
  final SpIconButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final button = SpPressable(
      onPressed: onPressed,
      semanticLabel: label,
      builder: (context, state) {
        final (background, foreground, border) = switch (variant) {
          SpIconButtonVariant.ghost => (
            active || state.hovered
                ? SpColors.bgCardRaised
                : Colors.transparent,
            active
                ? SpColors.accent
                : (state.hovered
                      ? SpColors.textPrimary
                      : SpColors.textSecondary),
            Colors.transparent,
          ),
          SpIconButtonVariant.outline => (
            state.hovered ? SpColors.bgCardRaised : SpColors.bgCard,
            SpColors.textPrimary,
            SpColors.borderDefault,
          ),
        };

        return AnimatedContainer(
          duration: SpDurations.fast,
          curve: SpCurves.easeOut,
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: background,
            borderRadius: SpRadius.smBr,
            border: Border.all(color: border),
            boxShadow: state.focused ? spFocusRing() : null,
          ),
          child: Center(
            child: IconTheme.merge(
              data: IconThemeData(color: foreground, size: size * 0.5),
              child: icon,
            ),
          ),
        );
      },
    );

    return Tooltip(message: label, child: button);
  }
}
