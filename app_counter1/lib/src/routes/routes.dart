import 'package:app_counter1/src/ComponentsPage.dart';
import 'package:app_counter1/src/pages/AlertPage.dart';
import 'package:app_counter1/src/pages/AnimatedPage.dart';
import 'package:app_counter1/src/pages/AvatarPage.dart';
import 'package:app_counter1/src/pages/CardsPage.dart';
import 'package:app_counter1/src/pages/InputPage.dart';
import 'package:app_counter1/src/pages/ListViewPage.dart';
import 'package:app_counter1/src/pages/SliderPage.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => ComponentsPage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardsPage(),
    'animatedContainer': (BuildContext context) => AnimatedPage(),
    'inputs': (BuildContext context) => InputPage(),
    'list': (BuildContext context) => ListViewPage(),
    'slider': (BuildContext context) => SliderPage(),
  };
}
