import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';


class Calculadora extends StatefulWidget {
static const routeName = '/calculadora';

 @override _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  num _value = 0;
  bool reset = false;
  int  decena = 0;
  String ceroPunto ='';
  Queue<String> historico = new Queue();
 
  final _operacion = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
    '/': (num a, num b) => (a / b)
  };
  
  @override
 Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
        ),
        body: Wrap(
          runSpacing: 15,
          children: <Widget>[
             SizedBox(
              height: heightSize * 0.4,
              child: _buildScreen(),
            ),
            SizedBox(
              height: heightSize * 0.5,
              child: _buildNumPad(),
            ),
          ],
        ));
  }

 Widget _buildScreen() {
    return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                historico.join(',').replaceAll(',', ''),
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            SizedBox(height: 30.0,),
            Align(
              alignment: Alignment.bottomRight,
                child: Text(_value.toString().trim()+ceroPunto,
                style: TextStyle(fontSize: 50.0, 
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
              ),
            ),
          ],
        ));
  }
  Widget _buildNumPad() => Column(
        children: [
          _rowButton(['CE','C',Icons.backspace,'/',]),
          _rowButton(['7', '8', '9', '*']),
          _rowButton(['4', '5', '6', '-']),
          _rowButton(['1', '2', '3', '+']),
          _rowButton(['+/-', '0', '.', '=']),
        ],
      );

  Widget _rowButton(List arg) =>
    Row(children: arg.map((item) => buildButton(item)).toList());

  Widget buildButton(dynamic item) => Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        child: item is String ? 
        Text(item, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)): 
        Icon(item,size: 28,),
        onPressed:()=> _buttonPressed(item is String ? item : '<-'),
      ),
    );

 void _buttonPressed(String item) => setState(() {
      var ultimo = historico.length > 0 ? historico.last : '0';
      if(ultimo == '='){
        if('+-*/'.contains(item)){historico.clear();}
        if(!'.<-CE+/-*/'.contains(item) &&  historico.length > 0 ){
          _value = num.parse(item);historico.clear();return;}
      }
      switch (item) {
        case '<-' : _value = _value ~/ 10; break;
        case 'C'  : _value= 0; decena = 0;ceroPunto=''; historico.clear(); break;
        case 'CE' : _value = 0; decena = 0;ceroPunto='';  break;
        case '+/-': _value =_value * -1; break;
        case '='  : historico.addLast(' ${quitarCero(_value)}'); historico.addLast(item);_procesar();ceroPunto=''; break;
        case '.'  : decena = 1;_value.toString().contains('.')?ceroPunto='':ceroPunto='.'; break;
        case '+': case '-': case '*' :case '/':
        (historico.length > 0  && ('+-*/'.contains(historico?.last) && reset == true))? 
        historico.removeLast():historico.addLast(' ${quitarCero(_value) }'); historico.addLast(' $item');
        reset=true; decena = 0;_procesar();break;

        default:  _contarNum(item);          
      }
       
    });

  void _contarNum(item){
    _value = reset ? 0 : _value;
     _value = decena == 0 ? _value * 10 + int.parse(item) :
    double.parse((_value + (int.parse(item )/pow(10, decena)))
    .toStringAsFixed(decena < 14 ? decena++:decena));
    if('$_value$ceroPunto'.toString().contains('.0.')){ceroPunto='';}
    if(decena>2 && _value.toString().contains('.0') && item =='0'){
      ceroPunto+='0';
    } 
    if(_value.toString().contains('.0') && item !='0'){
      ceroPunto='';
    }
   reset = false;
  }
 
 void _procesar() {
    num acumulador = 0;
    var calcular = _operacion['+'];
    for (var item in historico) {
      if (_operacion.containsKey(item.toString().trim())) {
        calcular = this._operacion[item.trim()];
        continue;
      }
      if (item.trim() =='='){continue;}
      acumulador = calcular(acumulador, num.parse(item.trim()));
    }
    _value = quitarCero(acumulador);
  }
  
  num quitarCero(valor)=> valor == valor.toInt()? valor.toInt():valor;
}
