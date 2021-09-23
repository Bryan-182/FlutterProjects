import 'package:dio/dio.dart';
import 'package:dio_app/Models/UserModerl.dart';

class UserProvider {
  static String endpoint = 'https://randomuser.me/api/';
  static Dio dio = Dio();

  static Future<User> getUser() async {
    User user = User();

    Response response = Response();
    try {
      response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        try {
          user = User.fromJson(response.data['results'][0]);
        } catch (e) {
          print(e);
        }
      }
    } on DioError catch (e) {
      print(e);
    }

    return user;
  }
}
