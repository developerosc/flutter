

import 'package:flutter/material.dart';



class AlertPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
    body: Center(
      child: RaisedButton(
        child: Text('Mostrar Alerta'),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () => _mostrarAlert(context),
      ),
    ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: true,
      builder: (context){

          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido'),
                FlutterLogo(size: 100.0,)
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: (){

                },
              )
            ],
          );
      }
    );

  }
}