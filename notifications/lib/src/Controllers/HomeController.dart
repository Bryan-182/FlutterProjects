import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifications/src/pages/DetailPage.dart';
import 'package:notifications/src/providers/push_notifications.provider.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    //Parte 1
    final pushProvider = PushNotificationsProvider();
    pushProvider.initNotifications();

    //Parte 3.1
    pushProvider.menssagesStream.listen((argument) {
      //Parte 3.1
      //print(argument);

      //Parte 3.2 Navegar o realizar alguna accion
      Get.to(DetailPage(), arguments: argument);
    });
    update();
  }
}
