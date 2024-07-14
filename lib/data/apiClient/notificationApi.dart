import 'dart:async';
import 'package:iynfluencer/core/utils/logs.dart';
import 'package:iynfluencer/env.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationClient extends GetConnect {
  NotificationClient() {
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl = 'https://onesignal.com/api/v1/';
  }

  final storage = new FlutterSecureStorage();

  dynamic errorHandler(Response response) {
    print(response.toString());
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 202:
        return response;
      case 500:
        throw "Server Error pls retry later";
      case 401:
        return Get.offAllNamed(
          AppRoutes.logInScreen,
        );
      case 403:
        throw 'Error occurred pls check internet and retry.';
      case 500:
      default:
        throw 'Error occurred retry';
    }
  }

 
  Future<Response> sendNotification(String heading, String contents, String externalId, String? avatar) async {
    Response response;
    try {
      final payload = {
        "app_id": appId,
        "include_aliases": {
          "external_id": [
            externalId
          ]
        },
        "target_channel": "push",
        "headings": {
          "en": heading
          },
        "contents": {
          "en": contents,
        },
       // "android_accent_color": "#5DC8E0",
        "small_icon": ImageConstant.logo,
        "large_icon": avatar,
      };
      final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic $signalKey'
    };

      response = await post(
        'notifications', 
        payload, 
        headers: headers
        );
      if (response.isOk) {
        print('its good');
        l('Notification', 'Response', response);
        return response;
      } else {
        print('Problem ooooo');
        print(response);
        print(response.body);
        print(response.statusCode);
        print(payload);
        print('Server error: ${response.statusText}');
        return response;
        throw Exception('Server error');
      }
    } catch (e) {
      print(e);
      throw Exception('Server error');
    }
  }

  
}
