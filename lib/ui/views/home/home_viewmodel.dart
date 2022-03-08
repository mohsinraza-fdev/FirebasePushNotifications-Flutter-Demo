import 'dart:convert';
import 'dart:math';

import 'package:fastfood_menu_app/app/locator.dart';
import 'package:fastfood_menu_app/models/deal_model.dart';
import 'package:fastfood_menu_app/services/app_firestore_service.dart';
import 'package:fastfood_menu_app/services/app_push_notification_service.dart';
import 'package:fastfood_menu_app/services/deal_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends FutureViewModel {
  final appFirestoreService = locator<AppFirestoreService>();
  final appPushNotificationService = locator<AppPushNotificationService>();
  final dealService = locator<DealService>();

  @override
  Future<List<Deal>> futureToRun() =>
      appFirestoreService.getDealsFromFirestore();

  @override
  void onError(error) {
    print(error);
  }

  String itemListMaker(items) {
    String itemString = '';
    int count = 0;
    for (var item in items) {
      count++;
      if (count > 2) {
        itemString += ', and more';
        break;
      } else if (count > 1) {
        itemString += '\n';
      }

      itemString += (item['quantity'].toString() + ' ' + item['name']);
    }
    return itemString;
  }

  void setDealToShow(Deal? value) {
    dealService.dealIndexToShow = value;
  }

  initialization() async {
    await appPushNotificationService.initialize();
  }

  createNotification() async {
    try {
      var rng = Random();
      final token = await FirebaseMessaging.instance.getToken();
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAADLXhSHE:APA91bED5yxy9bd3MyEtrtdysITGS3j0cmQo_dU1KdptL1CDi84onGaiBCOIiw9dU1gtXeP-A_CJ-kIaBwS5SzOoNN9o7DMXyaG6LEVdvON1CPzlg3ow_BHL5VpYUkKfjH0bljvRMykg',
        },
        body: jsonEncode({
          "registration_ids": [token.toString()],
          "notification": {
            "body":
                "Your Random Notification number is ${rng.nextInt(1000).toString()}",
            "title": "Random Notification",
            "android_channel_id": "high_importance_channel",
            "sound": true
          }
        }),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
}
