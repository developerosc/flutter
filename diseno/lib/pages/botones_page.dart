import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[

        Container(
          width: double.infinity,
          height: double.infinity,
          color:  Color.fromRGBO(52, 54, 101, 1.0),
        ),
        Transform.rotate(
            angle: -pi / 5.0,
        child: Container(
          width: 360.0,
          height: 360.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60.0),
            gradient: LinearGradient(
                
                colors: [
                  Colors.pink,
                  Colors.white
                ]
            ),
          ),
        )
            ),
        
        SingleChildScrollView(
          child: SafeArea(child:
              Container(
                child:
          Column(
            children: <Widget>[
              Text('Clasic',style: TextStyle(color: Colors.white,fontSize: 20.0)),
              Text('Holaaaaa',style: TextStyle(color: Colors.white,fontSize: 20.0)),
              _tableCuad(),
            ],
          ),
              ),
          ),
        ),
      ],


        )
    );
  }

  Widget _tableCuad(){

    return Table(
      children: [
        TableRow(
        children:[
        _crearBotonesRedondeado(),
        _crearBotonesRedondeado(),
    ]
    ),
        TableRow(
            children:[
              _crearBotonesRedondeado(),
              _crearBotonesRedondeado(),
            ]
        ),
        TableRow(
            children:[
              _crearBotonesRedondeado(),
              _crearBotonesRedondeado(),
            ]
        ),
        TableRow(
            children:[
              _crearBotonesRedondeado(),
              _crearBotonesRedondeado(),
            ]
        ),
      ],
    );



  }

 Widget _crearBotonesRedondeado() {
    
    return ClipRRect(
      child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(60, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              CircleAvatar(
                  radius: 35.0,
                  child: Icon(Icons.swap_calls,color: Colors.white,size: 30.0,)
              ),
              Text("hola"),

            ],
          ),

        ),
      ),
    );
 }
}
