import '../bids_screen/widgets/bids_item_widget.dart';import 'controller/bids_controller.dart';import 'models/bids_item_model.dart';import 'package:flutter/material.dart';import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';class BidsScreen extends GetWidget<BidsController> {const BidsScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(48), leadingWidth: 50, leading: AppbarImage(height: getSize(30), width: getSize(30), svgPath: ImageConstant.imgArrowleftGray600, margin: getMargin(left: 20, top: 9, bottom: 9), onTap: () {onTapArrowleft2();}), centerTitle: true, title: AppbarTitle(text: "lbl_all_bids".tr), styleType: Style.bgOutlineIndigo50), body: Container(width: double.maxFinite, padding: getPadding(top: 14, bottom: 14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Padding(padding: getPadding(left: 22), child: Row(children: [RichText(text: TextSpan(children: [TextSpan(text: "lbl_all_bids2".tr, style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(14), fontFamily: 'Satoshi', fontWeight: FontWeight.w700)), TextSpan(text: "  ".tr, style: TextStyle(color: ColorConstant.gray600, fontSize: getFontSize(14), fontFamily: 'Satoshi', fontWeight: FontWeight.w700)), TextSpan(text: "lbl_12".tr, style: TextStyle(color: ColorConstant.gray600, fontSize: getFontSize(13), fontFamily: 'Satoshi', fontWeight: FontWeight.w700))]), textAlign: TextAlign.left), CustomImageView(svgPath: ImageConstant.imgArrowup, height: getSize(20), width: getSize(20), margin: getMargin(left: 6))])), Expanded(child: Padding(padding: getPadding(top: 4), child: Obx(() => ListView.separated(physics: BouncingScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(1));}, itemCount: controller.bidsModelObj.value.bidsItemList.value.length, itemBuilder: (context, index) {BidsItemModel model = controller.bidsModelObj.value.bidsItemList.value[index]; return BidsItemWidget(model, onTapViewdetails: () {onTapViewdetails();});}))))])))); } 
/// Navigates to the bidRequestScreen when the action is triggered.
/// When the action is triggered, this function uses the `Get` package to
/// push the named route for the bidRequestScreen.
onTapViewdetails() { Get.toNamed(AppRoutes.bidRequestScreen); } 


/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] library to 
/// navigate to the previous screen in the navigation stack.
onTapArrowleft2() { Get.back(); } 
 }
