import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpProgressBar')
Widget spProgressBarPreview() => SpProgressBar(value: 20, total: 100);

/// Thin accent progress bar with an optional label row
/// ("Votes" ... "3/5" in mono).
class SpProgressBar extends StatelessWidget {
  const SpProgressBar({
    super.key,
    required this.value,
    required this.total,
    this.label,
  });

  final int value;
  final int total;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final fraction = total <= 0
        ? 0.0
        : (value / total).clamp(0.0, 1.0).toDouble();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label!,
                style: SpTypography.caption.copyWith(
                  color: SpColors.textSecondary,
                ),
              ),
              Text(
                '$value/$total',
                style: SpTypography.monoSm.copyWith(
                  color: SpColors.textSecondary,
                  height: 1.35,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
        Semantics(
          label: label,
          value: '$value of $total',
          child: ClipRRect(
            borderRadius: SpRadius.pillBr,
            child: Container(
              height: 6,
              color: SpColors.gray3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedFractionallySizedBox(
                  duration: SpDurations.base,
                  curve: SpCurves.easeOut,
                  widthFactor: fraction,
                  heightFactor: 1,
                  child: const ColoredBox(color: SpColors.accent),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
