import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider {
  //Parte 1
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  //Parte 3 Despues de matar el APP
  final _messageStreamController = StreamController<String>.broadcast();

  //Parte 3.1 Para poderse subscribir al stream y notificar cambios
  Stream<String> get menssagesStream => _messageStreamController.stream;

  //Parte 1
  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotifications() async {
    //Permiso del usuario
    await _firebaseMessaging.requestNotificationPermissions();
    //Get Token
    final token = await _firebaseMessaging.getToken();

    print('==== FCM Token ====');
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('====== onMessage');
    //Parte 1 Al crear el provider
    //print('====== onMessage');
    //print(message);

    //Parte 2 Extrayendo data extra
    final arguments = message['data']['Name'] ?? 'no-data';
    //print('Argumentos: $arguments');

    //Parte 3
    _messageStreamController.sink.add(arguments);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print('====== onLaunch');
    //Parte 1 Al crear el provider
    //print('====== onLaunch');

    //Parte 2 Extrayendo data extra
    final arguments = message['data']['Name'] ?? 'no-data';
    //print('Argumentos: $arguments');

    //Parte 3
    _messageStreamController.sink.add(arguments);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('====== onResume');
    //Parte 1 Al crear el provider
    //print('====== onResume');

    //Parte 2 Extrayendo data extra
    final arguments = message['data']['Name'] ?? 'no-data';
    //print('Argumentos: $arguments');

    //Parte 3
    _messageStreamController.sink.add(arguments);
  }

  //Parte 3
  dispose() {
    _messageStreamController?.close();
  }
}
