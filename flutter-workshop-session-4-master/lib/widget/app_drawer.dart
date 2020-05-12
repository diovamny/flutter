import 'package:flutter/material.dart';
import 'package:flutter_workshop_session4/screen/calculadora_scrren.dart';
import 'package:flutter_workshop_session4/screen/life_cicle_manager.dart';
import 'package:flutter_workshop_session4/starte/efimero_1.dart';
import 'package:flutter_workshop_session4/starte/efimero_2.dart';
import 'package:flutter_workshop_session4/starte/global_1.dart';
import 'package:flutter_workshop_session4/starte/global_2.dart';
import 'package:flutter_workshop_session4/starte/global_3.dart';
import 'package:flutter_workshop_session4/starte/global_4.dart';

import '../screen/product_screen.dart';

class AppDrawer extends StatelessWidget {

  final textStyle = TextStyle(fontSize: 18,fontFamily: 'Lato-BoldItalic');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person),),
            title: Text('jroqueb1@gmail.com',style: textStyle),
            subtitle: Text('Administador',style: textStyle),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_basket, color: Colors.blue,),
            title: Text('My Products', style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(ProductScreen.routeName)
          ),
          Divider(color: Colors.red,),
          Text('Life Cicle Manager', style: textStyle),
          ListTile(
            leading: Icon(Icons.settings_system_daydream, color: Colors.blue,),
            title: Text('StatefulWidget' ,style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(LifeCicleManager.routeName)
          ),

          Divider(color: Colors.red,),
          Text('Estado Efimero',style: textStyle),
          ListTile(
            leading: Icon(Icons.stay_current_landscape, color: Colors.blue,),
            title: Text('StatefulBuilder',style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(Efimero1.routeName)
          ),
          ListTile(
            leading: Icon(Icons.stay_current_portrait, color: Colors.blue,),
            title: Text('StatefulWidget',style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(Efimero2.routeName)
          ),
          Divider(color: Colors.blue),
          Text('Estado Aplicación',style: textStyle),
           ListTile(
            leading: Icon(Icons.warning, color: Colors.redAccent,),
            title: Text('InheritedWidget',style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(Global1.routeName)
          ),
          ListTile(
            leading: Icon(Icons.add_call, color: Colors.blue,),
            title: Text('StreamBuilder rxDart',style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(Global2.routeName)
          ),
          ListTile(
            leading: Icon(Icons.free_breakfast, color: Colors.blue,),
            title: Text('ValueNotifier',style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(Global3.routeName)
          ),
          ListTile(
            leading: Icon(Icons.confirmation_number, color: Colors.blue,),
            title: Text('Provider ChangeNotifier',style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(Global4.routeName)
          ),
          Divider(color: Colors.deepPurple),
          Text('Calculadora',style: textStyle),
           ListTile(
            leading: Icon(Icons.call, color: Colors.redAccent,),
            title: Text('Calculadora',style: textStyle),
            onTap: ()=>Navigator.of(context).pushNamed(Calculadora.routeName)
          ),
        ],
      ),
    );
  }
}

 // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => ProductScreen())
              // );