import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/search_influncers_screen/models/search_influncers_model.dart';import 'package:flutter/material.dart';/// A controller class for the SearchInfluncersScreen.
///
/// This class manages the state of the SearchInfluncersScreen, including the
/// current searchInfluncersModelObj
class SearchInfluncersController extends GetxController {TextEditingController searchController = TextEditingController();

Rx<SearchInfluncersModel> searchInfluncersModelObj = SearchInfluncersModel().obs;

@override void onClose() { super.onClose(); searchController.dispose(); } 
 }
