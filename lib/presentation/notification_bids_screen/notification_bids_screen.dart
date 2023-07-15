import '../notification_bids_screen/widgets/notificationbid_item_widget.dart';import 'controller/notification_bids_controller.dart';import 'models/notificationbid_item_model.dart';import 'package:flutter/material.dart';import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';class NotificationBidsScreen extends GetWidget<NotificationBidsController> {const NotificationBidsScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(48), leadingWidth: 50, leading: AppbarImage(height: getSize(30), width: getSize(30), svgPath: ImageConstant.imgArrowleftGray600, margin: getMargin(left: 20, top: 9, bottom: 9), onTap: () {onTapArrowleft10();}), centerTitle: true, title: AppbarTitle(text: "lbl_notifications".tr), styleType: Style.bgOutlineIndigo50), body: Obx(() => ListView.separated(physics: BouncingScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(1));}, itemCount: controller.notificationBidsModelObj.value.notificationbidItemList.value.length, itemBuilder: (context, index) {NotificationbidItemModel model = controller.notificationBidsModelObj.value.notificationbidItemList.value[index]; return NotificationbidItemWidget(model);})))); } 


/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] library to 
/// navigate to the previous screen in the navigation stack.
onTapArrowleft10() { Get.back(); } 
 }
