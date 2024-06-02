import 'controller/job_client_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class JobClientScreen extends GetWidget<JobClientController> {
  const JobClientScreen({Key? key}) : super(key: key);

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
                      onTapArrowleft4();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_job_details".tr),
                styleType: Style.bgOutlineIndigo50_1),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 24),
                    child: Padding(
                        padding: getPadding(bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 19),
                                  child: Text("msg_media_app_influencer".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold18)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgRectangle5069,
                                  height: getVerticalSize(221),
                                  width: getHorizontalSize(375),
                                  margin: getMargin(top: 22)),
                              Padding(
                                  padding: getPadding(left: 20, top: 27),
                                  child: Text("lbl_description".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold14Gray900)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: getHorizontalSize(324),
                                      margin: getMargin(
                                          left: 20, top: 9, right: 30),
                                      child: Text("msg_looking_for_a_game2".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiLight13Gray900ab))),
                              Padding(
                                  padding: getPadding(left: 20, top: 29),
                                  child: Text("lbl_responsiblities".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold14Gray900)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: getHorizontalSize(334),
                                      margin: getMargin(
                                          left: 20, top: 9, right: 20),
                                      child: Text("msg_playing_and_testing".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiLight13Gray900ab))),
                              Padding(
                                  padding:
                                      getPadding(left: 20, top: 27, right: 44),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_influencer".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight135Gray600),
                                              Padding(
                                                  padding: getPadding(top: 5),
                                                  child: Row(children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgGroup85230x30,
                                                        height: getSize(30),
                                                        width: getSize(30),
                                                        radius: BorderRadius
                                                            .circular(
                                                                getSize(15.0))),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 12,
                                                            top: 7,
                                                            bottom: 3),
                                                        child: Text(
                                                            "lbl_mark_adebayo"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSatoshiBold14Gray900ab))
                                                  ]))
                                            ]),
                                        Padding(
                                            padding:
                                                getPadding(top: 2, bottom: 3),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_project_status".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiLight135Gray600),
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(25),
                                                      width:
                                                          getHorizontalSize(83),
                                                      text:
                                                          "lbl_in_progress".tr,
                                                      margin: getMargin(top: 3),
                                                      variant: ButtonVariant
                                                          .FillLime100b2,
                                                      shape: ButtonShapes
                                                          .RoundedBorder12,
                                                      padding: ButtonPadding
                                                          .PaddingAll4,
                                                      fontStyle: ButtonFontStyle
                                                          .SatoshiBold115)
                                                ]))
                                      ])),
                              Padding(
                                  padding:
                                      getPadding(left: 20, top: 15, right: 50),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_project_cost".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiLight135Gray600),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 7),
                                                      child: Text("lbl_200".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtSatoshiBold125Gray900a7))
                                                ])),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_deadline".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight135Gray600),
                                              Padding(
                                                  padding: getPadding(top: 9),
                                                  child: Text(
                                                      "lbl_mar_18_2023".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiBold125Gray900a7))
                                            ])
                                      ]))
                            ])))),
            bottomNavigationBar: Container(
                margin: getMargin(left: 20, right: 20, bottom: 52),
                decoration: AppDecoration.outlineIndigo503,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          height: getVerticalSize(44),
                          text: "lbl_completed".tr,
                          padding: ButtonPadding.PaddingAll12),
                      CustomButton(
                          height: getVerticalSize(44),
                          text: "lbl_dispute".tr,
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
  onTapArrowleft4() {
    Get.back();
  }
}
