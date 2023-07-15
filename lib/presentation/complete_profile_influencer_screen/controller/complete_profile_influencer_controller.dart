import 'dart:io';

import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/models/complete_profile_influencer_model.dart';
import 'package:flutter/material.dart';



class SocialMediaAccount {
  String platformName;
  int followersCount;
  String platformUrl;

  SocialMediaAccount({required this.platformName, required this.followersCount, required this.platformUrl});
}
class CompleteProfileInfluencerController extends GetxController {

  final formKey = GlobalKey<FormState>();




  var socialMediaAccounts = <SocialMediaAccount>[].obs;
  var isAddingAccount = false.obs;

  void startAddingAccount() {
    isAddingAccount.value = true;
  }

  void addAccount(String platformName, int followersCount, String platformUrl) {
    socialMediaAccounts.add(SocialMediaAccount(platformName: platformName, followersCount: followersCount, platformUrl: platformUrl));
    isAddingAccount.value = false;
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  RxString selectedNiche = RxString('');
  RxString selectedSocialMediaPlatform = RxString('');
  Rxn<File> profileImage = Rxn<File>();

  final List<SelectionPopupModel> dropdownItems = [
    SelectionPopupModel(id: 1, title: "Fashion & Style", value: "Fashion & Style"),
    SelectionPopupModel(id: 2, title: "Beauty", value: "Beauty"),
    SelectionPopupModel(id: 3, title: "Health & Fitness", value: "Health & Fitness"),
    SelectionPopupModel(id: 4, title: "Travel", value: "Travel"),
    SelectionPopupModel(id: 5, title: "Food & Cooking", value: "Food & Cooking"),
    SelectionPopupModel(id: 6, title: "Parenting & Family", value: "Parenting & Family"),
    SelectionPopupModel(id: 7, title: "Tech & Gaming", value: "Tech & Gaming"),
    SelectionPopupModel(id: 8, title: "Home & Interior Design", value: "Home & Interior Design"),
    SelectionPopupModel(id: 9, title: "Finance & Investment", value: "Finance & Investment"),
    SelectionPopupModel(id: 10, title: "Entertainment & Celebrity", value: "Entertainment & Celebrity"),
    SelectionPopupModel(id: 11, title: "Art & DIY Craft", value: "Art & DIY Craft"),
    SelectionPopupModel(id: 12, title: "Sustainability & Eco-friendly", value: "Sustainability & Eco-friendly"),
    SelectionPopupModel(id: 13, title: "Education & Career", value: "Education & Career"),
    SelectionPopupModel(id: 14, title: "Science & Technology", value: "Science & Technology"),
    SelectionPopupModel(id: 15, title: "Others", value: "Others"),
  ];

  Rx<SelectionPopupModel> selectedDropdownItem = SelectionPopupModel(id: 1, title: "Fashion & Style", value: "Fashion & Style").obs;




  final List<SelectionPopupModel> socialMediaPlatforms = [
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
    SelectionPopupModel(id: 23, title: "VKontakte (VK)", value: "VKontakte (VK)"),
    SelectionPopupModel(id: 24, title: "Nextdoor", value: "Nextdoor"),
  ];

  Rx<SelectionPopupModel> selectedSocialMedia =
      SelectionPopupModel(id: 1, title: "Facebook", value: "Facebook").obs;

   handleDelete(SocialMediaAccount platform) {
    socialMediaAccounts.remove(platform);
    update();
  }
  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    bioController.dispose();
  }
}
