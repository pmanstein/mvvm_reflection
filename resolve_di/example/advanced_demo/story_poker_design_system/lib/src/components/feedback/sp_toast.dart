import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpToast')
Widget SpToastPreview() => SpToast(message: 'Message');

enum SpToastTone { neutral, success, danger }

/// Toast visual: raised surface, tone-colored 1px border and status dot.
class SpToast extends StatelessWidget {
  const SpToast({
    super.key,
    required this.message,
    this.tone = SpToastTone.neutral,
    this.onClose,
  });

  final String message;
  final SpToastTone tone;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final (borderColor, dotColor) = switch (tone) {
      SpToastTone.neutral => (SpColors.borderDefault, SpColors.textPrimary),
      SpToastTone.success => (SpColors.accent, SpColors.accent7),
      SpToastTone.danger => (SpColors.danger, SpColors.red8),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: SpColors.bgCardRaised,
        borderRadius: SpRadius.smBr,
        border: Border.all(color: borderColor),
        boxShadow: SpShadows.md,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration:
                BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              style:
                  SpTypography.bodySm.copyWith(color: SpColors.textPrimary),
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: SpSpacing.s2),
            GestureDetector(
              onTap: onClose,
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(
                  Icons.close,
                  size: 14,
                  color: SpColors.textTertiary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Shows a toast at the bottom center via the root [Overlay].
/// It fades/slides in and auto-dismisses after [duration].
void showSpToast(
  BuildContext context, {
  required String message,
  SpToastTone tone = SpToastTone.neutral,
  Duration duration = const Duration(seconds: 3),
}) {
  final overlay = Overlay.of(context, rootOverlay: true);
  late final OverlayEntry entry;
  Timer? timer;

  void dismiss() {
    timer?.cancel();
    if (entry.mounted) entry.remove();
  }

  entry = OverlayEntry(
    builder: (context) {
      return Positioned(
        left: 0,
        right: 0,
        bottom: SpSpacing.s6,
        child: SafeArea(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: SpDurations.base,
            curve: SpCurves.easeOut,
            builder: (context, t, child) {
              return Opacity(
                opacity: t,
                child: Transform.translate(
                  offset: Offset(0, (1 - t) * 8),
                  child: child,
                ),
              );
            },
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: SpToast(
                  message: message,
                  tone: tone,
                  onClose: dismiss,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

  overlay.insert(entry);
  timer = Timer(duration, dismiss);
}
