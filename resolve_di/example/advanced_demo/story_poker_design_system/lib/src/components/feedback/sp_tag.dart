import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpTag')
Widget spTagPreview() => SpTag(text: 'Text');

/// Removable tag/chip on a raised surface.
class SpTag extends StatelessWidget {
  const SpTag({super.key, required this.text, this.onRemove});

  final String text;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 4, onRemove != null ? 6 : 10, 4),
      decoration: BoxDecoration(
        color: SpColors.bgCardRaised,
        borderRadius: SpRadius.pillBr,
        border: Border.all(color: SpColors.borderDefault),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: SpTypography.bodySm.copyWith(color: SpColors.textPrimary),
          ),
          if (onRemove != null) ...[
            const SizedBox(width: 6),
            GestureDetector(
              onTap: onRemove,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Semantics(
                  button: true,
                  label: 'Remove $text',
                  child: const Icon(
                    Icons.close,
                    size: 14,
                    color: SpColors.textTertiary,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
