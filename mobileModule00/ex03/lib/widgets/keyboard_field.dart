import 'package:calculator_proj/widgets/calc_button.dart';
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
  '*',
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
  const KeyboardField({super.key, required this.addData});
 
  final void Function(String) addData;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / 1170;
    double fontSize = 50 * scaleFactor;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1.5,
        shrinkWrap: true,
        children: [
          for (var key in keyboard)
            Center(
              child: CalcButton(
                text: key,
                fontSize: fontSize,
                addData: addData,
              ),
            ),
        ],
      ),
    );
  }
}
