import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static final _streamMessageController = StreamController<String>.broadcast();

  Stream<String> get messageStream => _streamMessageController.stream;

  initNotifications() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();
    print('TOKEN FIREBASE********');
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: myBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  static Future<dynamic> myBackgroundMessage(
      Map<String, dynamic> message) async {
    print("myBackgroundMessage: $message");
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

  static Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print("onMessage: $message");
    final value = message['data']['route'];
    _streamMessageController.sink.add(value);
  }

  static Future<dynamic> onResume(Map<String, dynamic> message) async {
    print("onResume: $message");
    final value = message['data']['route'];
    _streamMessageController.sink.add(value);
  }

  static Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print("onLaunch: $message");
    final value = message['data']['route'];
    _streamMessageController.sink.add(value);
  }

  dispose() {
    _streamMessageController?.close();
  }
}
