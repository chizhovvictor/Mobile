import 'package:flutter/material.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key, required this.input});
  final String input;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Today',
          ),
          Text(
            input,
          ),
        ],
      ),
    );
  }
}