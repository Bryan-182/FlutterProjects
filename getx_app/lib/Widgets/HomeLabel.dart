import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Controllers/HomePageController.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<HomePageController>(
        id: 'Text',
        builder: (_) => Center(
          child: Text(
            _.getCounter.toString(),
          ),
        ),
      ),
    );
  }
}
