import 'package:flutter/material.dart';
import 'package:transitions_app/src/pages/page_1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: FirstPage(),
    );
  }
}
