import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/search_creator_screen/models/search_creator_model.dart';import 'package:flutter/material.dart';/// A controller class for the SearchCreatorScreen.
///
/// This class manages the state of the SearchCreatorScreen, including the
/// current searchCreatorModelObj
class SearchCreatorController extends GetxController {TextEditingController searchController = TextEditingController();

Rx<SearchCreatorModel> searchCreatorModelObj = SearchCreatorModel().obs;

@override void onClose() { super.onClose(); searchController.dispose(); } 
 }
