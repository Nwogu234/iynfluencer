import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../core/utils/image_constant.dart';
import '../../../routes/app_routes.dart';
import '../../onboarding_screen_two_screen/models/onboarding_screen_two_model.dart';

class ChooseProfileController extends GetxController {
  var selectedCard = 0.obs;
  var userModel = UserModel(
    firstName: "",
    lastName: "",
    email: "",
    termsAndConditionsAgreement: true,
    isNewUser: true,
    isSocial: false,
    verified: false,
    verifiedEmail: false,
    followers: 0,
    balance:0,
    following: 0,
    views: 0,
    userId: "kE4ngwqkZgG5",
    createdAt: DateTime.parse("2023-06-05T20:35:42.936Z"),
    updatedAt: DateTime.parse("2023-06-05T20:35:42.936Z"),
    creatorId: null,
    influencerId: null,
    id: '',
    avatar: '',
    dob: DateTime.now().toString(),
    phone: '',
    country: '',
  ).obs;

  void updateSelectedCard(int index) {
    selectedCard.value = index;
  }

  late List<Map<String, String>> data;
  final apiClient = ApiClient();
  ImageConstant imageConstant = ImageConstant();
  late Rx<OnboardingScreenTwoModel> onboardingScreenTwoModelObj;

  onTapSignupasa() async {
    Get.dialog(
      Center(child: CircularProgressIndicator()), 
      barrierDismissible: false, 
    );
    final storage = new FlutterSecureStorage();
    var token = await storage.read(key: "token");
    print(token);
    if (token == null) {
    Get.snackbar('Error', 'User is not logged in.');
    Get.back();
    return;
  }
    try {
      userModel.value = await apiClient.getUser(token!);
      print(userModel.value);
      if (userModel.value.firstName == "") {
        print('not fucking working');
      } else {
        print('its all good');
        var creator = userModel.value.creatorId;
        var inflencer = userModel.value.influencerId;

        if (selectedCard.value == 0) {
          if (creator == null) {
            Get.toNamed(
              AppRoutes.completeProfileCreatorScreen,
            );
          } else {
            await storage.write(key: 'activeProfile', value: "Creator");
            Get.offNamed(AppRoutes.homeCreatorContainerScreen);
          }
        } else {
          if (inflencer == null) {
            Get.offNamed(
              AppRoutes.completeProfileInfluencerScreen,
            );
          } else {
            await storage.write(key: 'activeProfile', value: "Influencer");
            Get.offNamed(AppRoutes.influencerTabScreen);
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  ChooseProfileController() {
    data = [
      {
        'svg': ImageConstant.imgOnboardingvectorGray300,
        'text': "msg_find_best_influencers".tr
      },
      {
        'svg': ImageConstant.imgOnboardingvector,
        'text': "msg_get_paid_by_growing".tr
      },
      {
        'svg': ImageConstant.imgOnboardingvectorGray300,
        'text': "msg_collaboration_between".tr
      },
    ];
    onboardingScreenTwoModelObj = OnboardingScreenTwoModel(data).obs;
  }

  Rx<int> sliderIndex = 0.obs;
}
