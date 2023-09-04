import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CounterScreen()));

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final StreamController<int> _counterStreamController =
      StreamController<int>();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // Listen to the stream and update the counter when it changes.
    _counterStreamController.stream.listen((newCount) {
      setState(() {
        _counter = newCount;
      });
    });
  }

  @override
  void dispose() {
    // Close the stream when the widget is disposed.
    _counterStreamController.close();
    super.dispose();
  }

  void _incrementCounter() {
    // Increment the counter and add it to the stream.
    _counterStreamController.add(_counter + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $_counter', style: const TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
