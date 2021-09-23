import 'package:get/get.dart';
import 'package:notifications_app/Pages/DetailPage.dart';
import 'package:notifications_app/Pages/UserPage.dart';
import 'package:notifications_app/Providers/NotificationsProvider.dart';

class MainController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onInit
    super.onReady();
    final notificationProvider = NotificationProvider();
    notificationProvider.initNotifications();
    notificationProvider.messageStream.listen((value) {
      if (value == 'detail') {
        Get.to(DetailPage(), arguments: value);
      } else {
        Get.to(UserPage(), arguments: value);
      }
    });
  }
}
