import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  
  const InputField({super.key});
  
  void addDataInInput(String data) {
    print('Data added to InputField: $data');
  }

  @override
  State<InputField> createState() => _InputFieldState();


}

class _InputFieldState extends State<InputField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerRight,
      child: const Text(
        '0',
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}