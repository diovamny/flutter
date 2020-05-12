import 'package:flutter/material.dart';


class Efimero2 extends StatefulWidget {
  static const routeName = '/efimero_2';
 createState() => _Efimero2State();
}

class _Efimero2State extends State<Efimero2> {
  int _counter = 0;  // <-- the stateful data

  void _incrementCounter() {
    setState(() { // <-- the special method called to update state
      _counter++; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estado Efimero StatefulWidget'),),
      body:Center(
        child: Text('Contar :$_counter', // <-- the state used in a widget
        style: TextStyle(fontSize: 30),)), 

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _incrementCounter,  // <-- the state changed on button tap event
      ), 
    );
  }
}