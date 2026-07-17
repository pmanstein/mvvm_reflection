import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpInput')
Widget spInputPreview() => SpInput();

enum SpInputSize { sm, md }

/// Text input with optional label and error line.
///
/// Set [mono] for identity-like values (session codes, numbers) - the
/// mono/sans split signals "this is data".
class SpInput extends StatelessWidget {
  const SpInput({
    super.key,
    this.label,
    this.placeholder,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.mono = false,
    this.error,
    this.size = SpInputSize.md,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.focusNode,
  });

  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool mono;

  /// Error message. Specific and actionable
  /// ("Session not found - check the link"), never "Oops!".
  final String? error;

  final SpInputSize size;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final contentPadding = size == SpInputSize.sm
        ? const EdgeInsets.symmetric(horizontal: 10, vertical: 6)
        : const EdgeInsets.symmetric(horizontal: 12, vertical: 10);

    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: SpRadius.smBr,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    final baseBorderColor = error != null
        ? SpColors.danger
        : SpColors.borderDefault;
    final focusBorderColor = error != null
        ? SpColors.danger
        : SpColors.focusRing;

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
        TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autofocus: autofocus,
          focusNode: focusNode,
          cursorColor: SpColors.accent,
          style: (mono ? SpTypography.mono : SpTypography.body).copyWith(
            color: enabled ? SpColors.textPrimary : SpColors.textDisabled,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: (mono ? SpTypography.mono : SpTypography.body).copyWith(
              color: SpColors.textTertiary,
            ),
            isDense: true,
            filled: true,
            fillColor: SpColors.bgCard,
            contentPadding: contentPadding,
            enabledBorder: border(baseBorderColor),
            focusedBorder: border(focusBorderColor, width: 2),
            disabledBorder: border(SpColors.borderSubtle),
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 6),
          Text(
            error!,
            style: SpTypography.caption.copyWith(color: SpColors.danger),
          ),
        ],
      ],
    );
  }
}
