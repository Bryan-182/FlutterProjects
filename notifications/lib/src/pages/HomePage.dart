import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifications/src/Controllers/HomeController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Text('HomePage'),
      ),
    );
  }
}
