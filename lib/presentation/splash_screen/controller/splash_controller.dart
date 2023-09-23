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

  @override
  void onReady() async {
    String? token = await storage.read(key: "token");
    await storage.write(key: 'activeProfile', value: null);
    String? activeProfile = await storage.read(key: "activeProfile");

    await _delayedProgressUpdate(2000, 0.2);
    await storage.write(key: 'activeProfile', value: null);

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
