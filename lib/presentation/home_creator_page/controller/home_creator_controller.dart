import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';import 'package:flutter/material.dart';/// A controller class for the HomeCreatorPage.
///
/// This class manages the state of the HomeCreatorPage, including the
/// current homeCreatorModelObj
class HomeCreatorController extends GetxController {HomeCreatorController(this.homeCreatorModelObj);

TextEditingController searchController = TextEditingController();

Rx<HomeCreatorModel> homeCreatorModelObj;

@override void onClose() { super.onClose(); searchController.dispose(); } 
 }
