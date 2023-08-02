import 'package:bloc_project/data/models/counter_model/counter_model.dart';

class CounterState {}

class CounterLogicState extends CounterState {
  final CounterModel counterModel;

  CounterLogicState(this.counterModel);
}
