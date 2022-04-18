part of 'color_bloc.dart';

@immutable
abstract class ColorEvent {}

class ToAmberEvent extends ColorEvent {
  final Color color;

  ToAmberEvent({this.color = Colors.blue});
}

class ToPurpleEvent extends ColorEvent {
  final Color color;

  ToPurpleEvent({this.color = Colors.blue});
}

class ToBlueEvent extends ColorEvent {}
