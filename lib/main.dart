import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterNotifier counterNotifier = CounterNotifier(count: 5);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Notifier Demo'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterNotifier.decrement();
              },
              child: const Icon(Icons.minimize),
            ),
            ValueListenableBuilder(
              valueListenable: counterNotifier,
              builder: (context, value, child) {
                return Text('$value', style: const TextStyle(fontSize: 40),);
              },
            ),
            FloatingActionButton(
              onPressed: () {
                counterNotifier.increment();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier({int? count}) : super(count ?? 0);

  void increment() {
    // value is the property of super class i.e Value Notifier
    value++;
  }

  void decrement() {
    value--;
  }
}
