import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<CounterIncrementEven>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });
    on<CounterDecrementEven>((event, emit) {
      if (state.count <= 0) {
        emit(CounterState(count: 0));
      } else {
        emit(CounterState(count: state.count - 1));
      }
    });
  }
}
