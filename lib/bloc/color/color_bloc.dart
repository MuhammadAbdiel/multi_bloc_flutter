import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends HydratedBloc<ColorEvent, ColorState> {
  ColorBloc() : super(const ColorInitial()) {
    on<ToAmberEvent>((event, emit) {
      emit(const ToAmberState(Colors.amber));
    });
    on<ToPurpleEvent>((event, emit) {
      emit(const ToPurpleState(Colors.purple));
    });
    on<ToBlueEvent>((event, emit) {
      emit(const ToBlueState(Colors.blue));
    });
  }

  @override
  ColorState? fromJson(Map<String, dynamic> json) {
    return ColorState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ColorState state) {
    return state.toMap();
  }
}
