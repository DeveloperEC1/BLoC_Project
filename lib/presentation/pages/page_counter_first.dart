import 'package:flutter/material.dart';
import 'package:bloc_project/data/models/counter_model/counter_model.dart';
import 'package:bloc_project/presentation/providers/provider_counter_first/provider_counter_first.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageCounterFirst extends StatefulWidget {
  const PageCounterFirst({super.key});

  @override
  State<PageCounterFirst> createState() => _PageCounterFirstState();
}

class _PageCounterFirstState extends State<PageCounterFirst> {
  @override
  Widget build(BuildContext context) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _CountText(),
      floatingActionButton: _FloatingActionButton(),
    );
  }
}

class _CountText extends StatelessWidget {
  const _CountText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderCounterFirst, CounterModel>(
      builder: (context, state) {
        return Center(
          child: Text(
            '${state.count}',
            style: const TextStyle(fontSize: 36),
          ),
        );
      },
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<ProviderCounterFirst>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: counterBloc.incrementCounter,
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          onPressed: counterBloc.decrementCounter,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
