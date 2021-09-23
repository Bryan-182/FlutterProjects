import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Controllers/HomePageController.dart';
import 'package:getx_app/Widgets/HomeLabel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (_) {
          print('Build home');
          return Scaffold(
            appBar: AppBar(
              title: Text('HomePage'),
            ),
            body: HomeLabel(),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _.increment(),
            ),
          );
        });
  }
}
