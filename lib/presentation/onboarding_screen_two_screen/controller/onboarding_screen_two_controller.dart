import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/onboarding_screen_two_screen/models/onboarding_screen_two_model.dart';

/// A controller class for the OnboardingScreenTwoScreen.
///
/// This class manages the state of the OnboardingScreenTwoScreen, including the
/// current onboardingScreenTwoModelObj
class OnboardingScreenTwoController extends GetxController {

  late List<Map<String, String>> data;
  late Rx<OnboardingScreenTwoModel> onboardingScreenTwoModelObj;
  ImageConstant imageConstant = ImageConstant();

  OnboardingScreenTwoController() {
    data = [
      {'svg': ImageConstant.imgOnboardingvectorGray300, 'text': "msg_find_best_influencers".tr},
      {'svg': ImageConstant.imgOnboardingvector, 'text': "msg_get_paid_by_growing".tr},
      {'svg': ImageConstant.imgOnboardingvectorGray300, 'text': "msg_collaboration_between".tr},
    ];

    onboardingScreenTwoModelObj = OnboardingScreenTwoModel(data).obs;

  }

  Rx<int> sliderIndex = 0.obs;
}
