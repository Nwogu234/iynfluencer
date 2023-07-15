import '../controller/onboarding_screen_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingScreenOneScreen.
///
/// This class ensures that the OnboardingScreenOneController is created when the
/// OnboardingScreenOneScreen is first loaded.
class OnboardingScreenOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreenOneController());
  }
}
