import 'package:flutter/material.dart';
import 'package:flutter_workshop_session4/starte/global_2.dart';

import '../main.dart';

class GlobalDetalle2 extends StatelessWidget{
    final counterService = getIt.get<Counter>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Estado Global InheritedCounter'),
        ),
        body: StreamBuilder(
          stream: counterService.stream$,
          builder: (BuildContext context, AsyncSnapshot snap) { 
                  return Center(
              child: Text("contado ${snap.data} seconds", style: TextStyle(fontSize: 30)),
          );}
        ),
         floatingActionButton: FloatingActionButton(
          child: Icon(Icons.minimize),
          onPressed: () => counterService.decrement(),
        ),
    );
  }
}
