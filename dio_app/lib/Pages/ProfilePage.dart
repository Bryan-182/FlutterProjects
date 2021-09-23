import 'package:dio_app/Controllers/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(_.getUserName()),
        ),
      ),
    );
  }
}
