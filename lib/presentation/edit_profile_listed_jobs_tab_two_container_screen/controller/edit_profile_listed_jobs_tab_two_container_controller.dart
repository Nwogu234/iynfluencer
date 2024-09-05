import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';

import '../../../data/models/Creator/creator_response_model.dart';

/// A controller class for the EditProfileListedJobsTabTwoContainerScreen.
///
/// This class manages the state of the EditProfileListedJobsTabTwoContainerScreen, including the
/// current editProfileListedJobsTabTwoContainerModelObj
class EditProfileListedJobsTabTwoContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /* Rx<EditProfileListedJobsTabTwoContainerModel>
      editProfileListedJobsTabTwoContainerModelObj =
      EditProfileListedJobsTabTwoContainerModel().obs;
 */
  late TabController tabviewController;

  final storage = new FlutterSecureStorage();
  var token;

  ApiClient client = ApiClient();
  Rx<CreatorProfile?> _profile = Rx<CreatorProfile?>(null);

  Rx<CreatorProfile?> get profileRx => _profile;
  Future<CreatorProfile?> getProfile() async {
    token = await storage.read(key: 'token');
    try {
      print("this is running");
      var response = await client.getCreatorProfile(token);

      Map<String, dynamic> jsonResponse;
      // Check if the response body is already a decoded JSON object
      if (response.body is Map<String, dynamic>) {
        jsonResponse = response.body;
      } else {
        // Otherwise, decode it assuming it's a JSON-encoded string
        jsonResponse = json.decode(response.body);
      }
      print("no issues");
      _profile.value = CreatorProfile.fromJson(jsonResponse);
      return CreatorProfile.fromJson(jsonResponse);
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabviewController = TabController(vsync: this, length: 2);
    _profile.listen((p) {
      print("Profile updated: $p");
      
    });
    getProfile();
  }

  @override
  void onClose() {
    super.onClose();
    tabviewController.dispose();
  }
}
