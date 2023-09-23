import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/models/complete_profile_influencer_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';

class SocialMediaAccount {
  SelectionPopupModel platformName;
  int followersCount;
  String platformUrl;

  SocialMediaAccount(
      {required this.platformName,
      required this.followersCount,
      required this.platformUrl});
}

class CompleteProfileInfluencerController extends GetxController
    with SingleGetTickerProviderMixin {
  final formKey = GlobalKey<FormState>();
  var storage = FlutterSecureStorage();
  Rx<CompleteProfileInfluencerModel> completeProfileInfluencerModelObj =
      CompleteProfileInfluencerModel(bio: "", niches: [], socials: []).obs;

  RxList<SelectionPopupModel> nicheToDisplay = RxList<SelectionPopupModel>();
  RxList<SelectionPopupModel> platformToDisplay = RxList<SelectionPopupModel>();
  RxString errorText = "".obs;
  final apiClient = ApiClient();
  late AnimationController animationController;
  Animation<double>? fadeInAnimation;

  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  Rx<SelectionPopupModel> selectedNiche =
      SelectionPopupModel(id: 0, title: "Select Niche").obs;
  RxList<SelectionPopupModel> selectedNiches = <SelectionPopupModel>[].obs;
  Rxn<File> profileImage = Rxn<File>();

  final List<SelectionPopupModel> dropdownItems = [
    SelectionPopupModel(id: 0, title: "Select Niche"),
    SelectionPopupModel(
        id: 1, title: "Fashion & Style", value: "Fashion & Style"),
    SelectionPopupModel(id: 2, title: "Beauty", value: "Beauty"),
    SelectionPopupModel(
        id: 3, title: "Health & Fitness", value: "Health & Fitness"),
    SelectionPopupModel(id: 4, title: "Travel", value: "Travel"),
    SelectionPopupModel(
        id: 5, title: "Food & Cooking", value: "Food & Cooking"),
    SelectionPopupModel(
        id: 6, title: "Parenting & Family", value: "Parenting & Family"),
    SelectionPopupModel(id: 7, title: "Tech & Gaming", value: "Tech & Gaming"),
    SelectionPopupModel(
        id: 8,
        title: "Home & Interior Design",
        value: "Home & Interior Design"),
    SelectionPopupModel(
        id: 9, title: "Finance & Investment", value: "Finance & Investment"),
    SelectionPopupModel(
        id: 10,
        title: "Entertainment & Celebrity",
        value: "Entertainment & Celebrity"),
    SelectionPopupModel(
        id: 11, title: "Art & DIY Craft", value: "Art & DIY Craft"),
    SelectionPopupModel(
        id: 12,
        title: "Sustainability & Eco-friendly",
        value: "Sustainability & Eco-friendly"),
    SelectionPopupModel(
        id: 13, title: "Education & Career", value: "Education & Career"),
    SelectionPopupModel(
        id: 14, title: "Science & Technology", value: "Science & Technology"),
    SelectionPopupModel(id: 15, title: "Others", value: "Others"),
  ];

  //this is to add and remove niches from drop down list
  void onDropdownItemChanged(SelectionPopupModel value) {
    selectedNiche.value = value;
    // Check if the item is not already selected
    if (!selectedNiches.contains(value) &&
        value != SelectionPopupModel(id: 0, title: "Select Niche")) {
      selectedNiches.add(value);
    }
    print("onDropdownItemChanged called");
    print("Added value to selectedDropdownItems: ${value.title}");
    print("Current selectedValue: ${selectedNiche.value.title}");
    nicheToDisplay.value =
        dropdownItems.where((item) => !selectedNiches.contains(item)).toList();
    print(nicheToDisplay.map((item) => item.toString()).toList());
    selectedNiche.value = SelectionPopupModel(id: 0, title: "Select Niche");
  }

  //this is to delete niches clip widget
  handleNicheDelete(SelectionPopupModel platform) {
    selectedNiche.value = nicheToDisplay.last;
    update();
    print(selectedNiche.value.id);
    selectedNiches.remove(platform);
    nicheToDisplay.value = dropdownItems
        .where((item) => !selectedNiches.value.contains(item))
        .toList();
    selectedNiche.value = SelectionPopupModel(id: 0, title: "Select Niche");
    print(selectedNiche.value.id);
    update();
  }

  //this part is for social media

  RxList<SelectionPopupModel> socialsToDisplay = RxList<SelectionPopupModel>();
  var socialMediaAccounts = <SocialMediaAccount>[].obs;
  RxList<SelectionPopupModel> selectedPlatforms = <SelectionPopupModel>[].obs;
  var isAddingAccount = false.obs;

  void startAddingAccount() {
    isAddingAccount.value = true;
  }

  void addAccount(SelectionPopupModel platformName, int followersCount,
      String platformUrl) {
    selectedSocialMedia.value = platformName;
    if (!selectedPlatforms.contains(platformName) &&
        platformName !=
            SelectionPopupModel(
                id: 0, title: "Select Platform", value: "Select Platform")) {
      selectedPlatforms.add(platformName);
    }
    platformToDisplay.value = socialMediaPlatforms
        .where((item) => !selectedPlatforms.contains(item))
        .toList();
    selectedSocialMedia.value = SelectionPopupModel(
        id: 0, title: "Select Platform", value: "Select Platform");

    socialMediaAccounts.add(SocialMediaAccount(
        platformName: platformName,
        followersCount: followersCount,
        platformUrl: platformUrl));
    isAddingAccount.value = false;
  }

  final RxList<SelectionPopupModel> socialMediaPlatforms = [
    SelectionPopupModel(
        id: 0, title: "Select Platform", value: "Select Platform"),
    SelectionPopupModel(id: 1, title: "Facebook", value: "Facebook"),
    SelectionPopupModel(id: 2, title: "Instagram", value: "Instagram"),
    SelectionPopupModel(id: 3, title: "Twitter", value: "Twitter"),
    SelectionPopupModel(id: 4, title: "LinkedIn", value: "LinkedIn"),
    SelectionPopupModel(id: 5, title: "Pinterest", value: "Pinterest"),
    SelectionPopupModel(id: 6, title: "Snapchat", value: "Snapchat"),
    SelectionPopupModel(id: 7, title: "YouTube", value: "YouTube"),
    SelectionPopupModel(id: 8, title: "TikTok", value: "TikTok"),
    SelectionPopupModel(id: 9, title: "Reddit", value: "Reddit"),
    SelectionPopupModel(id: 10, title: "Tumblr", value: "Tumblr"),
    SelectionPopupModel(id: 11, title: "Flickr", value: "Flickr"),
    SelectionPopupModel(id: 12, title: "Vimeo", value: "Vimeo"),
    SelectionPopupModel(id: 13, title: "WhatsApp", value: "WhatsApp"),
    SelectionPopupModel(id: 14, title: "WeChat", value: "WeChat"),
    SelectionPopupModel(id: 15, title: "QQ", value: "QQ"),
    SelectionPopupModel(id: 16, title: "QZone", value: "QZone"),
    SelectionPopupModel(id: 17, title: "Twitch", value: "Twitch"),
    SelectionPopupModel(id: 18, title: "Quora", value: "Quora"),
    SelectionPopupModel(id: 19, title: "Telegram", value: "Telegram"),
    SelectionPopupModel(id: 20, title: "Viber", value: "Viber"),
    SelectionPopupModel(id: 21, title: "Line", value: "Line"),
    SelectionPopupModel(id: 22, title: "SlideShare", value: "SlideShare"),
    SelectionPopupModel(
        id: 23, title: "VKontakte (VK)", value: "VKontakte (VK)"),
    SelectionPopupModel(id: 24, title: "Nextdoor", value: "Nextdoor"),
  ].obs;

  Rx<SelectionPopupModel> selectedSocialMedia =
      SelectionPopupModel(title: "Select Platform", value: "Select Platform")
          .obs;

  handleDelete(
      SocialMediaAccount platform, SelectionPopupModel socialPlatform) {
    selectedSocialMedia.value = platformToDisplay.last;
    update();
    selectedPlatforms.remove(socialPlatform);
    platformToDisplay.value = socialMediaPlatforms
        .where((item) => !selectedPlatforms.contains(item))
        .toList();
    selectedSocialMedia.value = SelectionPopupModel(
        id: 0, title: "Select Platform", value: "Select Platform");
    update();
    socialMediaAccounts.remove(platform);
    update();
  }

  ///this is the function called to create the creator profile on the backend
  Future<void> completeProfile() async {
    completeProfileInfluencerModelObj.update((val) {
      val?.bio = bioController.text;
      val?.niches = selectedNiches.value.map((item) => item.title).toList();
      val?.socials = socialMediaAccounts.value
          .map((item) => Social(
              name: item.platformName.title,
              followers: item.followersCount,
              url: item.platformUrl))
          .toList();
    });

    Get.dialog(
      Center(child: CircularProgressIndicator()), // showing a loading dialog
      barrierDismissible: false, // user must not close it manually
    );
    var token = await storage.read(key: "token");

    try {
      Response loginResponse = await apiClient.influencerProfile(
          completeProfileInfluencerModelObj.value, token);
      var headers = loginResponse.headers;
      Get.back();

      if (loginResponse.statusCode == 201) {
        Get.snackbar('Success', 'Profile Updated');
        await storage.write(key: 'activeProfile', value: "Influencer");
        Get.toNamed(
          AppRoutes.influencerTabScreen,
        );
      } else {
        print(loginResponse.statusCode);
        Get.snackbar('Failure',
            'Profile activation failed! ${loginResponse.body['message']}');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Profile activation failed');
    }
  }

  @override
  void onInit() {
    // Initialize animation controller
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animationController.forward();

    // Define fade-in animation
    fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.easeIn),
    );

    print('OnInit called');
    super.onInit();
    nicheToDisplay.value =
        dropdownItems.where((item) => !selectedNiches.contains(item)).toList();
    selectedNiche.value = SelectionPopupModel(id: 0, title: "Select Niche");

    platformToDisplay.value = socialMediaPlatforms
        .where((item) => !selectedPlatforms.contains(item))
        .toList();
    selectedSocialMedia.value = SelectionPopupModel(
        id: 0, title: "Select Platform", value: "Select Platform");

    print(nicheToDisplay.value);
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
    usernameController.dispose();
    bioController.dispose();
  }
}
