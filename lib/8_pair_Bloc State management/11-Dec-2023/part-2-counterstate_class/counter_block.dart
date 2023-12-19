import 'package:databases_flutter_class/7_pair_Provider/cubit/without%20database/12th-pair_09-Dec-2023/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<IncrementCountEvent>((event, emit) {
      //emit(state + 1);
      emit(CounterState(count: state.count + event.value));
    });
    on<DecrementCountEvent>((event, emit) {
      if (state.count > 0) {
        emit(CounterState(count: state.count - 1));
      }
    });
  }
}

