import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  BuildContext context;

  Object _arguments;

  Object get arguments => _arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _arguments = Get.arguments;
    update();
  }
}
