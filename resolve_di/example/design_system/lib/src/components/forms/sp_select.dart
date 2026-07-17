import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpSelect')
Widget spSelectPreview() => SpSelect(
  options: const [
    SpSelectOption(value: 1, label: 'Option 1'),
    SpSelectOption(value: 2, label: 'Option 2'),
  ],
);

/// A single option for [SpSelect].
class SpSelectOption<T> {
  const SpSelectOption({required this.value, required this.label});

  final T value;
  final String label;
}

/// Styled dropdown select with optional label.
class SpSelect<T> extends StatelessWidget {
  const SpSelect({
    super.key,
    required this.options,
    this.value,
    this.onChanged,
    this.label,
    this.placeholder,
    this.expanded = true,
  });

  final List<SpSelectOption<T>> options;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final String? placeholder;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: SpTypography.caption.copyWith(color: SpColors.textSecondary),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: SpColors.bgCard,
            borderRadius: SpRadius.smBr,
            border: Border.all(color: SpColors.borderDefault),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              onChanged: onChanged,
              isExpanded: expanded,
              isDense: true,
              padding: const EdgeInsets.symmetric(vertical: 9),
              borderRadius: SpRadius.smBr,
              dropdownColor: SpColors.bgCardRaised,
              focusColor: Colors.transparent,
              style: SpTypography.body.copyWith(color: SpColors.textPrimary),
              icon: const Icon(
                Icons.expand_more,
                size: 18,
                color: SpColors.textTertiary,
              ),
              hint: placeholder != null
                  ? Text(
                      placeholder!,
                      style: SpTypography.body.copyWith(
                        color: SpColors.textTertiary,
                      ),
                    )
                  : null,
              items: [
                for (final option in options)
                  DropdownMenuItem<T>(
                    value: option.value,
                    child: Text(option.label),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
