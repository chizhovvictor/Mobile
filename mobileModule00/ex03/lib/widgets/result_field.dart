import 'package:flutter/material.dart';

class ResultField extends StatelessWidget {
  const ResultField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: Text(
        '0',
        style: TextStyle(
          fontSize: 30,
          color: Colors.black45,
        ),
      ),
    );
  }
}