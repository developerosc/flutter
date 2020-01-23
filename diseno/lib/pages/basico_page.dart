import 'package:flutter/material.dart';



class BasicoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _screenTotal = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.share),
                  Icon(Icons.share),
                  Icon(Icons.share),
                ],
              ),
        //    ),
          ],
        ),
    ),
    );
  }
}
