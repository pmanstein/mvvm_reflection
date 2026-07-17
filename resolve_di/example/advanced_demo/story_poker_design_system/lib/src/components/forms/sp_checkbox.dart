import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';
import '../internal/sp_pressable.dart';

@Preview(name: 'SpCheckbox')
Widget spCheckboxPreview() => SpCheckbox(value: true, label: 'Label');

/// 18x18 checkbox with optional trailing label.
class SpCheckbox extends StatelessWidget {
  const SpCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      checked: value,
      child: SpPressable(
        onPressed: onChanged == null ? null : () => onChanged!(!value),
        pressedScale: 1,
        semanticLabel: label,
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: SpDurations.fast,
                curve: SpCurves.easeOut,
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: value ? SpColors.accent : Colors.transparent,
                  borderRadius: SpRadius.xsBr,
                  border: Border.all(
                    color: value
                        ? SpColors.accent
                        : (state.hovered
                              ? SpColors.gray6
                              : SpColors.borderStrong),
                  ),
                  boxShadow: state.focused ? spFocusRing() : null,
                ),
                child: value
                    ? const Icon(
                        Icons.check,
                        size: 14,
                        color: SpColors.textOnAccent,
                      )
                    : null,
              ),
              if (label != null) ...[
                const SizedBox(width: SpSpacing.s2),
                Text(
                  label!,
                  style: SpTypography.body.copyWith(
                    color: SpColors.textPrimary,
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
