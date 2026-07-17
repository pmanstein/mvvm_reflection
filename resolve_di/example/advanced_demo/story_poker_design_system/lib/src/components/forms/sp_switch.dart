import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';
import '../internal/sp_pressable.dart';

@Preview(name: 'SpSwitch')
Widget spSwitchPreview() => SpSwitch(value: true, label: 'Label');

/// 36x20 toggle switch with optional trailing label.
class SpSwitch extends StatelessWidget {
  const SpSwitch({super.key, required this.value, this.onChanged, this.label});

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      toggled: value,
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
                width: 36,
                height: 20,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: value ? SpColors.accent : SpColors.gray5,
                  borderRadius: SpRadius.pillBr,
                  boxShadow: state.focused ? spFocusRing() : null,
                ),
                child: AnimatedAlign(
                  duration: SpDurations.fast,
                  curve: SpCurves.easeOut,
                  alignment: value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: SpColors.gray0,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              if (label != null) ...[
                const SizedBox(width: SpSpacing.s2 + 2),
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
