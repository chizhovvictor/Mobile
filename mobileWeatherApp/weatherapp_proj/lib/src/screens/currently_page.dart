import 'package:flutter/material.dart';

class CurrentlyPage extends StatelessWidget {
  const CurrentlyPage({super.key, required this.input});
  final String input;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Currently',
          ),
          Text(
            input,
          ),
        ],
      ),
    );
  }
}
