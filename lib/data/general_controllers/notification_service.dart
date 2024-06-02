import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:iynfluencer/env.dart';
import 'package:iynfluencer/routes/app_routes.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

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
            message.data,
            message.data['type'] ?? 'unknown'
            );
      }
    });

    // when the app is opned, on foregraound
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification was tapped!');
      if (message.notification != null) {
        _handleNotificationTap(
            message.notification!.title!, message.notification!.body!, message.data);
               saveNotificationToFirestore(
            message.notification!.title!,
            message.notification!.body!, 
            message.data,
            message.data['type'] ?? 'unknown'
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
            message.data,
            message.data['type'] ?? 'unknown'
            );
      }
        });
  }

  
Future<void> sendNotification(String title, String body,dynamic data,String token) async {
  try {
    final url = 'https://fcm.googleapis.com/fcm/send';
    final payload = {
      'to': token,
      'notification': {
        'title': title,
        'body': body,
      },
      'data': data,
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$firebaseKey'
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
}


Future<void> saveNotificationToFirestore(String title, String body, dynamic data, String type) async {
  final firestore = FirebaseFirestore.instance;
  await firestore.collection('notifications').add({
    'title': title,
    'body': body,
    'data': data,
    'type': type,
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

}


