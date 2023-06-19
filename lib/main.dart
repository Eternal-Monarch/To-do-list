import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Counter value is 5!'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else if (_counter == 10) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(),
          ),
        );
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.4;
    final double buttonHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter value:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.orange,
            ),
            child: IconButton(
              onPressed: _incrementCounter,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: buttonWidth * 0.7,
            height: buttonHeight * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blue[900],
            ),
            child: IconButton(
              onPressed: _decrementCounter,
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text(
          'Congratulations! You reached 10!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
