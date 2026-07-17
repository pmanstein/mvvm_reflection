import 'package:flutter/material.dart';

/// Widget to bind View to ViewModel,
/// also disposes the ViewModel when the Widget is disposed,
/// and rebuilds the Widget when the ViewModel notifies listeners.
class InjectablePage<W extends Widget, VM extends ChangeNotifier>
    extends StatefulWidget {
  final VM viewModel;
  final W Function(VM viewModel) viewBuilder;

  W get view => viewBuilder(viewModel);

  const InjectablePage({
    super.key,
    required this.viewModel,
    required this.viewBuilder,
  });

  @override
  State<InjectablePage<W, VM>> createState() => _InjectablePageState<W, VM>();

  Widget build(BuildContext context) => viewBuilder(viewModel);
}

class _InjectablePageState<W extends Widget, T extends ChangeNotifier>
    extends State<InjectablePage<W, T>> {
  @override
  void didUpdateWidget(InjectablePage<W, T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.dispose();
    }
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: widget.viewModel,
    builder: (context, _) => widget.build(context),
  );
}
