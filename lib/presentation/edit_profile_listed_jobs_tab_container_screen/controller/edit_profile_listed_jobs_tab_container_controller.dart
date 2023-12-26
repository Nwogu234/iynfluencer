import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_container_screen/models/edit_profile_listed_jobs_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

/// A controller class for the EditProfileListedJobsTabContainerScreen.
///
/// This class manages the state of the EditProfileListedJobsTabContainerScreen, including the
/// current editProfileListedJobsTabContainerModelObj
class EditProfileListedJobsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<EditProfileListedJobsTabContainerModel>
      editProfileListedJobsTabContainerModelObj =
      EditProfileListedJobsTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
  final storage = new FlutterSecureStorage();
  var token;

  ApiClient client = ApiClient();
  Rx<InfluencerProfile?> _profile = Rx<InfluencerProfile?>(null);

  Rx<InfluencerProfile?> get profileRx => _profile;
  Future<InfluencerProfile?> getProfile() async {
    token = await storage.read(key: 'token');
    try {
      print("this is running");
      var response = await client.getInfluencerProfile(token);
      if (response.body['status'] == 'SUCCESS') {
        Map<String, dynamic> jsonResponse;
        // Check if the response body is already a decoded JSON object
        if (response.body is Map<String, dynamic>) {
          jsonResponse = response.body['data'];
        } else {
          // Otherwise, decode it assuming it's a JSON-encoded string
          jsonResponse = json.decode(response.body['data']);
        }
        print("no issues");
        _profile.value = InfluencerProfile.fromJson(jsonResponse);
        return InfluencerProfile.fromJson(jsonResponse);
      }
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
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
