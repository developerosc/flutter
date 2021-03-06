import 'package:flutter/material.dart';
import 'package:peliculas/pages/home_page.dart';
import 'package:peliculas/pages/pelicula_detalle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
          '/'         : (BuildContext context) => HomePage(),
          'detalle'         : (BuildContext context) => PeliculaDetalle(),
      },
     // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


