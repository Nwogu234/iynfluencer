import '../notification_liked_post_screen/widgets/listgroup853_item_widget.dart';import 'controller/notification_liked_post_controller.dart';import 'models/listgroup853_item_model.dart';import 'package:flutter/material.dart';import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';class NotificationLikedPostScreen extends GetWidget<NotificationLikedPostController> {const NotificationLikedPostScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(48), leadingWidth: 50, leading: AppbarImage(height: getSize(30), width: getSize(30), svgPath: ImageConstant.imgArrowleftGray600, margin: getMargin(left: 20, top: 9, bottom: 9), onTap: () {onTapArrowleft11();}), centerTitle: true, title: AppbarTitle(text: "lbl_notifications".tr), styleType: Style.bgOutlineIndigo50), body: Obx(() => ListView.separated(physics: BouncingScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(1));}, itemCount: controller.notificationLikedPostModelObj.value.listgroup853ItemList.value.length, itemBuilder: (context, index) {Listgroup853ItemModel model = controller.notificationLikedPostModelObj.value.listgroup853ItemList.value[index]; return Listgroup853ItemWidget(model);})))); } 


/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] library to 
/// navigate to the previous screen in the navigation stack.
onTapArrowleft11() { Get.back(); } 
 }
