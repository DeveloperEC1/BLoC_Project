import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/data/models/counter_model/counter_model.dart';

class ProviderCounterFirst extends Cubit<CounterModel> {
  ProviderCounterFirst() : super(const CounterModel());

  void incrementCounter() => emit(state.copyWith(count: state.count + 1));

  void decrementCounter() => emit(state.copyWith(count: state.count - 1));
}
