import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/splash_screen/models/splash_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:async';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
  var progress = 0.0.obs;
  final storage = FlutterSecureStorage();

  void updateProgress(double value) {
    progress.value = value;
  }

  Future<void> _delayedProgressUpdate(
      int milliseconds, double increment) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    progress.value += increment;
  }

/* 
  @override
  void onReady() async {
    String? token = await storage.read(key: "token");
    //  token=null;
    //   await storage.write(key: 'activeProfile', value: null);

    await _delayedProgressUpdate(2000, 0.2);

    if (token == null) {
      await _delayedProgressUpdate(2000, 0.8);
      Get.offNamed(AppRoutes.onboardingScreenTwoScreen);
      return;
    } else {
      bool hasExpired = JwtDecoder.isExpired(token);
      print('Token Expired: $hasExpired');
      //   await _delayedProgressUpdate(1000, 0.8);
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      int exp = decodedToken['exp'];
      int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      print('Token Expiration Time: $exp');
      print('Current Time: $now');

      if (exp < now) {
        print('Token has expired');
        // Navigate to login screen
      } else {
        print('Token is still valid');
      }

      if (hasExpired) {
        await storage.write(key: 'activeProfile', value: null);
        Get.offNamed(AppRoutes.logInScreen);
        return;
      } else {
        String? activeProfile = await storage.read(key: "activeProfile");
        if (activeProfile == "Creator") {
          Get.offNamed(AppRoutes.homeCreatorContainerScreen);
        } else if (activeProfile == "Influencer") {
          Get.offNamed(AppRoutes.influencerTabScreen);
        } else {
          Get.offNamed(AppRoutes.chooseProfile);
        }
      }
    }
  } */


 void onReady() async {
    String? token = await storage.read(key: "token");
    token=null;
    await storage.write(key: 'activeProfile', value: null);
    String? activeProfile = await storage.read(key: "activeProfile");

    await _delayedProgressUpdate(2000, 0.2);

    if (token == null) {
      await _delayedProgressUpdate(1000, 0.8);
      Get.offNamed(AppRoutes.onboardingScreenTwoScreen);
    } else {
      bool hasExpired = JwtDecoder.isExpired(token);

      await _delayedProgressUpdate(1000, 0.8);

      if (hasExpired == true) {
        print(hasExpired);
        Get.offNamed(AppRoutes.logInScreen);
      } else if (activeProfile == "Creator") {
        Get.offNamed(AppRoutes.homeCreatorContainerScreen);
      } else if (activeProfile == null || activeProfile.isEmpty) {
        Get.offNamed(AppRoutes.chooseProfile);
      } else {
        print(activeProfile);
        Get.offNamed(AppRoutes.influencerTabScreen);
      }
    }
  }
}

/* 
 @override
void onReady() async {
  String? token = await storage.read(key: "token");
   token=null;
   await storage.write(key: 'activeProfile', value: null);
  await _delayedProgressUpdate(2000, 0.2);

  if (token == null) {
    await _delayedProgressUpdate(1000, 0.8);
    Get.offNamed(AppRoutes.onboardingScreenTwoScreen);
    return;
  } else {
    bool hasExpired = JwtDecoder.isExpired(token);
    await _delayedProgressUpdate(1000, 0.8);

    if (hasExpired) {
      await storage.write(key: 'activeProfile', value: null);
      Get.offNamed(AppRoutes.logInScreen);
      return;
    } else {
      String? activeProfile = await storage.read(key: "activeProfile");
      print('Active Profile from storage: $activeProfile');

      if (activeProfile == null || (activeProfile != "Creator" && activeProfile != "Influencer")) {
        Get.offNamed(AppRoutes.chooseProfile);
      } else if (activeProfile == "Creator") {
        Get.offNamed(AppRoutes.homeCreatorContainerScreen);
      } else if (activeProfile == "Influencer") {
        Get.offNamed(AppRoutes.influencerTabScreen);
      }
    }
  } */

