
import 'package:calculator_proj/widgets/result_field.dart';
import 'package:flutter/material.dart';

class GridCalculator extends StatelessWidget {
  const GridCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: const ResultField(),
    );
  }
}
