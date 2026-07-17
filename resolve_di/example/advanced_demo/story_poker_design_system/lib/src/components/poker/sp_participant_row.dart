import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpParticipantRow')
Widget spParticipantRowPreview() => SpParticipantRow(
  name: 'Alice',
  role: 'Developer',
  voteState: SpVoteState.revealed,
  voteValue: '5',
  isYou: true,
);

/// Vote status of a participant in the presence list.
enum SpVoteState { waiting, voted, revealed }

/// Presence-list row: status dot, name (+ optional role), and the vote
/// state on the right - "Waiting" (tertiary), "Voted" (accent), or the
/// revealed value in mono.
///
/// Use second person for the active user ([isYou]), names for others.
class SpParticipantRow extends StatelessWidget {
  const SpParticipantRow({
    super.key,
    required this.name,
    this.role,
    this.voteState = SpVoteState.waiting,
    this.voteValue,
    this.isYou = false,
  });

  final String name;
  final String? role;
  final SpVoteState voteState;

  /// The revealed estimate - required when [voteState] is
  /// [SpVoteState.revealed].
  final String? voteValue;

  final bool isYou;

  @override
  Widget build(BuildContext context) {
    final (stateLabel, stateColor) = switch (voteState) {
      SpVoteState.waiting => ('Waiting', SpColors.textTertiary),
      SpVoteState.voted => ('Voted', SpColors.accent),
      SpVoteState.revealed => (voteValue ?? '-', SpColors.textPrimary),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SpSpacing.s1,
        vertical: SpSpacing.s2,
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: voteState == SpVoteState.waiting
                  ? SpColors.gray5
                  : SpColors.accent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: SpSpacing.s3),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: isYou ? '$name (you)' : name,
                style: SpTypography.body.copyWith(
                  color: SpColors.textPrimary,
                  fontWeight: isYou ? FontWeight.w600 : FontWeight.w400,
                ),
                children: [
                  if (role != null)
                    TextSpan(
                      text: '  $role',
                      style: SpTypography.caption.copyWith(
                        color: SpColors.textTertiary,
                      ),
                    ),
                ],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: SpSpacing.s3),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 36),
            child: Text(
              stateLabel,
              textAlign: TextAlign.right,
              style: SpTypography.monoSm.copyWith(color: stateColor),
            ),
          ),
        ],
      ),
    );
  }
}
