import 'package:dio_app/Models/UserModerl.dart';
import 'package:dio_app/Pages/ProfilePage.dart';
import 'package:dio_app/Providers/UserProvider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  User _user = User();

  User get user => _user;

  bool _datosCorrectos;

  bool get isDAtosCorrectos => _datosCorrectos;

  getUser() async {
    _user = await UserProvider.getUser();
    update();
  }

  String getUserName() {
    if (_user.name != null) {
      return _user.name.first;
    } else {
      return 'Vacio';
    }
  }

  validarInfo() {
    //Logica
    this._datosCorrectos = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  goToProfile() {
    Get.to(ProfilePage(), arguments: _user);
  }

  refreshUser() {
    getUser();
  }
}
