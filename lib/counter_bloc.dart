import 'package:bloc/bloc.dart';

import 'counter_stream_controller.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event == CounterEvent.increment) {
        emit(state + 1);
      } else {
        emit(state - 1);
      }
    });
  }

  int _counter = 0;

  int get initialData => _counter;
}
