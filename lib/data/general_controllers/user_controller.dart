import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    avatar: ''
  ).obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();


  getUser()async{
    token = await storage.read(key: "token");
    try{
      userModelObj.value = await apiClient.getUser(token!);
      if (userModelObj.value.firstName.isEmpty){
        return ('Something went wrong');
      }
      else{
        return ('Its Ok');
      }}
    catch(e){
      print(e);
    }
  }
  Future<void> uploadUserPic(String filePath) async {
    Get.dialog(
      Center(child: CircularProgressIndicator()), // showing a loading dialog
      barrierDismissible: false, // user must not close it manually
    );
    token = await storage.read(key: "token");
    // 1. Get the pre-signed URL from your backend
    final response = await apiClient.getPicUrl(token);

    if (!response.isOk) {
      Get.back();
      Get.snackbar('Error',
          'Failed to upload image. Please try again.');
      print('Failed to obtain pre-signed URL');
      return;
    }
    print(response.body);
    String presignedUrl = response.body['data']['uploadUrl'];

    // 2. Upload the file using the pre-signed URL
    final file = File(filePath);
    final uploadResponse = await http.put(
      Uri.parse(presignedUrl),
      headers: {
    'Content-Type': 'image/jpeg', // This should match what you set in the backend
      },
      body: file.readAsBytesSync(),
    );

    if (uploadResponse.statusCode == 200) {
      print('File successfully uploaded');
      String picUrl =presignedUrl.split('?').first;
      final response = await apiClient.postAvatar(picUrl,token);
      if (response.isOk) {
        Get.back();
        Get.snackbar('Success',
            'Image uploaded');
        print('Success: ${response.body}');
      } else {
        Get.back();
        Get.snackbar('Error',
            'Failed to upload image. Please try again.');
        print('Error: ${response.body}');
      }
      print(uploadResponse.body);
    } else {
      Get.back();
      Get.snackbar('Error',
          'Failed to upload image. Please try again.');
      print('File upload failed');
    }
  }
  @override
  void onClose() {
    super.onClose();
  }
}
