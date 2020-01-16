

import 'package:flutter/material.dart';



class AvatarPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Avatar Page'),
        actions: <Widget>[
            Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/8/87/Stan_Lee.png/revision/latest?cb=20190303192815&path-prefix=es'),
              radius: 25.0,
            ),
            ),

            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.brown,
              ),
            )
        ],
      ),
      body: Center(
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage('https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/8/87/Stan_Lee.png/revision/latest?cb=20190303192815&path-prefix=es')

              ),
              Divider(height: 40.0),
              FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage('https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/8/87/Stan_Lee.png/revision/latest?cb=20190303192815&path-prefix=es')

              ),
            ],
          )


        )
      ),
    );
  }
}