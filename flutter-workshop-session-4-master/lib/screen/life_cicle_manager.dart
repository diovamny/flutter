import 'package:flutter/material.dart';

class LifeCicleManager extends StatefulWidget {
  static const routeName = '/life_cicle';
    int counter = 0;

  ///Cuando se le ordena a Flutter que construya un StatefulWidget,
  /// llama inmediatamente createState(). Este método debe existir.
  @override
  _LifeCicleManagerState createState() => _LifeCicleManagerState();
}

class _LifeCicleManagerState extends State<LifeCicleManager> {


  ///Se llama cuando el objeto se inserta en el árbol, exactamente 1 vez por componente.
  @override
  void initState() {
    super.initState();
    
    ///mostrar el refreshIndicator solo una vez, así que si necesitas
    /// algún elemento que se muestre solo una vez al inicio puedes usar este método.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => print('04-addPostFrameCallback ....'));

    print('01-initState ....');
  }

 

  @override
  void didUpdateWidget(Widget oldWidget) {
    // se llamará una vez que el Widget principal
    // haya realizado un cambio y necesite volver a dibujar la interfaz de usuario.
    print('didUpdateWidge..... ${++widget.counter}');
    super.didUpdateWidget(oldWidget);
    
  }

  @override
  void didChangeDependencies() {
    // Este método se llama inmediatamente después de initState () la primera vez que se crea el widget
    super.didChangeDependencies();
      print('03-didChangeDependencies() ....');
  }

  @override
  void deactivate() {
    ///Estamos llegando al punto en que nuestro Widget comienza a "morir".
    super.deactivate();
     print('05-deactivate() ....');
  }

 @override
  void dispose() {
    ///Este es muy importante y se llama cuando este objeto y su estado
    /// se eliminan del árbol de forma permanente y nunca se volverán a construir. 
    super.dispose();
     print('-06-dispose() ....');
  }

  @override
  Widget build(BuildContext context) {
    print('04-Ejecutando Build ....');
    return Scaffold(
      appBar: AppBar(
        title: Text('LifeCicleManagerState'),
      ),
      body: Center(child: Text('${widget.counter}',style: TextStyle(fontSize: 30),)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => widget.counter++),
      ),
    );
  }
}
