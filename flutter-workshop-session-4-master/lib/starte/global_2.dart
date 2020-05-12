import 'package:flutter_workshop_session4/main.dart';
import 'package:flutter_workshop_session4/widget/global_detalle2.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

// Global Variable
// Counter counterService = Counter();

// Data Model
class Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);

  get stream$ => _counter.stream;
  int get current => _counter.value;

  increment() {
    _counter.add(current + 1);
  }
  decrement() {
    _counter.add(current - 1);
  }
}

// StreamBuilder Widget
class Global2 extends StatelessWidget {
  static const routeName = '/global_2';

   final counterService = getIt.get<Counter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado Global2 rxDart StreamBuilder'),
      ),
      body: StreamBuilder(
          stream: counterService.stream$,
          builder: (BuildContext context, AsyncSnapshot snap) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Contar :${snap.data}', // <-- the state used in a widget
                    style: TextStyle(fontSize: 30),
                  ),
                RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GlobalDetalle2())
                  );
                },
                icon: Icon(Icons.location_on),
                label: Text("Detalle"))
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => counterService.increment(),
      ),
    );
  }
}
