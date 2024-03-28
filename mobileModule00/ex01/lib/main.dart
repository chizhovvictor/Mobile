import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var text = 'A simple text';

  void onPressed() {
    setState(() {
      if (text == 'A new text') {
        text = 'A simple text';
      } else {
        text = 'A new text';
      }
    });
  }

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
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                onPressed: onPressed,
                child: const Text('Click me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
