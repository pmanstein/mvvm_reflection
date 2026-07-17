import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpBadge')
Widget spBadgePreview() => SpBadge(text: 'Text');

enum SpBadgeTone { neutral, accent, success, danger, warning }

/// Small ALL-CAPS status badge (mono, wide tracking, pill).
class SpBadge extends StatelessWidget {
  const SpBadge({
    super.key,
    required this.text,
    this.tone = SpBadgeTone.neutral,
  });

  final String text;
  final SpBadgeTone tone;

  @override
  Widget build(BuildContext context) {
    final (background, foreground) = switch (tone) {
      SpBadgeTone.neutral => (SpColors.gray4, SpColors.textSecondary),
      SpBadgeTone.accent => (SpColors.accentMuted, SpColors.accent8),
      SpBadgeTone.success => (SpColors.accentMuted, SpColors.accent7),
      SpBadgeTone.danger => (SpColors.dangerMuted, SpColors.red8),
      SpBadgeTone.warning => (SpColors.warningMuted, SpColors.amber8),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: background,
        borderRadius: SpRadius.pillBr,
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontFamily: SpFonts.mono,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.35,
          letterSpacing: 0.48,
          color: foreground,
        ),
      ),
    );
  }
}
