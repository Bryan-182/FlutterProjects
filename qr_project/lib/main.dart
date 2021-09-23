import 'package:flutter/material.dart';
import 'package:qr_project/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR App',
      initialRoute: 'home',
      routes: {'home': (BuildContext context) => HomePage()},
      theme: ThemeData(primaryColor: Colors.red[900]),
    );
  }
}
