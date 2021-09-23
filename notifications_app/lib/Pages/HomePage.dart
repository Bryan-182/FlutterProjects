import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifications_app/Controllers/HomePageController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
        ),
      ),
    );
  }
}
