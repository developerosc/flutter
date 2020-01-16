
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
      children: <Widget>[
        _cardTipo1(),
        SizedBox(height: 30.0),
        _cardTipo2(),
        SizedBox(height: 30.0),
        _cardTipo2(),
        SizedBox(height: 30.0),
        _cardTipo2(),
        SizedBox(height: 30.0),
        _cardTipo2(),
        SizedBox(height: 30.0),
        _cardTipo2(),
      ],

      ),

    );
  }

  Widget _cardTipo1() {

    return Card(
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('mostrarles nos asjnfladnflsd gljsgd s'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: (){
                
              }, child: Text('OK')),
              FlatButton(onPressed: (){
                
              }, child: Text('Cancel'))
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo2() {

    final card = Container(
      //elevation: 10.0,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
      children: <Widget>[
        FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
            image: NetworkImage('https://community.adobe.com/legacyfs/online/1229106_landscape-16.jpg')),

//        Image(
//            image: NetworkImage('https://community.adobe.com/legacyfs/online/1229106_landscape-16.jpg'),
//        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('No tengo idea'),
        )
      ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, -10.0)

          )
        ]
      ),
      child:  ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }


}