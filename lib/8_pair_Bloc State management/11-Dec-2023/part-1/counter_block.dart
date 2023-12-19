import 'package:flutter_bloc/flutter_bloc.dart';


import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCountEvent>((event, emit) {
      //emit(state + 1);
      emit(state+event.value);
    });
    on<DecrementCountEvent>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });
  }
}
