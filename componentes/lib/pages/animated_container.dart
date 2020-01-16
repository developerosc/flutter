

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AnimatedContainerPage extends StatefulWidget{

  @override
  _AnimatedContainerPage createState() => _AnimatedContainerPage();
    // TODO: implement createState


}

class _AnimatedContainerPage extends State<AnimatedContainerPage>{

  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma(){
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _heigth = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(250),
          random.nextInt(250),
          random.nextInt(250),
          1.0);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });

  }
}
