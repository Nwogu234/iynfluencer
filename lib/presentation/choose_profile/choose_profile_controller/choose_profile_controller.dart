import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/splash_screen/controller/splash_controller.dart';
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
    balance: 0,
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
  final ApiClients apiClients = ApiClients();
  final storage = FlutterSecureStorage();
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

/*   
  void syncChatsWithServer() {
    syncChats('influencers');
    syncChats('creators');
  }

  void syncChats(String chatType) async {
    String? token = await storage.read(key: "token");

    if (token == null) {
      print("Error: Token is null");
      return;
    }

    Response response;
    if (chatType == 'influencers') {
      response = await apiClients.getAllChatsWithInfluencers(token);
    } else if (chatType == 'creators') {
      response = await apiClients.getAllChatsWithCreators(token);
    } else {
      print("Invalid chat type");
      return;
    }

    if (response.isOk && response.body != null) {
      List<dynamic> chatJsonList = response.body['data']['docs'];
      await updateHiveWithChats(chatJsonList);
    } else {
      print('Error occurred when syncing $chatType chats');
    }
  }

  Future<void> updateHiveWithChats(List<dynamic> fetchedChats) async {
    try {
      final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chat_data');

      for (var chat in fetchedChats) {
        ChatData chatData = ChatData.fromJson(chat);

        if (chatBox.containsKey(chatData.chatId)) {
          print("Updating existing chat with ID: ${chatData.chatId}");
        } else {
          print("Inserting new chat with ID: ${chatData.chatId}");
        }

        await chatBox.put(chatData.chatId, chatData);
      }

      print("Hive successfully updated with server data");
    } catch (e) {
      print("Error updating Hive with server data: $e");
    }
  } */
}
