import 'package:flutter/material.dart';


class Efimero1 extends StatelessWidget {
 
  static const routeName = '/efimero_1';
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (ctx, StateSetter setState) => 
        Scaffold(
          appBar: AppBar(title: Text('Estado Efimero StatefulBuilder'),),
          body:Center(child: Text('Contar :$_counter', style: TextStyle(fontSize: 30),)),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => setState(() => _counter++),
          ), 
        )
    );
  }
}