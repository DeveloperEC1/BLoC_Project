import 'package:bloc_project/presentation/pages/page_counter_second.dart';
import 'package:bloc_project/presentation/providers/provider_counter_second/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_project/presentation/pages/page_counter_first.dart';
import 'package:bloc_project/presentation/providers/provider_counter_first/provider_counter_first.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProviderCounterFirst>(
            create: (_) => ProviderCounterFirst(),
          ),
          BlocProvider<CounterBloc>(
            create: (_) => CounterBloc(),
          ),
        ],
        child: const PageCounterSecond(),
      ),
    );
  }
}
