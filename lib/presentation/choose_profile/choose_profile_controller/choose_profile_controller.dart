import 'package:get/get.dart';

import '../../../core/utils/image_constant.dart';
import '../../onboarding_screen_two_screen/models/onboarding_screen_two_model.dart';

class ChooseProfileController extends GetxController {
  var selectedCard = 0.obs;

  void updateSelectedCard(int index) {
    selectedCard.value = index;
  }
  late List<Map<String, String>> data;
  ImageConstant imageConstant = ImageConstant();
  late Rx<OnboardingScreenTwoModel> onboardingScreenTwoModelObj;

  ChooseProfileController() {
    data = [
      {'svg': ImageConstant.imgOnboardingvectorGray300, 'text': "msg_find_best_influencers".tr},
      {'svg': ImageConstant.imgOnboardingvector, 'text': "msg_get_paid_by_growing".tr},
      {'svg': ImageConstant.imgOnboardingvectorGray300, 'text': "msg_collaboration_between".tr},

    ];

    onboardingScreenTwoModelObj = OnboardingScreenTwoModel(data).obs;


  }

  Rx<int> sliderIndex = 0.obs;
}
