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
    final double fontSize = screenWidth > 600 ? 20 : 30;

    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: GridView.count(
        crossAxisCount: isPortrait ? 4 : 5,
        childAspectRatio: isPortrait ? 1.3 : 3.5,
        
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
