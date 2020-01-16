import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget{

final opciones = ['Uno','Dos','Tres','Cuatro'];

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(

       // children: _crearItems()
          children: _crearItemCorta()
      ),

    );
  }

  List<Widget>_crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones){

      final temWidget = ListTile(
        title: Text(opt),
      );
      lista.add(temWidget);
      lista.add(Divider());
    }


    return lista;
  }

  List<Widget> _crearItemCorta(){

    var widgets = opciones.map((item){

      return ListTile(
        title: Text(item + '!'),
        subtitle: Text('hola >..'),
        leading: Icon(Icons.account_balance_wallet),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          
        },
      );
    }).toList();

    return widgets;

  }

}
