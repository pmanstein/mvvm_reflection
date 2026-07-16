import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:mvvm_reflection/features/counter/presentation/view_models/counter_view_model.dart';
import 'package:resolve_di/resolve_di.dart';

@inject
class CounterPage extends InjectablePage<CounterViewModel> {
  const CounterPage({required super.viewModel})
    : super(key: const ValueKey('CounterPage'));

  @override
  Widget build(BuildContext context) => CounterView(
    count: viewModel.count,
    incrementCommand: viewModel.incrementCommand.run,
  );
}

class CounterView extends StatelessWidget {
  final int count;
  final void Function() incrementCommand;

  const CounterView({
    required this.count,
    required this.incrementCommand,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    // App bar with a title
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Flutter Demo Home Page'),
    ),

    // Display the current count in the center of the screen
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          Text('$count', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    ),

    // Floating action button to increment the counter
    floatingActionButton: FloatingActionButton(
      onPressed: incrementCommand,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
  );
}

@Preview(name: 'CounterView')
Widget counterViewPreview() => CounterView(
  count: 123,
  incrementCommand: () {
    // Do nothing for the preview
  },
);
