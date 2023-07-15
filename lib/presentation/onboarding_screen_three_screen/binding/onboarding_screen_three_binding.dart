import '../controller/onboarding_screen_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingScreenThreeScreen.
///
/// This class ensures that the OnboardingScreenThreeController is created when the
/// OnboardingScreenThreeScreen is first loaded.
class OnboardingScreenThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreenThreeController());
  }
}
