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

  /*  Future<Response> startOAuthFlow() async {
    Response response;
    try {
      response = await get('oauth/google');
      if (response.isOk) {
        final Map<String, dynamic> responseBody = response.body;
        if (responseBody.containsKey('url')) {
          final oauthUrl = responseBody['url'];

           try {
            await launchUrl(
             Uri.parse(oauthUrl),
               customTabsOptions: CustomTabsOptions(
                      browser: const CustomTabsBrowserConfiguration(
                      prefersDefaultBrowser: true,
                     ),
                colorSchemes:  CustomTabsColorSchemes.defaults(
                  toolbarColor: Theme.of(Get.context!).primaryColor
                ),
                
                urlBarHidingEnabled: true,
                showTitle: true,
                animations: CustomTabsSystemAnimations.slideIn(),
              ),
            );  
         //   _initUniLinks();
          } catch (e) {
             debugPrint(e.toString());
            print('Could not launch $oauthUrl');
          }
        } else {
          print('OAuth URL not found in the response');
        }
        return response;
      } else {
        print(
            'Failed to get OAuth URL : ${response.statusCode}, ${response.body}');
        return response;
      }
    } catch (e) {
      print(e);
      throw Exception('Server error');
    }
  }



  Future<Response> exchangeCodeForToken(String? code) async {
    Response response;
    if (code == null) {
      print('Authorization code is null');
      throw Exception('Authorization code is null');
    }
    try {
      response = await get('oauth/google/callback/?code=$code');

      if (response.isOk) {
        final responseBody = response.body;
        print(responseBody);

        final accessToken = responseBody['access_token'];
        final _result = 'Token:\n$accessToken';
        print(_result);
        l('build', 'token', accessToken);

        // Check if accessToken is not null
        if (accessToken != null) {
          await storage.write(
              key: 'access_token', value: accessToken.toString());
          print('Access Token: $accessToken');
          return response;
        } else {
          print('Access token not found in the response');
          throw Exception('Access token not found in the response');
        }
      } else {
        print(
            'Failed to get access token: ${response.statusCode}, ${response.body}');
        Get.snackbar('Error', 'Failed to get access token');
        throw Exception('Failed to get access token');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Server error');
      throw Exception('Server error');
    }
  }

  Future<void> _initUniLinks() async {
    final appLinks = AppLinks();

    _sub = appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null && uri.toString().startsWith(redirectUrl)) {
        _handleAuthResponse(uri.toString());
      }
    }, onError: (err) {
      print("Error listening to uriLinkStream: $err");
    });
  }

  _handleAuthResponse(String response) {
    if (response.contains('access_token')) {
      final Uri uri = Uri.parse(response);
      final token = uri.queryParameters['access_token'];
      l('InappWebView', 'access_token', token);
      //   Navigator.of(context).pop({'access_token': token});
      print('access_token: $token');
      flutterWebviewPlugin.close();
    } else if (response.contains('?error=')) {
      final Uri uri = Uri.parse(response);
      final error = uri.queryParameters['error'];
      l('InappWebView', 'Error', error);
      // Navigator.of(context).pop({'error': error});
      print('error: $error');
      flutterWebviewPlugin.close();
    } else {
      l('InappWebView', 'Unknown Response', response);
      //  Navigator.of(context) .pop({'error': 'Unknown response from OAuth server'});
      print('error: Unknown response from OAuth server');
      flutterWebviewPlugin.close();
    }
  } */

  Future<Response> sendNotification(String heading, String contents, String externalId, String avatar) async {
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
