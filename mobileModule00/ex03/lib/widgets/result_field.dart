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
    }

    


    try {
      Parser p = Parser();
      Expression exp = p.parse(value);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      textResult = result.toString();
      // print('textResult is $textResult');
      // print('result is $result');
    } catch (e) {
      textResult = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            textResult,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        InputField(updateResult: updateResult),
      ],
    );
  }
}
