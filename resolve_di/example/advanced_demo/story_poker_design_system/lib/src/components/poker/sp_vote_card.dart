import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';
import '../internal/sp_pressable.dart';

@Preview(name: 'SpVoteCard')
Widget spVoteCardPreview() => SpVoteCard(
  value: '8',
  state: SpVoteCardState.idle,
  size: SpVoteCardSize.md,
);

/// Visual state of a [SpVoteCard]:
/// - [idle]: in the voting deck, clickable
/// - [selected]: the user's own pick - accent fill + glow (the one glow
///   motif in the system)
/// - [facedown]: another voter's card before reveal (shows "?")
/// - [revealed]: face-up in the results grid
enum SpVoteCardState { idle, selected, facedown, revealed }

enum SpVoteCardSize {
  sm(width: 44, height: 64, fontSize: 13),
  md(width: 64, height: 92, fontSize: 24),
  lg(width: 88, height: 128, fontSize: 40);

  const SpVoteCardSize({
    required this.width,
    required this.height,
    required this.fontSize,
  });

  final double width;
  final double height;
  final double fontSize;
}

/// The core planning-poker card primitive.
///
/// Press feedback is a quick 0.96 scale-down - tactile, like pressing a
/// physical card. Reveal transitions run at 180ms ease-out, no bounce.
class SpVoteCard extends StatelessWidget {
  const SpVoteCard({
    super.key,
    required this.value,
    this.state = SpVoteCardState.idle,
    this.size = SpVoteCardSize.md,
    this.onPressed,
  });

  /// The estimate shown on the card ("8", "13", "?", "☕" - as content).
  final String value;

  final SpVoteCardState state;
  final SpVoteCardSize size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SpPressable(
      onPressed: onPressed,
      pressedScale: 0.96,
      semanticLabel: state == SpVoteCardState.facedown
          ? 'Hidden vote'
          : 'Vote $value',
      builder: (context, interaction) {
        final hoverRaise = interaction.hovered && state == SpVoteCardState.idle;

        final (background, borderColor, textColor, shadows) = switch (state) {
          SpVoteCardState.idle => (
            hoverRaise ? SpColors.bgCardRaised : SpColors.bgCard,
            hoverRaise ? SpColors.borderStrong : SpColors.borderDefault,
            SpColors.textPrimary,
            const <BoxShadow>[],
          ),
          SpVoteCardState.selected => (
            SpColors.voteSelectedBg,
            SpColors.voteSelectedBg,
            SpColors.voteSelectedText,
            SpShadows.glowAccentStrong,
          ),
          SpVoteCardState.facedown => (
            SpColors.bgCardRaised,
            SpColors.borderStrong,
            SpColors.textTertiary,
            const <BoxShadow>[],
          ),
          SpVoteCardState.revealed => (
            SpColors.bgCardRaised,
            SpColors.borderDefault,
            SpColors.textPrimary,
            const <BoxShadow>[],
          ),
        };

        return AnimatedContainer(
          duration: SpDurations.base,
          curve: SpCurves.easeOut,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: background,
            borderRadius: SpRadius.mdBr,
            border: Border.all(color: borderColor),
            boxShadow: [...shadows, if (interaction.focused) ...spFocusRing()],
          ),
          alignment: Alignment.center,
          child: Text(
            state == SpVoteCardState.facedown ? '?' : value,
            style: TextStyle(
              fontFamily: SpFonts.mono,
              fontWeight: FontWeight.w700,
              fontSize: size.fontSize,
              height: 1,
              color: textColor,
            ),
          ),
        );
      },
    );
  }
}
