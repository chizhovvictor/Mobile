import 'package:flutter/material.dart';
import 'package:calculator_proj/widgets/input_field.dart';
import 'package:math_expressions/math_expressions.dart';

class ResultField extends StatefulWidget {
  const ResultField({super.key});

  @override
  State<ResultField> createState() => _ResultFieldState();
}

class _ResultFieldState extends State<ResultField> {
  String textResult = '';

  void updateResult(String value) {
    setState(() {
      calculateResult(value);
    });
  }

  void calculateResult(String value) {
    
    // check if value is empty
    if (value.isEmpty) {
      textResult = '';
      return;
    }

    // check if value contains 0 or 00 as a token
    String checkValueToken = value.replaceAll(RegExp(r'([+*/-])'), ' ');
    List<String> tokens = checkValueToken.split(' ');
    for (var token in tokens) {
      if (token == '0' || token == '00') {
        if (value.contains('*') || value.contains('/')) {
          textResult = 'Error';
          return;
        }
      }

      // check if value contains % as a token
      if (token.contains('%')) {
        double number = double.parse(token.replaceAll('%', ''));
        if (number == 0) {
          value = value.substring(0, value.length - 1);
        } else {
          String procent = (number / 100).toString();
          value = value.replaceAll(token, procent);
        }
      }
    }

    // check value don't have operators at the end
    if (!value.contains('+') &&
        !value.contains('-') &&
        !value.contains('*') &&
        !value.contains('/')) {
      textResult = value;
      return;
    }

    try {
      Parser p = Parser();
      Expression exp = p.parse(value);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      textResult = result.toStringAsFixed(5);

      // remove trailing zeros
      for (var i = textResult.length - 1; i > 0; i--) {
        if (textResult[i] == '0') {
          textResult = textResult.replaceAll(RegExp(r'0$'), '');
        } else if (textResult[i] == '.') {
          textResult = textResult.replaceAll(RegExp(r'.$'), '');
          break;
        } else {
          break;
        }
      }
    } catch (e) {
      textResult = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / 1170;
    double fontSize = 40 * scaleFactor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            textResult,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black87,
            ),
          ),
        ),
        InputField(updateResult: updateResult),
      ],
    );
  }
}
