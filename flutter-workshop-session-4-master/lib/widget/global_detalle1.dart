import 'package:flutter/material.dart';
import 'package:flutter_workshop_session4/starte/global_1.dart';

class GlobalDetalle1 extends StatefulWidget {
  const GlobalDetalle1({Key key}) : super(key: key);

  @override
  _GlobalDetalle1State createState() => _GlobalDetalle1State();
}

class _GlobalDetalle1State extends State<GlobalDetalle1> {
  @override
  Widget build(BuildContext context) {
     int counter = InheritedCounter.of(context).counter;
    Function decrement = InheritedCounter.of(context).decrement;

    return Scaffold(
        appBar: AppBar(
          title: Text('Estado Global InheritedCounter'),
        ),
        body: Center(
            child: Text("contado $counter seconds", style: TextStyle(fontSize: 30)),
        ),
         floatingActionButton: FloatingActionButton(
          child: Icon(Icons.minimize),
          onPressed: () => setState(() => decrement()),
        ),
    );
  }
}
