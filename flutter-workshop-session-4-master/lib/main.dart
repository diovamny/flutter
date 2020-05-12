import 'package:flutter/material.dart';
import 'package:flutter_workshop_session4/screen/calculadora_scrren.dart';
import 'package:flutter_workshop_session4/screen/life_cicle_manager.dart';
import 'package:flutter_workshop_session4/screen/noticia_screen.dart';
import 'package:flutter_workshop_session4/starte/efimero_1.dart';
import 'package:flutter_workshop_session4/starte/global_1.dart';
import 'package:flutter_workshop_session4/starte/global_3.dart';
import 'package:flutter_workshop_session4/starte/global_4.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';


import 'screen/home_screen.dart';
import 'screen/product_detail_screen.dart';
import 'screen/product_screen.dart';
import 'starte/efimero_2.dart';
import 'starte/global_2.dart';
import 'widget/global_detalle4.dart';

 final getIt = GetIt.instance;


void main() {
  getIt.registerSingleton<Counter>(Counter());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   final conterProvider = Counter2(0);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
          child: MaterialApp(
        title: 'Routing and Navigation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        // home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          ProductScreen.routeName: (context) => ProductScreen(),
          ProductDetail.routeName: (context) => ProductDetail(),
          Calculadora.routeName: (context) => Calculadora(),
          LifeCicleManager.routeName: (context) => LifeCicleManager(),
          Efimero1.routeName: (context) => Efimero1(),
          Efimero2.routeName: (context) => Efimero2(),  
          Global1.routeName: (context) =>  Global1(),  
          Global2.routeName: (context) =>  Global2(),  
          Global3.routeName: (context) =>  Global3(),
          Global4.routeName: (context) =>  ChangeNotifierProvider(
            create: (context) => conterProvider,
            child: Global4() ,
          ),
          GlobalDetalle4.routeName: (context) =>  ChangeNotifierProvider<Counter2>.value(
            value: conterProvider,
            child: GlobalDetalle4() ,
          ),


        },
        // onGenerateRoute: (settings){
        //   if(settings.name == '/'){
        //     return MaterialPageRoute(builder: (ctx) => HomeScreen());
        //   }
        // },
        // onUnknownRoute: (settings){
        //   //Go to page not found screen
        // },
      ),
    );
  }
}
