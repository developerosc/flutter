import 'package:flutter/material.dart';



class BasicoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _screenTotal = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child:
      Container(
        height: _screenTotal.height,
        child: ListView(
          children: <Widget>[
         Image(
          image: NetworkImage('https://neetwork.com/wp-content/uploads/2019/11/descargar-im%C3%A1genes-gratis.png')
    ),
            Container(
              padding: EdgeInsets.only(top: 10.0,left: 30.0,right: 30.0),
              child:
            ListTile(

              title: Text('Ejemplo '),
              subtitle: Text('ejemplo'),
              trailing: Icon(Icons.star),

            ),
             ),
         //   Container(child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _crearAccion(Icons.call, 'call'),
                  _crearAccion(Icons.share, 'compartir'),
                  _crearAccion(Icons.home, 'hola'),
                ],
              ),
            _creatTexto(),
            _creatTexto(),
            _creatTexto(),
            _creatTexto(),
            _creatTexto(),
            _creatTexto(),
            _creatTexto(),
        //    ),
          ],
        ),
    ),
      ),
    );
  }

  Widget _crearAccion(IconData icon,String texto){

    return Column(
      children: <Widget>[
        Icon(icon),
        SizedBox(height: 20.0,),
        Text(texto),
      ],
    );
  }
  Widget _creatTexto(){

    return      Container(
  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0),
  child: Text("holahola hgkn dsfihbgersuybfksuyebvzfusbfuvbdkzjxvbkjhfbv",
  textAlign: TextAlign.justify,

  ),
  );
}
}
