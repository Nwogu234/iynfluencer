import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CompleteJobController extends GetxController with GetSingleTickerProviderStateMixin{
  final formKey = GlobalKey<FormState>();
   Rx<bool> isLoading = false.obs;
   TextEditingController projectController = TextEditingController();
   TextEditingController frametwelveController = TextEditingController();

 
}
