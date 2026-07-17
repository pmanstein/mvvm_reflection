import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpTooltip')
Widget SpTooltipPreview() => SpTooltip(label: 'Message', child: Container());

/// Themed tooltip: gray surface, 1px strong border, caption text.
class SpTooltip extends StatelessWidget {
  const SpTooltip({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      decoration: BoxDecoration(
        color: SpColors.gray4,
        borderRadius: SpRadius.xsBr,
        border: Border.all(color: SpColors.borderStrong),
      ),
      textStyle: SpTypography.caption.copyWith(color: SpColors.textPrimary),
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      verticalOffset: 22,
      waitDuration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}
