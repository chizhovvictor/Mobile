import 'package:flutter/material.dart';

class WeeklyPage extends StatelessWidget {
  const WeeklyPage({super.key, required this.input});

  final String input;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Weekly',
          ),
          Text(
            input,
          ),
        ],
      ),
    );
  }
}
