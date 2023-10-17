import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:flutter/material.dart';

import '../../../data/models/use_model/user_model.dart';
import '../apiClient/api_client.dart';

/// A controller class for the InfluencerHomeScreen.
///
/// This class manages the state of the InfluencerHomeScreen, including the
/// current influencerHomeModelObj
class UserController extends GetxController {
  Rx<UserModel> userModelObj = UserModel(
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
    userId: "",
    createdAt: DateTime.parse("2023-06-05T20:35:42.936Z"),
    updatedAt: DateTime.parse("2023-06-05T20:35:42.936Z"),
    creatorId: null,
    influencerId: null,
    id: '',
  ).obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();

  getUser() async {
    token = await storage.read(key: "token");
    try {
      userModelObj.value = await apiClient.getUser(token!);
      if (userModelObj.value.firstName.isEmpty) {
        return ('Something went wrong');
      } else {
        return ('Its Ok');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
