import 'package:flutter/material.dart';
import 'package:calculator_proj/widgets/input_field.dart';


class ResultField extends StatefulWidget {
  const ResultField({super.key});
  
  @override
  State<ResultField> createState() => _ResultFieldState();
}

class _ResultFieldState extends State<ResultField> {

  String result = '';

  void updateResult(String value) {
    setState(() {
      result = value;
      print(result);
    });
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
            result,
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
