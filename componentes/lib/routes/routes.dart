


import 'package:componentes/pages/alert_page.dart';
import 'package:componentes/pages/animated_container.dart';
import 'package:componentes/pages/avatar_page.dart';
import 'package:componentes/pages/card_page.dart';
import 'package:componentes/pages/home_page.dart';
import 'package:componentes/pages/input_page.dart';
import 'package:componentes/pages/listview_page.dart';
import 'package:componentes/pages/slider_page.dart';
import 'package:flutter/cupertino.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext contex) => HomePage(),
    'alert': (BuildContext contex) => AlertPage(),
    'avatar': (BuildContext contex) => AvatarPage(),
    'card': (BuildContext contex) => CardPage(),
    'animatedContainer': (BuildContext contex) => AnimatedContainerPage(),
    'inputs': (BuildContext contex) => InputPage(),
    'slider': (BuildContext contex) => SliderPage(),
    'list': (BuildContext contex) => ListaPage(),
  };
}