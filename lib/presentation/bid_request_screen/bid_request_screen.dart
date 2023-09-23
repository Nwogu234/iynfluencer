import 'controller/bid_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class BidRequestScreen extends GetWidget<BidRequestController> {
  const BidRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(48),
                leadingWidth: 50,
                leading: AppbarImage(
                    height: getSize(30),
                    width: getSize(30),
                    svgPath: ImageConstant.imgArrowleftGray600,
                    margin: getMargin(left: 20, top: 9, bottom: 9),
                    onTap: () {
                      onTapArrowleft3();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_bid".tr),
                styleType: Style.bgOutlineIndigo50_1),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 13, right: 20, bottom: 13),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(right: 5),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgGroup8528,
                                height: getSize(45),
                                width: getSize(45),
                                radius: BorderRadius.circular(getSize(22.5))),
                            Padding(
                                padding:
                                    getPadding(left: 16, top: 6, bottom: 2),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_mark_adebayo".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiBold13Gray900ab),
                                      Text("lbl_lagos_nigeria".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiLight13)
                                    ])),
                            Spacer(),
                            CustomImageView(
                                svgPath: ImageConstant.imgVector,
                                height: getVerticalSize(1),
                                width: getHorizontalSize(13),
                                margin: getMargin(top: 22, bottom: 21))
                          ])),
                      Padding(
                          padding: getPadding(top: 30),
                          child: Text("lbl_cover_letter".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold14Gray900)),
                      Container(
                          width: getHorizontalSize(331),
                          margin: getMargin(left: 1, top: 10),
                          child: Text("msg_while_cover_letters".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight13Gray900ab)),
                      Padding(
                          padding: getPadding(top: 30),
                          child: Text("lbl_bid_details".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold14Gray900)),
                      Padding(
                          padding: getPadding(top: 13, right: 79),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 1),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_asking_amount".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSatoshiLight135Gray600),
                                          Padding(
                                              padding: getPadding(top: 3),
                                              child: Text("lbl_500".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiBold125Gray900a7))
                                        ])),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_date".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiLight135Gray600),
                                      Padding(
                                          padding: getPadding(top: 5),
                                          child: Text("lbl_mar_22_2023".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSatoshiBold125Gray900a7))
                                    ])
                              ])),
                      Padding(
                          padding: getPadding(top: 29),
                          child: Text("msg_about_influencer".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold14Gray900)),
                      Padding(
                          padding: getPadding(left: 1, top: 15, right: 76),
                          child: Row(children: [
                            Padding(
                                padding: getPadding(top: 1),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("msg_13_jobs_completed".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiBold125Gray900a7),
                                      Padding(
                                          padding: getPadding(top: 3),
                                          child: Text("lbl_view_profile".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSatoshiLight135Blue900))
                                    ])),
                            Padding(
                                padding: getPadding(left: 71, bottom: 1),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_member_since".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiLight135Gray600),
                                      Padding(
                                          padding: getPadding(top: 3),
                                          child: Text("lbl_mar_2022".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSatoshiBold125Gray900a7))
                                    ]))
                          ])),
                      CustomButton(
                          height: getVerticalSize(30),
                          width: getHorizontalSize(86),
                          text: "lbl_message".tr,
                          margin: getMargin(top: 12, bottom: 5),
                          variant: ButtonVariant.FillGray200ab,
                          padding: ButtonPadding.PaddingAll4,
                          fontStyle: ButtonFontStyle.SatoshiBold13)
                    ])),
            bottomNavigationBar: Container(
                margin: getMargin(left: 20, right: 20, bottom: 36),
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          height: getVerticalSize(44),
                          text: "lbl_hire".tr,
                          padding: ButtonPadding.PaddingAll12),
                      CustomButton(
                          height: getVerticalSize(44),
                          text: "lbl_decline".tr,
                          margin: getMargin(top: 10),
                          variant: ButtonVariant.Neutral,
                          padding: ButtonPadding.PaddingAll12,
                          fontStyle: ButtonFontStyle.SatoshiBold14Gray900)
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft3() {
    Get.back();
  }
}
