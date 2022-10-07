import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _swapped = false;

  @override
  Widget build(BuildContext context) {
    var decrement = ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.red),
      ),
      child: const Text(
        'Decrement Counter',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => setState(() => _counter -= 1),
    );

    var increment = ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.green),
      ),
      child: const Text(
        'Increment Counter',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => setState(() => _counter += 1),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              constraints: BoxConstraints.loose(const Size.square(40)),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _swapped
                  ? [
                      decrement,
                      increment,
                    ]
                  : [
                      increment,
                      decrement,
                    ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _counter = 0;
          _swapped = !_swapped;
        }),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
