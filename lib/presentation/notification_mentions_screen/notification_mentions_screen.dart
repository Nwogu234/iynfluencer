import '../notification_mentions_screen/widgets/listgroup852_item_widget.dart';import 'controller/notification_mentions_controller.dart';import 'models/listgroup852_item_model.dart';import 'package:flutter/material.dart';import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';class NotificationMentionsScreen extends GetWidget<NotificationMentionsController> {const NotificationMentionsScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(48), leadingWidth: 50, leading: AppbarImage(height: getSize(30), width: getSize(30), svgPath: ImageConstant.imgArrowleftGray600, margin: getMargin(left: 20, top: 9, bottom: 9), onTap: () {onTapArrowleft9();}), centerTitle: true, title: AppbarTitle(text: "lbl_notifications".tr), styleType: Style.bgOutlineIndigo50), body: Obx(() => ListView.separated(physics: BouncingScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(1));}, itemCount: controller.notificationMentionsModelObj.value.listgroup852ItemList.value.length, itemBuilder: (context, index) {Listgroup852ItemModel model = controller.notificationMentionsModelObj.value.listgroup852ItemList.value[index]; return Listgroup852ItemWidget(model);})))); } 


/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] library to 
/// navigate to the previous screen in the navigation stack.
onTapArrowleft9() { Get.back(); } 
 }
