import 'dart:io';

import 'package:designs/src/pages/basic_page.dart';
import 'package:designs/src/pages/buttons_page.dart';
import 'package:designs/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor:
            (Platform.isAndroid) ? Colors.transparent : Colors.white));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      initialRoute: 'buttons',
      routes: {
        'basic': (BuildContext context) => BasicPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'buttons': (BuildContext context) => ButtonsPage(),
      },
    );
  }
}
