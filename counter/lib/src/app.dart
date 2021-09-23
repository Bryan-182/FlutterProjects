import 'package:counter/src/pages/counter_page.dart';
import 'package:counter/src/pages/home_page.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(child: CounterPage()),
    );
  }
}
