import 'package:componentes/pages/alert_page.dart';
import 'package:componentes/src/menu_provider.dart';
import 'package:componentes/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){

    //print(menuProvider.opcines);

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

        print(snapshot.data);
        return ListView(
      children: _listaItems(snapshot.data,context),
    );

      },
    );
//
//    return ListView(
//
//      children: _listaItems(),
//    );
  }

  List<Widget> _listaItems(List<dynamic> data,BuildContext context){

  final List<Widget> opciones = [];

  data.forEach((opt){
    
    final widgetTemp = ListTile(
      
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        
        Navigator.pushNamed(context, opt['ruta']);
        
//        navegar sin nombre
//        final route = MaterialPageRoute(
//          builder: (context){
//            return AlertPage();
//          }
//        );
//
//        Navigator.push(context, route);
      },
    );
    
    opciones..add(widgetTemp)
            ..add(Divider());
    });

  return opciones;
  }
}