import 'package:flutter/material.dart';

class ResultField extends StatelessWidget {
  const ResultField({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth > 600 ? 30 : 30;

    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        '0',
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black45,
        ),
      ),
    );
  }
}