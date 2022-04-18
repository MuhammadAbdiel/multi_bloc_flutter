import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/color/color_bloc.dart';
import 'package:multi_bloc/bloc/counter/counter_bloc.dart';
import 'package:multi_bloc/ui/draft_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, state) {
        return DraftPage(
          backgroundColor: state.color,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<CounterBloc>().add(
                              ToIncrement(count: 1),
                            );
                      },
                      child: Text(
                        state.count.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(
                              ToBlueEvent(),
                            );
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: state.color == Colors.blue
                            ? const CircleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              )
                            : const CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(
                              ToAmberEvent(),
                            );
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: state.color == Colors.amber
                            ? const CircleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              )
                            : const CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(
                              ToPurpleEvent(),
                            );
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        shape: state.color == Colors.purple
                            ? const CircleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              )
                            : const CircleBorder(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.amber,
                        Colors.purple,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        context.read<CounterBloc>().add(
                              ResetCount(),
                            );
                      },
                      child: const Center(
                        child: Text(
                          'Reset Number',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
