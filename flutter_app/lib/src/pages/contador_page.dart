import 'package:flutter/material.dart';



 class ContadorPage extends StatefulWidget {

   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContadorPageState();
  }

 }

 class _ContadorPageState extends State<ContadorPage>{

   int contador = 0;

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
      title: Text('Titulo'),
    ),
      body: Center(
        child:
        Column(
          children: <Widget>[
            Text('hola holaa'),
            Text('$contador'),
          ],
        ),
      ),
      floatingActionButton: _crearBotones()
    );
  }

  Widget _crearBotones(){

     return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
         SizedBox(width: 30,),
         FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar,),
         Expanded(child: SizedBox()),
         FloatingActionButton(child: Icon(Icons.remove), onPressed: _sustraer,),
         SizedBox(width: 5.0,),
         FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _reset,),

       ],
     );
  }

  void _agregar() {
     setState(() => contador++);
 }
 void _sustraer(){
     setState(() => contador--);
 }

 void _reset(){
     setState(() => contador = 0);
 }

 }