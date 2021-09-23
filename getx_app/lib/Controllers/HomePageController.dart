import 'package:get/get.dart';

class HomePageController extends GetxController {
  int _counter = 0;

  int get getCounter => _counter;

  increment() {
    this._counter++;
    update(['Text'], _counter >= 10);
  }

// // //
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('onInit Home Controller');
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print('onReady Home Controller');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('onClose Home Controller');
  }
}
