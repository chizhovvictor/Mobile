import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: Text(
        '0',
        style: TextStyle(
          fontSize: 60,
          color: Colors.black,
        ),
      ),
    );
  }

}