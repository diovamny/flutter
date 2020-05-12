import 'package:flutter/material.dart';
import 'package:flutter_workshop_session4/widget/global_detalle3.dart';
import 'package:provider/provider.dart';

// ValueNotifier Widget Efimero Global
class Global3 extends StatelessWidget {
  static const routeName = '/global_3';

  final ValueNotifier<int> counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado Global3 ValueNotifier'),
      ),
      body: ValueListenableBuilder<int>(
          valueListenable: counter,
          builder: (context, value, child) {
            return  Column(
                children: <Widget>[
                  Text(
                    'Contar :$value', // <-- the state used in a widget
                    style: TextStyle(fontSize: 30),
                  ),


                  
                  RaisedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ValueListenableProvider<int>.value(
                              value:counter,
                              child: GlobalDetalle3(),)
                        ));
                      },
                      icon: Icon(Icons.location_on),
                      label: Text("Detalle"))
                  
                ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => counter.value++,
      ),
    );
  }
}
