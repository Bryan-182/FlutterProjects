import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifications_app/Controllers/UserController.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('UserPage'),
        ),
        body: Center(
          child: Text(_.getName()),
        ),
      ),
    );
  }
}
