import 'package:flutter/material.dart';

import '../widget/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: Center(
        child: Wrap(
          runSpacing: 20,
          alignment: WrapAlignment.center,
        children: <Widget>[
          Text('My Shop body',
              style: TextStyle(fontFamily: 'Lato-BoldItalic', fontSize: 25)),
          Image.asset('assets/images/shopping.jpg')
        ],
      )),
      drawer: AppDrawer(),
    );
  }
}
