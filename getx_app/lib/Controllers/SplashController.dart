import 'package:get/get.dart';
import 'package:getx_app/Pages/HomePage.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    Future.delayed(Duration(seconds: 3)).then((value) {
      //navigator.push();
      /*Get.to(HomePage(),
          transition: Transition.zoom, duration: Duration(seconds: 2));*/

      //navigator.pushReplacement
      Get.off(HomePage(),
          transition: Transition.zoom, duration: Duration(seconds: 2));
    });
  }
}
