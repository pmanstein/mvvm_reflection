import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../components/data/sp_avatar.dart';
import '../components/data/sp_card.dart';
import '../components/data/sp_progress_bar.dart';
import '../components/feedback/sp_badge.dart';
import '../components/feedback/sp_dialog.dart';
import '../components/feedback/sp_tag.dart';
import '../components/feedback/sp_toast.dart';
import '../components/feedback/sp_tooltip.dart';
import '../components/forms/sp_button.dart';
import '../components/forms/sp_checkbox.dart';
import '../components/forms/sp_icon_button.dart';
import '../components/forms/sp_input.dart';
import '../components/forms/sp_select.dart';
import '../components/forms/sp_switch.dart';
import '../components/poker/sp_participant_row.dart';
import '../components/poker/sp_vote_card.dart';
import '../tokens/sp_colors.dart';
import '../tokens/sp_spacing.dart';
import '../tokens/sp_typography.dart';

@Preview(name: 'SpGallery')
Widget spGalleryPreview() => SpGallery();

/// Component showcase - mount it on a dev route to eyeball every
/// component in one place.
class SpGallery extends StatefulWidget {
  const SpGallery({super.key});

  @override
  State<SpGallery> createState() => _SpGalleryState();
}

class _SpGalleryState extends State<SpGallery> {
  bool _checked = true;
  bool _switched = false;
  String _selectValue = 'fib';
  String? _vote = '8';

