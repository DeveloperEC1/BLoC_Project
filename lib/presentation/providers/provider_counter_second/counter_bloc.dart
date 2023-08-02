import 'package:bloc_project/data/models/counter_model/counter_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/presentation/providers/provider_counter_second/counter_event.dart';
import 'package:bloc_project/presentation/providers/provider_counter_second/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterModel counterModel = const CounterModel();

  CounterBloc() : super(CounterLogicState(const CounterModel())) {
    on<IncrementCounterEvent>(incrementCounter);
    on<DecrementCounterEvent>(decrementCounter);
  }

  void incrementCounter(
      IncrementCounterEvent event, Emitter<CounterState> emit) {
    counterModel = CounterModel(count: counterModel.count + 1);

    emit(CounterLogicState(counterModel));
  }

  void decrementCounter(
      DecrementCounterEvent event, Emitter<CounterState> emit) {
    counterModel = CounterModel(count: counterModel.count - 1);

    emit(CounterLogicState(counterModel));
  }
}
