import 'dart:io';
import 'package:fastfood_menu_app/app/locator.dart';
import 'package:fastfood_menu_app/main.dart';
import 'package:fastfood_menu_app/services/app_firestore_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppPushNotificationService {
  final appFirestoreService = locator<AppFirestoreService>();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    final token = await _fcm.getToken();
    print('YOUR TOKEN: ' + token.toString());

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        //set deal in deal service
        //navigate to deal page
        try {} catch (e) {
          // do nothing
        }
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    icon: 'launch_background')));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {}
    });
  }
}
