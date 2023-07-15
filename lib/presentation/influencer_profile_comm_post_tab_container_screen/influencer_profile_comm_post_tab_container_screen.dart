import 'controller/influencer_profile_comm_post_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/influencer_profile_about_page/influencer_profile_about_page.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_page/influencer_profile_comm_post_page.dart';
import 'package:iynfluencer/presentation/influencer_profile_jobs_page/influencer_profile_jobs_page.dart';
import 'package:iynfluencer/presentation/influencer_profile_review_page/influencer_profile_review_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class InfluencerProfileCommPostTabContainerScreen
    extends GetWidget<InfluencerProfileCommPostTabContainerController> {
  const InfluencerProfileCommPostTabContainerScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: getVerticalSize(361),
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                    height: getVerticalSize(170),
                                    width: double.maxFinite,
                                    child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgRectangle5059,
                                              height: getVerticalSize(170),
                                              width: getHorizontalSize(375),
                                              alignment: Alignment.center),
                                          CustomAppBar(
                                              height: getVerticalSize(44),
                                              leadingWidth: 45,
                                              leading: AppbarImage(
                                                  height: getSize(30),
                                                  width: getSize(30),
                                                  svgPath: ImageConstant
                                                      .imgArrowleftGray200,
                                                  margin: getMargin(left: 15),
                                                  onTap: () {
                                                    onTapArrowleft7();
                                                  }),
                                              actions: [
                                                AppbarImage(
                                                    height: getVerticalSize(26),
                                                    width:
                                                        getHorizontalSize(60),
                                                    svgPath: ImageConstant
                                                        .imgComputer,
                                                    margin: getMargin(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 4))
                                              ])
                                        ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 20),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgEllipse20685x85,
                                              height: getSize(85),
                                              width: getSize(85),
                                              radius: BorderRadius.circular(
                                                  getHorizontalSize(42)),
                                              margin: getMargin(left: 10)),
                                          Padding(
                                              padding: getPadding(top: 18),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("lbl_bariga_oscar2".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSatoshiBold24),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 1, top: 4),
                                                        child: Text(
                                                            "lbl_abuja_nigeria"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSatoshiLight14Gray900a2)),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 5),
                                                        child: Row(children: [
                                                          CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgFrameAmber500,
                                                              height:
                                                                  getSize(18),
                                                              width:
                                                                  getSize(18),
                                                              margin: getMargin(
                                                                  bottom: 1)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 6,
                                                                      bottom:
                                                                          1),
                                                              child: RichText(
                                                                  text: TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                            text: "lbl_3_52"
                                                                                .tr,
                                                                            style: TextStyle(
                                                                                color: ColorConstant.gray900,
                                                                                fontSize: getFontSize(13.5),
                                                                                fontFamily: 'Satoshi',
                                                                                fontWeight: FontWeight.w300)),
                                                                        TextSpan(
                                                                            text:
                                                                                " ",
                                                                            style: TextStyle(
                                                                                color: ColorConstant.blueGray400,
                                                                                fontSize: getFontSize(13.5),
                                                                                fontFamily: 'Satoshi',
                                                                                fontWeight: FontWeight.w300))
                                                                      ]),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left)),
                                                          CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgFrameBlueGray400,
                                                              height:
                                                                  getSize(15),
                                                              width:
                                                                  getSize(15),
                                                              margin: getMargin(
                                                                  left: 8,
                                                                  top: 1,
                                                                  bottom: 3)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 8,
                                                                      top: 1),
                                                              child: Text(
                                                                  "msg_8_jobs_completed"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSatoshiLight135))
                                                        ]))
                                                  ])),
                                          Padding(
                                              padding:
                                                  getPadding(left: 2, top: 14),
                                              child: Row(children: [
                                                CustomButton(
                                                    height: getVerticalSize(34),
                                                    width:
                                                        getHorizontalSize(101),
                                                    text: "lbl_hire".tr,
                                                    padding:
                                                        ButtonPadding.PaddingT4,
                                                    fontStyle: ButtonFontStyle
                                                        .SatoshiBold15,
                                                    prefixWidget: Container(
                                                        margin:
                                                            getMargin(right: 6),
                                                        child: CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgFrameWhiteA70018x18))),
                                                CustomButton(
                                                    height: getVerticalSize(34),
                                                    width:
                                                        getHorizontalSize(110),
                                                    text: "lbl_message".tr,
                                                    margin: getMargin(left: 12),
                                                    variant: ButtonVariant
                                                        .FillGray200ab,
                                                    padding: ButtonPadding
                                                        .PaddingAll4,
                                                    fontStyle: ButtonFontStyle
                                                        .SatoshiBold15Gray900)
                                              ]))
                                        ])))
                          ])),
                      Expanded(
                          child: SingleChildScrollView(
                              padding: getPadding(top: 11),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: double.maxFinite,
                                        child: Container(
                                            width: double.maxFinite,
                                            padding: getPadding(
                                                left: 11,
                                                top: 1,
                                                right: 11,
                                                bottom: 1),
                                            decoration:
                                                AppDecoration.outlineIndigo501,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      height:
                                                          getVerticalSize(44),
                                                      width: getHorizontalSize(
                                                          347),
                                                      margin:
                                                          getMargin(bottom: 6),
                                                      child: TabBar(
                                                          controller: controller
                                                              .tabviewController,
                                                          labelColor: ColorConstant
                                                              .cyan300,
                                                          labelStyle: TextStyle(
                                                              fontSize: getFontSize(
                                                                  14),
                                                              fontFamily:
                                                                  'Satoshi',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                          unselectedLabelColor:
                                                              ColorConstant
                                                                  .gray600,
                                                          unselectedLabelStyle:
                                                              TextStyle(
                                                                  fontSize:
                                                                      getFontSize(
                                                                          14),
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                          indicatorColor:
                                                              ColorConstant
                                                                  .cyan300,
                                                          tabs: [
                                                            Tab(
                                                                child: Text(
                                                                    "lbl_about"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis)),
                                                            Tab(
                                                                child: Text(
                                                                    "lbl_posts"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis)),
                                                            Tab(
                                                                child: Text(
                                                                    "lbl_jobs"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis)),
                                                            Tab(
                                                                child: Text(
                                                                    "lbl_reviews"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis))
                                                          ]))
                                                ]))),
                                    SizedBox(
                                        height: getVerticalSize(701),
                                        child: TabBarView(
                                            controller:
                                                controller.tabviewController,
                                            children: [
                                              InfluencerProfileAboutPage(),
                                              InfluencerProfileCommPostPage(),
                                              InfluencerProfileJobsPage(),
                                              InfluencerProfileReviewPage()
                                            ]))
                                  ])))
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft7() {
    Get.back();
  }
}
