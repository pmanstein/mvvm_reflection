import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_effects.dart';

@Preview(name: 'SpPressable')
Widget spPressablePreview() => SpPressable(
  builder: (BuildContext context, SpInteractionState state) => Container(),
);

/// Interaction state passed to [SpPressable.builder].
class SpInteractionState {
  const SpInteractionState({
    required this.hovered,
    required this.pressed,
    required this.focused,
    required this.enabled,
  });

  final bool hovered;
  final bool pressed;
  final bool focused;
  final bool enabled;
}

/// Shared interaction shell: hover, focus and press handling with the
/// system's press feedback (slight scale-down, "like pressing a physical
/// card") and keyboard activation. No Material ripple.
class SpPressable extends StatefulWidget {
  const SpPressable({
    super.key,
    required this.builder,
    this.onPressed,
    this.pressedScale = 0.97,
    this.semanticLabel,
    this.isButton = true,
  });

  final Widget Function(BuildContext context, SpInteractionState state) builder;
  final VoidCallback? onPressed;

  /// Scale while pressed (0.97 for buttons, 0.96 for vote cards).
  final double pressedScale;

  final String? semanticLabel;
  final bool isButton;

  @override
  State<SpPressable> createState() => _SpPressableState();
}

class _SpPressableState extends State<SpPressable> {
  bool _hovered = false;
  bool _pressed = false;
  bool _focused = false;

  bool get _enabled => widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    final state = SpInteractionState(
      hovered: _hovered && _enabled,
      pressed: _pressed && _enabled,
      focused: _focused && _enabled,
      enabled: _enabled,
    );

    return Semantics(
      button: widget.isButton,
      enabled: _enabled,
      label: widget.semanticLabel,
      child: FocusableActionDetector(
        enabled: _enabled,
        mouseCursor: _enabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onShowHoverHighlight: (value) => setState(() => _hovered = value),
        onShowFocusHighlight: (value) => setState(() => _focused = value),
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onPressed?.call();
              return null;
            },
          ),
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: _enabled ? (_) => setState(() => _pressed = true) : null,
          onTapUp: _enabled ? (_) => setState(() => _pressed = false) : null,
          onTapCancel: _enabled ? () => setState(() => _pressed = false) : null,
          onTap: widget.onPressed,
          child: AnimatedScale(
            scale: state.pressed ? widget.pressedScale : 1,
            duration: SpDurations.fast,
            curve: SpCurves.easeOut,
            child: widget.builder(context, state),
          ),
        ),
      ),
    );
  }
}

/// Focus ring helper: a 2px accent ring with a small offset, rendered as
/// box shadows so it never affects layout. Shadows paint in list order, so
/// the [background]-colored gap paints on top of the accent ring.
List<BoxShadow> spFocusRing({Color background = SpColors.bgCanvas}) => [
  const BoxShadow(color: SpColors.focusRing, spreadRadius: 3.5),
  BoxShadow(color: background, spreadRadius: 1.5),
];
