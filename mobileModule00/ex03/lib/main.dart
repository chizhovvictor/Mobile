import 'package:flutter/material.dart';
import 'package:calculator_proj/widgets/grid_calculator.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Calculator',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 233, 125, 30),
        ),
        body: const GridCalculator(),
      ),
    );
  }
}

