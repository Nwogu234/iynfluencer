import 'package:iynfluencer/presentation/jobs_jobs_influencer_tab_container_screen/jobs_jobs_influencer_tab_container_screen.dart';

import '../influencer_home_one_screen/widgets/influencer_home1_item_widget.dart';
import 'controller/influencer_home_one_controller.dart';
import 'models/influencer_home1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/community_page.dart';
import 'package:iynfluencer/presentation/creator_hireslist_tab_container_page/creator_hireslist_tab_container_page.dart';
import 'package:iynfluencer/presentation/home_creator_page/home_creator_page.dart';
import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/messages_page_influencer_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class InfluencerHomeOneScreen extends GetWidget<InfluencerHomeOneController> {
  const InfluencerHomeOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70001,
            appBar: CustomAppBar(
                height: getVerticalSize(63),
                leadingWidth: 55,
                leading: AppbarCircleimage(
                    imagePath: ImageConstant.imgGroup8991,
                    margin: getMargin(left: 20, top: 14, bottom: 14)),
                title: AppbarSearchview(
                    margin: getMargin(left: 14),
                    hintText: "msg_search_creators".tr,
                    controller: controller.searchController),
                styleType: Style.bgOutlineIndigo50),
            body: SizedBox(
                height: getVerticalSize(621),
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 20, right: 20),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(right: 1),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  top: 10, bottom: 5),
                                              child: Text(
                                                  "lbl_recent_postings".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiBold14Gray900)),
                                          CustomButton(
                                              height: getVerticalSize(35),
                                              width: getHorizontalSize(83),
                                              text: "lbl_filter".tr,
                                              variant:
                                                  ButtonVariant.OutlineIndigo50,
                                              padding: ButtonPadding.PaddingT8,
                                              fontStyle: ButtonFontStyle
                                                  .SatoshiBold135,
                                              prefixWidget: Container(
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgSignalBlack900)))
                                        ])),
                                Expanded(
                                    child: Padding(
                                        padding: getPadding(top: 14),
                                        child: Obx(() => ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                  height: getVerticalSize(16));
                                            },
                                            itemCount: controller
                                                .influencerHomeOneModelObj
                                                .value
                                                .influencerHome1ItemList
                                                .value
                                                .length,
                                            itemBuilder: (context, index) {
                                              InfluencerHome1ItemModel model =
                                                  controller
                                                      .influencerHomeOneModelObj
                                                      .value
                                                      .influencerHome1ItemList
                                                      .value[index];
                                              return InfluencerHome1ItemWidget(
                                                  model);
                                            }))))
                              ]))),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: getVerticalSize(769),
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: size.height,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.black90087))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    padding: getPadding(
                                        left: 18,
                                        top: 29,
                                        right: 18,
                                        bottom: 29),
                                    decoration: AppDecoration.outlineBlack9000c,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgGroup901,
                                              height: getSize(48),
                                              width: getSize(48),
                                              radius: BorderRadius.circular(
                                                  getSize(24.0)),
                                              margin: getMargin(left: 1)),
                                          Padding(
                                              padding:
                                                  getPadding(left: 1, top: 8),
                                              child: Text(
                                                  "lbl_emma_williams".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiBold16)),
                                          Padding(
                                              padding: getPadding(left: 2),
                                              child: Text("lbl_emmawlm".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight125Gray600ab)),
                                          Padding(
                                              padding: getPadding(top: 27),
                                              child: SizedBox(
                                                  width: getHorizontalSize(232),
                                                  child: Divider(
                                                      height:
                                                          getVerticalSize(1),
                                                      thickness:
                                                          getVerticalSize(1),
                                                      color: ColorConstant
                                                          .blueGray10001,
                                                      indent: getHorizontalSize(
                                                          2)))),
                                          Padding(
                                              padding:
                                                  getPadding(left: 2, top: 27),
                                              child: Row(children: [
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgFrame5,
                                                    height: getSize(24),
                                                    width: getSize(24)),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 14, top: 1),
                                                    child: Text(
                                                        "lbl_profile".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtH2Gray900))
                                              ])),
                                          CustomButton(
                                              width: getHorizontalSize(98),
                                              text: "lbl_earnings".tr,
                                              margin:
                                                  getMargin(left: 2, top: 20),
                                              shape: ButtonShape.Square,
                                              fontStyle: ButtonFontStyle
                                                  .SatoshiLight16,
                                              prefixWidget: Container(
                                                  margin: getMargin(right: 14),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgContrastBlueGray400)),
                                              onTap: () {
                                                onTapEarnings();
                                              }),
                                          GestureDetector(
                                              onTap: () {
                                                onTapMenu03();
                                              },
                                              child: Padding(
                                                  padding: getPadding(
                                                      left: 2, top: 18),
                                                  child: Row(children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgFrameBlueGray40024x24,
                                                        height: getSize(24),
                                                        width: getSize(24)),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 14, top: 1),
                                                        child: Text(
                                                            "lbl_notifications"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtH2Gray900)),
                                                    Container(
                                                        width: getSize(20),
                                                        margin: getMargin(
                                                            left: 80,
                                                            top: 3,
                                                            bottom: 1),
                                                        padding: getPadding(
                                                            left: 4,
                                                            top: 1,
                                                            right: 4,
                                                            bottom: 1),
                                                        decoration: AppDecoration
                                                            .txtFillRed500
                                                            .copyWith(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .txtCircleBorder11),
                                                        child: Text("lbl_9".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSatoshiLight1273))
                                                  ]))),
                                          Padding(
                                              padding: getPadding(top: 28),
                                              child: SizedBox(
                                                  width: getHorizontalSize(232),
                                                  child: Divider(
                                                      height:
                                                          getVerticalSize(1),
                                                      thickness:
                                                          getVerticalSize(1),
                                                      color: ColorConstant
                                                          .blueGray10001,
                                                      indent: getHorizontalSize(
                                                          2)))),
                                          Padding(
                                              padding:
                                                  getPadding(left: 2, top: 27),
                                              child: Row(children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgSettings,
                                                    height: getSize(24),
                                                    width: getSize(24)),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 14, top: 2),
                                                    child: Text(
                                                        "lbl_settings".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtH2Gray900))
                                              ])),
                                          Padding(
                                              padding:
                                                  getPadding(left: 2, top: 19),
                                              child: Row(children: [
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgFrame4,
                                                    height: getSize(24),
                                                    width: getSize(24)),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 14, top: 2),
                                                    child: Text(
                                                        "lbl_help_centre".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtH2Gray900))
                                              ])),
                                          CustomTextFormField(
                                              width: getHorizontalSize(230),
                                              focusNode: FocusNode(),
                                              autofocus: true,
                                              controller: controller
                                                  .becomeinfluenceController,
                                              hintText:
                                                  "msg_become_an_creator".tr,
                                              margin:
                                                  getMargin(left: 2, top: 65),
                                              variant: TextFormFieldVariant
                                                  .FillCyan3005e,
                                              shape: TextFormFieldShape
                                                  .CircleBorder10,
                                              padding: TextFormFieldPadding
                                                  .PaddingT14,
                                              fontStyle: TextFormFieldFontStyle
                                                  .SatoshiBold13,
                                              textInputAction:
                                                  TextInputAction.done,
                                              suffix: Container(
                                                  padding: getPadding(all: 8),
                                                  margin: getMargin(
                                                      left: 30,
                                                      top: 8,
                                                      right: 13,
                                                      bottom: 8),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.cyan300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  15))),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgFrameWhiteA70014x14)),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(46))),
                                          Padding(
                                              padding: getPadding(top: 42),
                                              child: SizedBox(
                                                  width: getHorizontalSize(231),
                                                  child: Divider(
                                                      height:
                                                          getVerticalSize(1),
                                                      thickness:
                                                          getVerticalSize(1),
                                                      color: ColorConstant
                                                          .blueGray10001,
                                                      indent: getHorizontalSize(
                                                          1)))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 2,
                                                  top: 13,
                                                  bottom: 132),
                                              child: Row(children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgQuestion,
                                                    height: getSize(24),
                                                    width: getSize(24)),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 14, top: 2),
                                                    child: Text(
                                                        "lbl_sign_out".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtH2Gray600))
                                              ]))
                                        ])))
                          ])))
                ])),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.influencerHomeScreen;
      case BottomBarEnum.Jobs:
        return AppRoutes.jobsJobsInfluencerPage;

      case BottomBarEnum.Chats:
        return AppRoutes.messagesPage;
      case BottomBarEnum.Community:
        return AppRoutes.communityPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.influencerHomeScreen:
        return InfluencerHomeOneScreen();
      case AppRoutes.jobsJobsInfluencerTabContainerScreen:
        return JobsJobsInfluencerTabContainerScreen();
      
      case AppRoutes.messagesPage:
        return MessagesPage();
      case AppRoutes.communityPage:
        return CommunityPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the earningsScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the earningsScreen.
  onTapEarnings() {
    Get.toNamed(
      AppRoutes.earningsScreen,
    );
  }

  /// Navigates to the notificationPageInfluencerScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the notificationPageInfluencerScreen.
  onTapMenu03() {
    Get.toNamed(
      AppRoutes.notificationPageInfluencerScreen,
    );
  }
}