  static const _deck = ['1', '2', '3', '5', '8', '13', '21', '?'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpColors.bgCanvas,
      appBar: AppBar(title: const Text('Sprint Poker Design System')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SpSpacing.s6),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: SpSpacing.containerMax),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _section('Buttons'),
                Wrap(
                  spacing: SpSpacing.s3,
                  runSpacing: SpSpacing.s3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SpButton(label: 'Start round', onPressed: () {}),
                    SpButton(
                      label: 'Copy invite link',
                      variant: SpButtonVariant.secondary,
                      onPressed: () {},
                    ),
                    SpButton(
                      label: 'Skip story',
                      variant: SpButtonVariant.ghost,
                      onPressed: () {},
                    ),
                    SpButton(
                      label: 'Leave session',
                      variant: SpButtonVariant.danger,
                      onPressed: () {},
                    ),
                    const SpButton(label: 'Disabled'),
                    SpIconButton(
                      icon: const Icon(Icons.settings),
                      label: 'Settings',
                      onPressed: () {},
                    ),
                    SpIconButton(
                      icon: const Icon(Icons.notifications),
                      label: 'Notifications',
                      variant: SpIconButtonVariant.outline,
                      onPressed: () {},
                    ),
                  ],
                ),
                _section('Vote cards'),
                Wrap(
                  spacing: SpSpacing.s3,
                  runSpacing: SpSpacing.s3,
                  children: [
                    for (final value in _deck)
                      SpVoteCard(
                        value: value,
                        state: _vote == value
                            ? SpVoteCardState.selected
                            : SpVoteCardState.idle,
                        onPressed: () => setState(() => _vote = value),
                      ),
                    const SpVoteCard(
                      value: '5',
                      state: SpVoteCardState.facedown,
                    ),
                    const SpVoteCard(
                      value: '5',
                      state: SpVoteCardState.revealed,
                    ),
                  ],
                ),
                _section('Participants'),
                SpCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpSpacing.s4,
                    vertical: SpSpacing.s2,
                  ),
                  child: Column(
                    children: [
                      SpParticipantRow(
                        name: 'Philipp Manstein',
                        role: 'Engineer',
                        voteState: SpVoteState.voted,
                        isYou: true,
                      ),
                      const SpParticipantRow(
                        name: 'Priya Nair',
                        role: 'Engineer',
                        voteState: SpVoteState.revealed,
                        voteValue: '8',
                      ),
                      const SpParticipantRow(
                        name: 'Jonas Weber',
                        voteState: SpVoteState.waiting,
                      ),
                    ],
                  ),
                ),
                _section('Forms'),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpInput(
                        label: 'Session name',
                        placeholder: 'Sprint 42 refinement',
                      ),
                      const SizedBox(height: SpSpacing.s4),
                      const SpInput(
                        label: 'Session code',
                        placeholder: 'X7K-2QF',
                        mono: true,
                        error: 'Session not found - check the link',
                      ),
                      const SizedBox(height: SpSpacing.s4),
                      SpSelect<String>(
                        label: 'Deck',
                        value: _selectValue,
                        options: const [
                          SpSelectOption(value: 'fib', label: 'Fibonacci'),
                          SpSelectOption(
                            value: 'tshirt',
                            label: 'T-shirt sizes',
                          ),
                          SpSelectOption(value: 'powers', label: 'Powers of 2'),
                        ],
                        onChanged: (v) =>
                            setState(() => _selectValue = v ?? 'fib'),
                      ),
                      const SizedBox(height: SpSpacing.s4),
                      SpCheckbox(
                        value: _checked,
                        label: 'Auto-reveal when everyone voted',
                        onChanged: (v) => setState(() => _checked = v),
                      ),
                      const SizedBox(height: SpSpacing.s3),
                      SpSwitch(
                        value: _switched,
                        label: 'Spectator mode',
                        onChanged: (v) => setState(() => _switched = v),
                      ),
                    ],
                  ),
                ),
                _section('Feedback'),
                Wrap(
                  spacing: SpSpacing.s3,
                  runSpacing: SpSpacing.s3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const SpBadge(text: 'Round 3'),
                    const SpBadge(text: 'Live', tone: SpBadgeTone.accent),
                    const SpBadge(text: 'Consensus', tone: SpBadgeTone.success),
                    const SpBadge(text: 'Ended', tone: SpBadgeTone.danger),
                    const SpBadge(text: 'Waiting', tone: SpBadgeTone.warning),
                    SpTag(text: 'backend', onRemove: () {}),
                    const SpTag(text: 'sprint-42'),
                    SpTooltip(
                      label: 'Average of revealed votes',
                      child: Text(
                        'AVG 7.4',
                        style: SpTypography.meta.copyWith(
                          color: SpColors.textSecondary,
                        ),
                      ),
                    ),
                    SpButton(
                      label: 'Show dialog',
                      variant: SpButtonVariant.secondary,
                      onPressed: () => showSpDialog<void>(
                        context: context,
                        builder: (dialogContext) => SpDialog(
                          title: 'End session?',
                          onClose: () => Navigator.of(dialogContext).pop(),
                          content: const Text(
                            'All votes and round history will be kept. '
                            'Participants are disconnected.',
                          ),
                          actions: [
                            SpButton(
                              label: 'Cancel',
                              variant: SpButtonVariant.ghost,
                              onPressed: () =>
                                  Navigator.of(dialogContext).pop(),
                            ),
                            SpButton(
                              label: 'End session',
                              variant: SpButtonVariant.danger,
                              onPressed: () =>
                                  Navigator.of(dialogContext).pop(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SpButton(
                      label: 'Show toast',
                      variant: SpButtonVariant.secondary,
                      onPressed: () => showSpToast(
                        context,
                        message: 'Invite link copied',
                        tone: SpToastTone.success,
                      ),
                    ),
                  ],
                ),
                _section('Data'),
                Wrap(
                  spacing: SpSpacing.s3,
                  runSpacing: SpSpacing.s3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    SpAvatar(name: 'Philipp Manstein', online: true),
                    SpAvatar(name: 'Priya Nair'),
                    SpAvatar(name: 'Jonas Weber', size: 48, online: true),
                  ],
                ),
                const SizedBox(height: SpSpacing.s4),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: SpProgressBar(value: 3, total: 5, label: 'Votes'),
                ),
                const SizedBox(height: SpSpacing.s16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: SpSpacing.s8, bottom: SpSpacing.s4),
      child: Text(
        title,
        style: SpTypography.h3.copyWith(color: SpColors.textPrimary),
      ),
    );
  }
}
