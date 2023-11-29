import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/complete_profile_creator_screen/models/complete_profile_creator_model.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/models/complete_profile_influencer_model.dart';
import 'package:iynfluencer/presentation/edit_profile_details_screen/models/edit_profile_details_model.dart';

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
          avatar: '')
      .obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  Rx<CompleteProfileInfluencerModel> completeProfileInfluencerModelObj =
      CompleteProfileInfluencerModel(bio: "", niches: [], socials: [], user: [])
          .obs;

  Rx<CompleteProfileCreatorModel> completeProfileCreatorModelObj =
      CompleteProfileCreatorModel(bio: "", niches: [], socials: [], user: [])
          .obs;

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
      Get.snackbar('Error', 'Failed to upload image. Please try again.');
      print('Failed to obtain pre-signed URL');
      return;
    }
    print(response.body);
    String presignedUrl = response.body['data']['uploadUrl'];

    // 2. Upload the file using the pre-signed URL
    final file = File(filePath);
    final List<int> fileBytes = file.readAsBytesSync();

    final uploadResponse = await http.put(
      Uri.parse(presignedUrl),
      headers: {
        'Content-Type':
            'image/jpeg', // This should match what you set in the backend
      },
      body: fileBytes,
    );

    if (uploadResponse.statusCode == 200) {
      print('File successfully uploaded');
      String picUrl = presignedUrl.split('?').first;
      final response = await apiClient.postAvatar(picUrl, token);
      if (response.isOk) {
        Get.back();
        Get.snackbar('Success', 'Image uploaded');
        print('Success: ${response.body}');
      } else {
        Get.back();
        Get.snackbar('Error', 'Failed to upload image. Please try again.');
        print('Error: ${response.body}');
      }
      print(uploadResponse.body);
    } else {
      Get.back();
      Get.snackbar('Error', 'Failed to upload image. Please try again.');
      print('File upload failed');
    }
  }

  // Function to edit the influncer profile
  Future<Map<String, dynamic>?> editInfluencerProfile({
    required String bio,
    required String niches,
    required String firstName,
    required String lastName,
    required String country,
    required File? profileImageFile,
  }) async {
    token = await storage.read(key: "token");

    completeProfileInfluencerModelObj.update((val) {
      val?.bio = bio;
      val?.niches = niches.split(',').map((e) => e.trim()).toList();
      if (val?.user.isNotEmpty == true) {
        final updatedUser = User(
          id: val?.user[0].id,
          firstName: firstName,
          lastName: lastName,
          userId: val?.user[0].userId,
          country: country,
          avatar: val?.user[0].avatar,
        );
        val?.user[0] = updatedUser;
      }
    });

    // get profile details
    await getUser();

    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      Response updateResponse = await apiClient.updateInfluencerProfile(
        completeProfileInfluencerModelObj.value,
        token!,
      );

      Get.back();

      if (updateResponse.statusCode == 201) {
        Get.snackbar('Success', 'Profile Updated');

        // Check if there is a profile image to update
        if (profileImageFile != null) {
          // Upload the profile image
          await uploadUserPic(profileImageFile.path);
        }

        await storage.write(key: 'activeProfile', value: "Influencer");
        // Return the updated profile details and profile image path
        return {
          'profileDetails': completeProfileInfluencerModelObj.value,
          'profileImagePath': profileImageFile?.path,
        };
      } else {
        print(updateResponse.statusCode);
        Get.snackbar('Failure',
            'Profile activation failed! ${updateResponse.body['message']}');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Profile activation failed');
    }
    return null;
  }

  // Function to edit the creator profile
  Future<Map<String, dynamic>?> editCreatorProfile({
    required String bio,
    required String niches,
    required String firstName,
    required String lastName,
    required String country,
    required File? profileImageFile,
  }) async {
    token = await storage.read(key: "token");

    completeProfileCreatorModelObj.update((val) {
      val?.bio = bio;
      val?.niches = niches.split(',').map((e) => e.trim()).toList();
      if (val?.user.isNotEmpty == true) {
        final updatedUser = Users(
          id: val?.user[0].id,
          firstName: firstName,
          lastName: lastName,
          userId: val?.user[0].userId,
          country: country,
          avatar: val?.user[0].avatar,
        );
        val?.user[0] = updatedUser;
      }
    });

    // get profile details
    await getUser();

    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      Response updateResponse = await apiClient.updateCreatorProfile(
        completeProfileCreatorModelObj.value,
        token!,
      );

      Get.back();

      if (updateResponse.statusCode == 201) {
        Get.snackbar('Success', 'Profile Updated');

        // Check if there is a profile image to update
        if (profileImageFile != null) {
          // Upload the profile image
          await uploadUserPic(profileImageFile.path);
        }

        await storage.write(key: 'activeProfile', value: "Creator");
        // Return the updated profile details and profile image path
        return {
          'profileDetails': completeProfileCreatorModelObj.value,
          'profileImagePath': profileImageFile?.path,
        };
      } else {
        print(updateResponse.statusCode);
        Get.snackbar('Failure',
            'Profile activation failed! ${updateResponse.body['message']}');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Profile activation failed');
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
