
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'pages/home_page.dart';
import 'pages/contador_page.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        home:
        Center(child: ContadorPage(),
    ),
    );
  }

}