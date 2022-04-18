import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<ToIncrement>((event, emit) {
      emit(
        state is IncrementCounter
            ? IncrementCounter(state.count + event.count)
            : IncrementCounter(event.count),
      );
    });
    on<ResetCount>((event, emit) {
      emit(const CounterInitial());
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
