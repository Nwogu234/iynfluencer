import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/search_results_screen/models/search_results_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SearchResultsScreen.
///
/// This class manages the state of the SearchResultsScreen, including the
/// current searchResultsModelObj
class SearchResultsController extends GetxController {
  SearchResultsController(this.searchResultModelObj);

  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;
  var usePlaceholder = false.obs;
  RxString avatar = ''.obs;
  RxList<Influencer> recommendedInfluencers = <Influencer>[].obs;
  RxString? updatedName = ''.obs;
  Rx<File?> updatedProfileImage = Rx<File?>(null);
  Rx<SearchResultsModel> searchResultModelObj;
  RxList<Influencer> filteredInfluencers = <Influencer>[].obs;
  late String? query = '';
  late String? fromDate = '';
  late String? toDate = '';
  late SelectionPopupModel? selectedNiche;
  late SelectionPopupModel? selectedCountry;

  TextEditingController group903Controller = TextEditingController();

  TextEditingController group903oneController = TextEditingController();

  TextEditingController searchController = TextEditingController();

  Rx<SearchResultsModel> searchResultsModelObj = SearchResultsModel().obs;

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser(query ?? '');
  }

  Future<void> loadRecommendedInfluencers() async {
    try {
      await Future.delayed(Duration(seconds: 1));

      recommendedInfluencers.addAll(List.generate(10, (index) => Influencer()));
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

//*animation stops here
  getUser(String? query) async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        print(user.userModelObj.value.avatar);
        isLoading.value = false;
        avatar.value = user.userModelObj.value.avatar;
        getRecommended();
        filterInfluencers(
          query:query,       
          );
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  void getRecommended() async {
    isRecommendedLoading.value = true;
    try {
      error('');
      recommendedInfluencers.value =
          await apiClient.getInfluencers(1, 25, token);
      if (recommendedInfluencers.isEmpty) {
        error('Something went wrong');
        isRecommendedLoading.value = false;
      } else {
        error('');
        isRecommendedLoading.value = false;
      }
    } catch (e) {
      error('Something went wrong');
      print(e);
      isRecommendedLoading.value = false;
    }
  }

  /* void filterInfluencers(String query) async {
    try {
      if (query.isEmpty) {
        filteredInfluencers.value = recommendedInfluencers;
        return;
      }

      filteredInfluencers.value = recommendedInfluencers.where((influencer) {
        final fullName =
            '${influencer.user?.first.firstName ?? ''} ${influencer.user?.first.lastName ?? ''}'
                .toLowerCase();
        final country = influencer.user?.first.country?.toLowerCase() ?? '';
        final jobsCompleted = influencer.jobsDone.toString().toLowerCase();

        return fullName.contains(query.toLowerCase()) ||
            country.contains(query.toLowerCase()) ||
            jobsCompleted.contains(query.toLowerCase());
      }).toList();

      error('');
      isRecommendedLoading.value = false;
    } catch (e) {
      error('Something went wrong');
      print(e);
      isRecommendedLoading.value = false;
    }
  } */

  void filterInfluencers({
  String? query,
  String? fromDate,
  String? toDate,
  SelectionPopupModel? selectedNiche,
  SelectionPopupModel? selectedCountry,
})
    {
    try {
      // Apply query filtering
      filteredInfluencers.value = recommendedInfluencers.where((influencer) {
        final fullName =
            '${influencer.user?.first.firstName ?? ''} ${influencer.user?.first.lastName ?? ''}'
                .toLowerCase();
        final country = influencer.user?.first.country?.toLowerCase() ?? '';
        final jobsCompleted = influencer.jobsDone.toString().toLowerCase();

        return fullName.contains(query!.toLowerCase()) ||
            country.contains(query.toLowerCase()) ||
            jobsCompleted.contains(query.toLowerCase());
      }).toList();

      // Filter by fromDate if it's not empty
      if (fromDate!.isNotEmpty) {
        filteredInfluencers.value = recommendedInfluencers.where((influencer) {
          final influencerFromDate =
              influencer.jobs?.first.createdAt?.substring(0, 4) ?? '';
          int influencerYear = int.parse(influencerFromDate);
          int fromYear = int.parse(fromDate.substring(0, 4));
          return influencerYear >= fromYear;
        }).toList();
      }

      // Filter by toDate if it's not empty
      if (toDate!.isNotEmpty) {
          filteredInfluencers.value = recommendedInfluencers.where((influencer) {
          final influencerFromDate =
              influencer.jobs?.first.createdAt?.substring(0, 4) ?? '';
          int influencerYear = int.parse(influencerFromDate);
          int fromYear = int.parse(fromDate.substring(0, 4));
          return influencerYear >= fromYear;
        }).toList();
      }

      // Filter by selected niche if it's not null
      if (selectedNiche != null) {
        filteredInfluencers.value =
            recommendedInfluencers.where((influencer) {
          return influencer.niche == selectedNiche.title;
        }).toList();
      }

      // Filter by selected country if it's not null
      if (selectedCountry != null) {
        filteredInfluencers.value =
            recommendedInfluencers.where((influencer) {
          return influencer.user?.first.country?.toLowerCase() == selectedCountry.title;
        }).toList();
      }

      error('');
      isRecommendedLoading.value = false;
    } catch (e) {
      error('Something went wrong');
      print(e);
      isRecommendedLoading.value = false;
    }
  }

  @override
  void onInit() {
    print('OnInit called');
    getUser(query);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    group903Controller.dispose();
    group903oneController.dispose();
    searchController.dispose();
  }
}
