import 'package:flutter/material.dart';
import 'package:flutter_workshop_session4/starte/global_4.dart';
import 'package:provider/provider.dart';

class GlobalDetalle4 extends StatelessWidget {
  static const routeName = '/global_4Detalle';
  const GlobalDetalle4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contador = Provider.of<Counter2>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado Global ChageNotify'),
      ),
      body: Center(
          child: Text("T minus ${contador.value} seconds",
              style: TextStyle(fontSize: 30))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.minimize),
        onPressed: () => contador.decrement(),
      ),
    );
  }
}
