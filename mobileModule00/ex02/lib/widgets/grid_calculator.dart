import 'package:ex02/widgets/input_field.dart';
import 'package:ex02/widgets/keyboard_field.dart';
import 'package:ex02/widgets/result_field.dart';
import 'package:flutter/material.dart';

class GridCalculator extends StatelessWidget {
  const GridCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          const ResultField(),
          const InputField(),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
          ),
          const KeyboardField(),
        ],
      ),
    );
  }
}
