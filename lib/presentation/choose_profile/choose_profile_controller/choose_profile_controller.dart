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
  var userModel =  UserModel(
  firstName: "",
  lastName: "",
  email: "",
  termsAndConditionsAgreement: true,
  isNewUser: true,
  isSocial: false,
  verified: false,
  verifiedEmail: false,
  followers: 0,
  following: 0,
  views: 0,
  userId: "kE4ngwqkZgG5",
  createdAt: DateTime.parse("2023-06-05T20:35:42.936Z"),
  updatedAt: DateTime.parse("2023-06-05T20:35:42.936Z"),
  creatorId: "GtgMWdNV7Vgj",
  influencerId: "nTG2-KMMNVCI",
    id: '',
  ).obs;

  void updateSelectedCard(int index) {
    selectedCard.value = index;
  }
  late List<Map<String, String>> data;
  final apiClient = ApiClient();
  ImageConstant imageConstant = ImageConstant();
  late Rx<OnboardingScreenTwoModel> onboardingScreenTwoModelObj;

  onTapSignupasa() async{
    Get.dialog(
      Center(child: CircularProgressIndicator()), // showing a loading dialog
      barrierDismissible: false, // user must not close it manually
    );
    final storage = new FlutterSecureStorage();
    var token = await storage.read(key: "token");
    print (token);
    try{
      userModel.value = await apiClient.getUser(token!);
      print(userModel.value);
      if (userModel.value==null){
        print('not fucking working');
      }
      else{
        print ('its all good');
      }
    }
    catch(e){
      print(e);
    }

    var creator = userModel.value.creatorId;
    var inflencer = userModel.value.influencerId;


    if(selectedCard.value==0){
      storage.write(key: 'activeProfile', value: 'Creator');
      if (creator==null){
        Get.toNamed(
          AppRoutes.completeProfileCreatorScreen,
        );
      }
      else {
        Get.toNamed(AppRoutes.homeCreatorContainerScreen);
      }
    }
    else{
      storage.write(key: 'activeProfile', value: 'Influencer');
      if (inflencer==null){
        Get.toNamed(
          AppRoutes.completeProfileInfluencerScreen,
        );
      }
      else {
        Get.toNamed(AppRoutes.influencerTabScreen);
      }
    }
  }

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
