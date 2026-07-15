import 'package:flutter/material.dart';
import 'package:mvvm_reflection/app/reflector.dart';
import 'package:mvvm_reflection/features/counter/presentation/view_models/counter_view_model.dart';

@appReflector
class CounterPage extends StatefulWidget {
  final CounterViewModel viewModel;

  const CounterPage({super.key, required this.viewModel});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have pushed the button this many times:'),
                Text(
                  '${widget.viewModel.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.viewModel.incrementCommand.run,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
