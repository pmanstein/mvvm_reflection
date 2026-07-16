import 'package:flutter/material.dart';

/// Abstract widget to bind View to ViewModel
abstract class InjectablePage<VM extends ChangeNotifier>
    extends StatefulWidget {
  final VM viewModel;

  const InjectablePage({super.key, required this.viewModel});

  @override
  State<InjectablePage<VM>> createState() => _InjectablePageState<VM>();

  Widget build(BuildContext context);
}

class _InjectablePageState<T extends ChangeNotifier>
    extends State<InjectablePage<T>> {
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
