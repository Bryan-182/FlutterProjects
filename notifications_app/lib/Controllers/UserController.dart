import 'package:get/get.dart';

class UserController extends GetxController {
  String _ruta;

  String get ruta => _ruta;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _ruta = Get.arguments;
    update();
  }

  String getName() {
    if (ruta != null) {
      return ruta;
    } else {
      return '';
    }
  }
}
