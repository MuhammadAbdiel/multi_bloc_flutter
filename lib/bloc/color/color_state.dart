part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;

  const ColorState(this.color);

  @override
  List<Object?> get props => [color];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll(
      {
        'color': color.value,
      },
    );

    return result;
  }

  factory ColorState.fromMap(Map<String, dynamic> map) {
    return ColorState(
      Color(
        map['color'],
      ),
    );
  }
}

class ColorInitial extends ColorState {
  const ColorInitial() : super(Colors.blue);
}

class ColorChange extends ColorState {
  const ColorChange(Color color) : super(color);
}

class ToAmberState extends ColorState {
  const ToAmberState(Color color) : super(color);
}

class ToPurpleState extends ColorState {
  const ToPurpleState(Color color) : super(color);
}

class ToBlueState extends ColorState {
  const ToBlueState(Color color) : super(color);
}
