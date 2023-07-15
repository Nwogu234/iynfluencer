import '../controller/onboarding_screen_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingScreenTwoScreen.
///
/// This class ensures that the OnboardingScreenTwoController is created when the
/// OnboardingScreenTwoScreen is first loaded.
class OnboardingScreenTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreenTwoController());
  }
}
