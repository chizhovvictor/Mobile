import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 240, 240),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'A simple text',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: const Text('Click me'),
                onPressed: () {
                  print('Button pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
