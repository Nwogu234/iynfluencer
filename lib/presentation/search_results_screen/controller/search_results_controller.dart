import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/search_results_screen/models/search_results_model.dart';import 'package:flutter/material.dart';/// A controller class for the SearchResultsScreen.
///
/// This class manages the state of the SearchResultsScreen, including the
/// current searchResultsModelObj
class SearchResultsController extends GetxController {TextEditingController group903Controller = TextEditingController();

TextEditingController group903oneController = TextEditingController();

TextEditingController searchController = TextEditingController();

Rx<SearchResultsModel> searchResultsModelObj = SearchResultsModel().obs;

@override void onClose() { super.onClose(); group903Controller.dispose(); group903oneController.dispose(); searchController.dispose(); } 
 }
