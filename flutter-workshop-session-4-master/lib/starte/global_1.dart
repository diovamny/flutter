import 'package:flutter/material.dart';
import 'package:flutter_workshop_session4/widget/global_detalle1.dart';

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: InheritedCounter( child: MyHomePage3() ), // <-- make sure your InheritedWidget wraps the widgets that use its data
//     );
//   }
// }

// The InheritedWidget Datos
class InheritedCounter extends InheritedWidget {
  final Map _counter = {
    'val': 0
  }; // Data structure is a map because InheritedWidgets are immutable
  final Widget child;

  InheritedCounter({@required this.child}) : super(child: child);

  increment() {_counter['val']++; }

  decrement() {_counter['val']--; }

  get counter => _counter['val'];

  @override //Si el marco debe notificar a los widgets que heredan de este widget.
  bool updateShouldNotify(InheritedCounter oldWidget) => true;

  //depende del widget heredado de tipo InheritedCounter
  static InheritedCounter of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType(aspect: InheritedCounter);
}

class Global1 extends StatelessWidget {
  static const routeName = '/global_1';

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      int counter = InheritedCounter.of(context).counter;
      Function increment = InheritedCounter.of(context).increment;

      return Scaffold(
        appBar: AppBar(
          title: Text('Estado Global InheritedCounter'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(
              'Contar :$counter', // <-- the state used in a widget
              style: TextStyle(fontSize: 30),
            ),
            RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GlobalDetalle1())
                  ).then((value) => setState(() => value));
                },
                icon: Icon(Icons.location_on),
                label: Text("Detalle"))
          ],
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => setState(() => increment()),
        ),
      );
    });
  }
}
