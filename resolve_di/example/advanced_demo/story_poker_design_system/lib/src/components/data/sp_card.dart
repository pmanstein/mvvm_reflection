import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../internal/sp_pressable.dart';

@Preview(name: 'SpCard')
Widget spCardPreview() => SpCard(child: Container());

/// Surface card: card fill, 1px hairline border, medium radius,
/// no shadow at rest. Interactive cards (with [onTap]) raise one
/// surface step on hover - hover lightens, never darkens.
class SpCard extends StatelessWidget {
  const SpCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(SpSpacing.s6),
    this.raised = false,
    this.accent = false,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  /// Render on the raised surface tone.
  final bool raised;

  /// Accent border (e.g. highlighting the active session).
  final bool accent;

  /// Makes the card interactive (hover raise + press scale).
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget decorated(bool hovered, bool focused) {
      final elevated = raised || hovered;
      return AnimatedContainer(
        duration: SpDurations.fast,
        curve: SpCurves.easeOut,
        padding: padding,
        decoration: BoxDecoration(
          color: elevated ? SpColors.bgCardRaised : SpColors.bgCard,
          borderRadius: SpRadius.mdBr,
          border: Border.all(
            color: accent
                ? SpColors.accentBorder
                : (elevated ? SpColors.borderDefault : SpColors.borderSubtle),
          ),
          boxShadow: focused ? spFocusRing() : null,
        ),
        child: child,
      );
    }

    if (onTap == null) return decorated(false, false);

    return SpPressable(
      onPressed: onTap,
      isButton: false,
      builder: (context, state) => decorated(state.hovered, state.focused),
    );
  }
}
