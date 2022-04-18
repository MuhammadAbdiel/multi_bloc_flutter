part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class ToIncrement extends CounterEvent {
  final int count;

  ToIncrement({this.count = 1});
}

class ResetCount extends CounterEvent {}
