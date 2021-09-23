import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifications/src/Controllers/DetailController.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('DetailPage'),
        ),
        body: Text(_.arguments.toString()),
      ),
    );
  }
}
