import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trade_app/helper/shared_prefe/shared_prefe.dart';

FlutterLocalNotificationsPlugin fln = FlutterLocalNotificationsPlugin();

class PushNotificationHandle {

  //==================Request for permission and Generate FCM token=================
  static firebaseInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    debugPrint(
        'User granted permission==================>>>>>>>>>>>>: ${settings.authorizationStatus}');

    // Declare the token variable outside the if-else block
    String? token;

    if (Platform.isIOS) {
      token = await messaging.getAPNSToken();
    } else {
      token = await messaging.getToken();
    }

    if (token != null) {
      // Save the token to shared preferences
      SharePrefsHelper.setString(SharedPreferenceValue.fcmToken, token);

      // Optional: Print the FCM token for debugging
      debugPrint('FCM TOKEN <<<<<<<=====>>>>>>> $token');
    } else {
      debugPrint('Failed to retrieve FCM token.');
    }
  }


  //==================Listen Firebase Notification in every State of the app=================

  static firebaseListenNotification({  required BuildContext context}) async {
    FirebaseMessaging.instance.subscribeToTopic('signedInUsers');
//============>>>>>Listen Notification when the app is in foreground state<<<<<<<===========

    FirebaseMessaging.onMessage.listen((message) {
      // debugPrint(
      //     "Firebase onMessage=============================>>>>>>>>>>>>>>>>>>${message.data}");
      //
      //
      initLocalNotification(message: message);

      showTextNotification(
        title: message.notification!.title!,
        body: message.notification!.body!,
      );
    });

//============>>>>>Listen Notification when the app is in BackGround state<<<<<<<===========

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      //handleMessage(message: message);
    });

//============>>>>>Listen Notification when the app is in Terminated state<<<<<<<===========

    RemoteMessage? terminatedMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (terminatedMessage != null) {
      //handleMessage(message: terminatedMessage);
    }
  }

  //============================Initialize Local Notification=======================

  static Future<void> initLocalNotification(
      {required RemoteMessage message}) async {
    AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings("@mipmap/ic_launcher");

    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    fln
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await fln.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse? paylod) {
        debugPrint("==================>>>>>>>>>paylod hitted");
        //handleMessage(message: message);
      },
    );
  }




  // static handleMessage({required RemoteMessage message}) {
  //   Map<String, dynamic> data = message.data;
  //
  //   String type = data["type"];
  //
  //   if (type == "inbox") {
  //     SenderUser senderInfo =
  //     SenderUser.fromJson(jsonDecode(data["senderUser"]));
  //
  //     MessageSent messageInfo =
  //     MessageSent.fromJson(jsonDecode(data["messageSent"]));
  //     Get.toNamed(AppRoute.inbox, arguments: [
  //       senderInfo.name,
  //       senderInfo.photo![0].publicFileUrl,
  //       messageInfo.sender
  //     ], parameters: {
  //       "chatId": messageInfo.chat!
  //     });
  //   } else if (type == "matchRequest") {
  //     Get.toNamed(AppRoute.matchRequest);
  //   }
  // }

// <-------------------------- Show Text Notification  --------------------------->


  static Future<void> showTextNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'notification', // meta-data android value
      'notification', // meta-data android value
      playSound: true,
      importance: Importance.low,
      priority: Priority.low,
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await fln.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}