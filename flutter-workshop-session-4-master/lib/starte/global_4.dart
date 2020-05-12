
import 'package:flutter/material.dart';
import 'package:flutter_workshop_session4/widget/global_detalle4.dart';
import 'package:provider/provider.dart';


class Counter2 extends ChangeNotifier {
  int _value;

  int get value => _value;

  Counter2(this._value);

  void increment() {
    _value++;
    notifyListeners();
  }
  void decrement() {
    _value--;
    notifyListeners();
  }
}

// ValueNotifier Widget Efimero Global
class Global4 extends StatelessWidget {
  static const routeName = '/global_4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado Global4 ChangeNotifier'),
      ),
      body: Consumer<Counter2>(
            builder: (context, data,_) { 
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Contar : ${data.value}', // <-- the state used in a widget
                    style: TextStyle(fontSize: 30),
                  ),
                      RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(GlobalDetalle4.routeName);

                },
                icon: Icon(Icons.location_on),
                label: Text("Detalle"))
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Provider.of<Counter2>(context,  listen: false).increment(),
      ),
    );
  }
}
