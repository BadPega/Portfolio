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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  Color _themeColor = Colors.white; // Initial background color for page

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: _themeColor, // Set the page background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20), // Space for dropdown
              DropdownButton<Color>(
                value: _themeColor,
                onChanged: (Color? newColor) {
                  if (newColor != null) {
                    setState(() {
                      _themeColor = newColor; // Update page background color
                    });
                  }
                },
                items: const <DropdownMenuItem<Color>>[
                  DropdownMenuItem(
                    value: Colors.white,
                    child: Text('White', style: TextStyle(color: Colors.black)),
                  ),
                  DropdownMenuItem(
                    value: Colors.red,
                    child: Text('Red', style: TextStyle(color: Colors.red)),
                  ),
                  DropdownMenuItem(
                    value: Colors.green,
                    child: Text('Green', style: TextStyle(color: Colors.green)),
                  ),
                  DropdownMenuItem(
                    value: Colors.blue,
                    child: Text('Blue', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
