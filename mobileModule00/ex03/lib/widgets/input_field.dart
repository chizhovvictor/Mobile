import 'package:flutter/material.dart';
import 'package:calculator_proj/widgets/keyboard_field.dart';

class InputField extends StatefulWidget {
  const InputField({super.key, required this.updateResult});

  final void Function(String) updateResult;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String data = '';
  String onPress = '';

  void addData(String newData) {
    setState(() {
      onPress = newData;
      data += newData;
    });

    //remove data from input field if AC or C is pressed
    if (onPress == 'AC' || (onPress == 'C' && data.length == 1)) {
      widget.updateResult('');
      data = '';
    //remove last character from input field if C is pressed
    } else if (onPress == 'C' && data.length > 1) {
      data = data.substring(0, data.length - 2);
    // send data to result field if = is pressed
    } else if (onPress == '=') {
      widget.updateResult(data.substring(0, data.length - 1));
      data = '';
    //check data if pressed operator
    } else if ((onPress == '0') ||
        (onPress == '00') ||
        (onPress == '%') ||
        (onPress == '.') ||
        (onPress == '+') ||
        (onPress == '-') ||
        (onPress == '*') ||
        (onPress == '/')) {
      if (data.length == 1) {
        data = '';
      } else if (data[data.length - 2] == onPress) {
        data = data.substring(0, data.length - 1);
      } else if (onPress == '00' && data.length == 2) {
        data = '';
      }

    //check count of '.' in data  
    } else if ('.'.allMatches(data).length > 1) {
      String checkValueToken = data.replaceAll(RegExp(r'([+*/-])'), ' ');
      List<String> tokens = checkValueToken.split(' ');
      for (var token in tokens) {
        '.'.allMatches(token).length == 1
            ? data = data
            : data = data.substring(0, data.length - 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / 1170;
    double fontSize = 60 * scaleFactor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          child: Text(
            data,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black12),
            ),
          ),
        ),
        KeyboardField(addData: addData),
      ],
    );
  }
}
