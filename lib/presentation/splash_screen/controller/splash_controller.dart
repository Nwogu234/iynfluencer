import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/splash_screen/models/splash_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:async';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  var progress = 0.0.obs;
  final storage = new FlutterSecureStorage();

  void updateProgress(double value) {
    progress.value = value;
  }

  @override
  void onReady() async {
    String? token = await storage.read(key: "token");
    String? activeProfile = await storage.read(key: "activeStorage");
    await Future.delayed(const Duration(milliseconds: 2000), () {
      Timer.periodic(Duration(milliseconds: 40), (timer) {
        while (progress.value < 0.2) {
          progress.value = progress.value + 0.005;
        }
        timer.cancel();
      });
    });

    if (token == null) {
      await Future.delayed(const Duration(milliseconds: 1000), () {
        Timer.periodic(Duration(milliseconds: 160), (timer) {
          while (progress.value < 1) {
            progress.value = progress.value + 0.005;
          }
          timer.cancel();
        });
      });
      Get.offNamed(AppRoutes.onboardingScreenTwoScreen);
    } else {
      bool hasExpired = JwtDecoder.isExpired(token);
      if (hasExpired == true) {
        await Future.delayed(const Duration(milliseconds: 1000), () {
          Timer.periodic(Duration(milliseconds: 160), (timer) {
            while (progress.value < 1) {
              progress.value = progress.value + 0.005;
            }
            timer.cancel();
          });
        });
        Get.offNamed(AppRoutes.logInScreen);
      } else if (activeProfile == "Creator") {
        await Future.delayed(const Duration(milliseconds: 1000), () {
          Timer.periodic(Duration(milliseconds: 160), (timer) {
            while (progress.value < 1) {
              progress.value = progress.value + 0.005;
            }
            timer.cancel();
          });
        });
        Get.offNamed(AppRoutes.homeCreatorContainerScreen);
      } else {
        await Future.delayed(const Duration(milliseconds: 1000), () {
          Timer.periodic(Duration(milliseconds: 160), (timer) {
            while (progress.value < 1) {
              progress.value = progress.value + 0.005;
            }
            timer.cancel();
          });
        });
        Get.offNamed(AppRoutes.influencerTabScreen);
      }
    }

    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   Timer.periodic(Duration(milliseconds: 100), (timer) {
    //     while (progress.value < 1) {
    //       progress.value = progress.value + 0.01;
    //     }
    //     timer.cancel();
    //
    //
    //   });
    // });
  }
}
