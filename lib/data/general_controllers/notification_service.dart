import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/models/notification/notification_model';
import 'package:iynfluencer/routes/app_routes.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
   final storage = new FlutterSecureStorage();
    var accessToken;
    Rx<bool> isLoading = false.obs;
   Rx<bool> isTrendLoading = false.obs;
   var error = ''.obs;
    var token;
   final ApiClient apiClient = ApiClient();

  void initialize() {
    _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    // when the app is opened
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showSimpleNotification(
          Text(message.notification!.title!),
          position: NotificationPosition.top,
          subtitle: Text(message.notification!.body!),
          background: Colors.green.shade300,
          duration: Duration(seconds: 2),
        );
        saveNotificationToFirestore(
            message.notification!.title!, 
            message.notification!.body!, 
            message.data['type'] ?? 'unknown',
            message.data['img'] ?? 'unknown'
            );
      }
    });

    // when the app is opned, on foreground
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification was tapped!');
      if (message.notification != null) {
        _handleNotificationTap(
            message.notification!.title!, message.notification!.body!, message.data);
               saveNotificationToFirestore(
            message.notification!.title!,
            message.notification!.body!, 
            message.data['type'] ?? 'unknown',
            message.data['img'] ?? 'unknown'
             );
      }
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
           if (message!= null) {
        _handleNotificationTap(
            message.notification!.title!, message.notification!.body!,message.data);
               saveNotificationToFirestore(
            message.notification!.title!, 
            message.notification!.body!,
            message.data['type'] ?? 'unknown',
            message.data['img'] ?? 'unknown'
            );
      }
        });
  }

/*   
Future<void> sendNotification(String title, String body,dynamic data,String token) async {
  try {
    accessToken = await storage.read(key: "access_token");
    final url = ' https://fcm.googleapis.com/v1/projects/iynfluencer-c4f3f/messages:send';
    final payload = {
      "message": {
      'token': token,
      'notification': {
        'title': title,
        'body': body,
      },
      'data': data,
    }
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(payload),
    );
    if (response.statusCode == 200) {
      print(response);
      print(response.body);
      print('Notification sent successfully');
    } else {
      print(
          'Failed to send notification: ${response.statusCode}, ${response.body}');
      throw Exception('Server error');
    }
  } catch (e) {
    print(e);
    throw Exception('Server error');
  }
} */


Future<void> saveNotificationToFirestore(String title, String body, String type,String? img) async {
  final firestore = FirebaseFirestore.instance;
  await firestore.collection('notifications').add({
    'title': title,
    'body': body,
    'type': type,
    'img': img,
    'timestamp': FieldValue.serverTimestamp(),
  });
}


void _handleNotificationTap(String title, String body, Map<String, dynamic> data) {
  Get.toNamed(AppRoutes.notificationPageClientScreen, arguments: {
    'title': title,
    'body': body,
    'data': data
  });
}


  Future<void> createNotification(
      String title, String body, String type, String img) async {
    token = await storage.read(key: "token");
    if (token == null) {
      print("No token found. Please login again.");
      return;
    }

    isLoading.value = true;

    final notification = MNotification(
      title: title,
      body: body,
      type: type,
      img: img,
    );

    try {
      Response res = await apiClient.storeNotification(notification, token);
      if (res.isOk) {
        print("Notification stored successfully");
      } else {
        print('Failed to store notification: ${res.statusText}');
        throw Exception('Failed to store notification');
      }
    } catch (e) {
      print("Error storing notification: $e");
    } finally {
      isLoading.value = false;
    }
  }

}


