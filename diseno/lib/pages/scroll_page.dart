
import 'package:flutter/material.dart';


class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(context),

        ],
      ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _coloFondo(),
        _imagenFondo(),
        _textos(),
      ]
    );
  }

 Widget _pagina2(BuildContext context) {
   return Stack(
     children: <Widget>[
       _coloFondo(),
       Center(
         child: RaisedButton(
           shape: StadiumBorder(),
           color: Colors.blue,
             textColor: Colors.white,
             child: Text('Bienvenidos'),
             onPressed: (){
                Navigator.pushNamed(context, 'button');
         }),
       )
     ],
   );
 }

 Widget _coloFondo() {

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1)
    );

 }

Widget _imagenFondo(){
  return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(image:
      AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
  );
    
}

Widget _textos(){

    return SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Text('11',style: TextStyle(color: Colors.white,fontSize: 50.0)),
            Text('Miercoles',style: TextStyle(color: Colors.white,fontSize: 50.0)),
            Expanded(child: Container()),
            Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 50.0,)
          ],
        )
    );

}


}
