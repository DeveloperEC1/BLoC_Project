import 'package:bloc_project/presentation/providers/provider_counter_second/counter_bloc.dart';
import 'package:bloc_project/presentation/providers/provider_counter_second/counter_event.dart';
import 'package:bloc_project/presentation/providers/provider_counter_second/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageCounterSecond extends StatefulWidget {
  const PageCounterSecond({super.key});

  @override
  State<PageCounterSecond> createState() => _PageCounterSecondState();
}

class _PageCounterSecondState extends State<PageCounterSecond> {
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
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is CounterLogicState) {
          return Center(
            child: Text(
              '${state.counterModel.count}',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => counterBloc.add(IncrementCounterEvent()),
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          onPressed: () => counterBloc.add(DecrementCounterEvent()),
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
