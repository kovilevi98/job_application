import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application/bloc/app_bloc/event.dart';
import 'package:job_application/bloc/app_bloc/state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;

  CounterBloc() : super(InitialState()) {
    on<NumberIncrease>(onNumberIncrease);
    on<NumberDecrease>(onNumberDecrease);
  }

  void onNumberIncrease(
      NumberIncrease event, Emitter<CounterStates> emit) async {
    counter = counter + 1;
    emit(UpdateState(counter));
  }

  void onNumberDecrease(
      NumberDecrease event, Emitter<CounterStates> emit) async {
    counter = counter - 1;
    emit(UpdateState(counter));
  }
}
