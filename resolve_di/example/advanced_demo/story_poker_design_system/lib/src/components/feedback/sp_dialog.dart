import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';
import '../../tokens/sp_spacing.dart';
import '../../tokens/sp_typography.dart';
import '../forms/sp_icon_button.dart';

@Preview(name: 'SpDialog')
Widget spDialogPreview() => SpDialog(title: 'Title');

/// Modal dialog panel: card surface, 1px border, large radius,
/// overlay shadow. Show it with [showSpDialog] to get the blurred,
/// dimmed backdrop (the only place blur is allowed in the system).
class SpDialog extends StatelessWidget {
  const SpDialog({
    super.key,
    required this.title,
    this.content,
    this.actions,
    this.onClose,
    this.width = 420,
  });

  final String title;
  final Widget? content;

  /// Right-aligned footer actions (typically [SpButton]s).
  final List<Widget>? actions;

  /// Shown as a close (X) button in the header when set.
  final VoidCallback? onClose;

  final double width;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: SpColors.bgCard,
          borderRadius: SpRadius.lgBr,
          border: Border.all(color: SpColors.borderDefault),
          boxShadow: SpShadows.overlay,
        ),
        child: Padding(
          padding: const EdgeInsets.all(SpSpacing.s6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: SpTypography.h3.copyWith(
                        color: SpColors.textPrimary,
                      ),
                    ),
                  ),
                  if (onClose != null)
                    SpIconButton(
                      icon: const Icon(Icons.close),
                      label: 'Close',
                      size: 28,
                      onPressed: onClose,
                    ),
                ],
              ),
              if (content != null) ...[
                const SizedBox(height: SpSpacing.s4),
                DefaultTextStyle.merge(
                  style: SpTypography.body.copyWith(
                    color: SpColors.textSecondary,
                  ),
                  child: content!,
                ),
              ],
              if (actions != null && actions!.isNotEmpty) ...[
                const SizedBox(height: SpSpacing.s6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (var i = 0; i < actions!.length; i++) ...[
                      if (i > 0) const SizedBox(width: SpSpacing.s3),
                      actions![i],
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Shows [dialog] above a dimmed, blurred scrim with a fast
/// fade/scale-in (180ms ease-out).
Future<T?> showSpDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: 'Dismiss',
    barrierColor: SpColors.bgOverlay,
    transitionDuration: SpDurations.base,
    pageBuilder: (context, animation, secondaryAnimation) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: SpEffects.overlayBlurSigma,
          sigmaY: SpEffects.overlayBlurSigma,
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(SpSpacing.s6),
              child: Material(
                color: Colors.transparent,
                child: builder(context),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: SpCurves.easeOut,
      );
      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.97, end: 1).animate(curved),
          child: child,
        ),
      );
    },
  );
}
