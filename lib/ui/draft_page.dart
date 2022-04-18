import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;

  const DraftPage({
    Key? key,
    this.backgroundColor = Colors.blue,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Multi BLoC in Multipage App'),
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
