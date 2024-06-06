import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth > 600 ? 30 : 60;
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        '0',
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
      ),
    );
  }

}