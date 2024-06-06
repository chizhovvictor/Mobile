
import 'package:flutter/material.dart';


class CalcButton extends StatelessWidget {
  final String text;
  final double fontSize;

  const CalcButton({super.key, required this.text, required this.fontSize, required this.addData});

  final void Function(String) addData;

  Color getColorForButton(String key) {
    if (key == 'AC' ||
        key == 'C' ||
        key == '*' ||
        key == '/' ||
        key == '+' ||
        key == '-' ||
        key == '00' ||
        key == '%' ||
        key == '=') {
      return const Color.fromARGB(255, 233, 125, 30);
    } else {
      return Colors.black;
    }
  }

  ButtonStyle getButtonStyle(String key) {
    if (key == '=') {
      return ButtonStyle(
        // backgroundColor: MaterialStateProperty.all<Color>(
        //   const Color.fromARGB(255, 233, 125, 30),
        // ),
        // shape: MaterialStateProperty.all<OutlinedBorder>(
        //   const CircleBorder(),
        // ),
        // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        //   const EdgeInsets.all(15),
        // ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(80, 80),
        ),
      );
    }
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
      Colors.white,
    ));
  }



  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => addData(text),
      style: getButtonStyle(text),
      child: Text(
        text,
        style: TextStyle(
          color: getColorForButton(text),
          fontSize: fontSize,
        ),
      ),
    );
  }
}
