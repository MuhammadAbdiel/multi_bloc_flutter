part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);

  @override
  List<Object> get props => [count];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll(
      {
        'count': count,
      },
    );

    return result;
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      map['count']?.toInt() ?? 0,
    );
  }
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class IncrementCounter extends CounterState {
  const IncrementCounter(int count) : super(count);
}
