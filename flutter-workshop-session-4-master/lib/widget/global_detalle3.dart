import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalDetalle3 extends StatelessWidget {
  const GlobalDetalle3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Estado Global ValueNotify'),
        ),
        body: Center(
          child: Consumer<int>(
            builder: (context, count, child) {
              if (count > 0) {
                return Text("T minus $count seconds",
                    style: TextStyle(fontSize: 30));
              }
              return Text("Blast off!");
            },
          ),
        ),
);
  }
}
