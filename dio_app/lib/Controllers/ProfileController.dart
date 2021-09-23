import 'package:dio_app/Models/UserModerl.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  User _user;

  User get getUser => _user;

  @override
  void onInit() {
    // TODO: implement onReady
    super.onInit();
    this._user = Get.arguments;
  }

  String getUserName() {
    if (_user.name != null) {
      return _user.name.first;
    } else {
      return 'Vacio';
    }
  }
}
