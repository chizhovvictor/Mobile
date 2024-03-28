import 'package:ex02/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final List<String> keyboard = [
  'AC',
  'C',
  '%',
  '/',
  '7',
  '8',
  '9',
  'x',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '00',
  '0',
  '.',
  '=',
];

class KeyboardField extends StatelessWidget {
  const KeyboardField({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.07;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1.3,
        shrinkWrap: true,
        children: [
          for (var key in keyboard)
            Center(
              child: CalcButton(
                text: key,
                fontSize: fontSize,
              ),
            ),
        ],
      ),
    );
  }
}
