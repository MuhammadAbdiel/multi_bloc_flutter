import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/color/color_bloc.dart';
import 'package:multi_bloc/bloc/counter/counter_bloc.dart';
import 'package:multi_bloc/ui/draft_page.dart';
import 'package:multi_bloc/ui/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorBloc, ColorState>(
      listener: (context, state) {
        if (state is ToAmberState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Successfully changed to Amber',
              ),
              duration: Duration(
                milliseconds: 1000,
              ),
            ),
          );
        } else if (state is ToPurpleState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Successfully changed to Purple',
              ),
              duration: Duration(
                milliseconds: 1000,
              ),
            ),
          );
        } else if (state is ToBlueState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Successfully changed to Blue',
              ),
              duration: Duration(
                milliseconds: 1000,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return DraftPage(
          backgroundColor: state.color,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<CounterBloc, CounterState>(
                  listener: (context, state) {
                    if (state is IncrementCounter) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Successfully Increased Counter',
                          ),
                          duration: Duration(
                            milliseconds: 1000,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state.count.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Click to Change',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: state.color,
                    shape: const StadiumBorder(),
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
