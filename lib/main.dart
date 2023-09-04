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
  void dispose() {
    // Close the stream when the widget is disposed.
    _counterStreamController.close();
    super.dispose();
  }

  void _incrementCounter() {
    // Increment the counter and add it to the stream.
    _counter++;
    _counterStreamController.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: _counter,
              stream: _counterStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  'Counter: ${snapshot.data}', // Use the snapshot
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
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
