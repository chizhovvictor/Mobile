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
    if (onPress == 'AC' || (onPress == 'C' && data.length == 1)) {
      data = '';
    } else if (onPress == 'C' && data.length > 1) {
      data = data.substring(0, data.length - 2);
    } else if (onPress == '=') {

      widget.updateResult(data.substring(0, data.length - 1));
      data = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('data: $data');
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          child: Text(
            data,
            style: const TextStyle(
              fontSize: 40,
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
