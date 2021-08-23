import 'package:flutter/material.dart';

import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_pages.dart';
import 'package:componentes/src/pages/listview_pages.dart';
import 'package:componentes/src/pages/slider_pages.dart';
import 'package:componentes/src/pages/card_pages.dart';
import 'package:componentes/src/pages/home_pages.dart';
import 'package:componentes/src/pages/alert_pages.dart';
import 'package:componentes/src/pages/avatar_pages.dart';

Map<String, WidgetBuilder> getRoutes (){
  return <String, WidgetBuilder> {
        '/'     : (BuildContext context) => HomePages(),
        'alert' : (BuildContext context) => AlertPages(),
        'avatar': (BuildContext context) => AvatarPages(),
        'card'  : (BuildContext context) => CardPages(),
        'animatedContainer'  : (BuildContext context) => AnimatedContainerPage(),
        'inputs'  : (BuildContext context) => InputPages(),
        'lists'  : (BuildContext context) => ListPages(),
        'slider'  : (BuildContext context) => SliderPages(),
  };
}

