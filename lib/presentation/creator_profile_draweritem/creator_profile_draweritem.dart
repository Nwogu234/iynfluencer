import '../creator_hireslist_tab_container_page/controller/creator_hireslist_tab_container_controller.dart';
import 'controller/creator_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class CreatorProfileDraweritem extends StatelessWidget {
  CreatorProfileDraweritem(this.controller, {Key? key}) : super(key: key);

  CreatorProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Container(
                margin: getMargin(right: 20),
                padding: getPadding(left: 19, top: 74, right: 19),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgFrame901,
                          height: getSize(48),
                          width: getSize(48),
                          radius: BorderRadius.circular(getSize(24.0)),
                          onTap: () {
                            onTapImgFrame901();
                          }),
                      Padding(
                          padding: getPadding(top: 8),
                          child: Text("lbl_emma_williams".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16)),
                      Padding(
                          padding: getPadding(left: 1),
                          child: Text("lbl_emmawlm".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight125Gray600ab)),
                      Padding(
                          padding: getPadding(top: 27),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.blueGray10001,
                              indent: getHorizontalSize(1))),
                      Padding(
                          padding: getPadding(left: 1, top: 27),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgBookmarkBlueGray400,
                                height: getSize(24),
                                width: getSize(24)),
                            Padding(
                                padding: getPadding(left: 14, top: 1),
                                child: Text("msg_saved_influencers".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray900))
                          ])),
                      GestureDetector(
                          onTap: () {
                            onTapMenutab03();
                          },
                          child: Padding(
                              padding: getPadding(left: 1, top: 20, right: 8),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath:
                                        ImageConstant.imgFrameBlueGray40024x24,
                                    height: getSize(24),
                                    width: getSize(24)),
                                Padding(
                                    padding: getPadding(left: 14, top: 1),
                                    child: Text("lbl_notifications".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtH2Gray900)),
                                Spacer(),
                                Container(
                                    width: getSize(20),
                                    margin: getMargin(top: 3, bottom: 1),
                                    padding: getPadding(
                                        left: 4, top: 1, right: 4, bottom: 1),
                                    decoration: AppDecoration.txtFillRed500
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .txtCircleBorder11),
                                    child: Text("lbl_9".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiLight1273))
                              ]))),
                      Padding(
                          padding: getPadding(top: 40),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.blueGray10001,
                              indent: getHorizontalSize(1))),
                      Padding(
                          padding: getPadding(left: 1, top: 24),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSettings,
                                height: getSize(24),
                                width: getSize(24)),
                            Padding(
                                padding: getPadding(left: 14, top: 2),
                                child: Text("lbl_settings".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray900))
                          ])),
                      Padding(
                          padding: getPadding(left: 1, top: 19),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgFrame4,
                                height: getSize(24),
                                width: getSize(24)),
                            Padding(
                                padding: getPadding(left: 14, top: 2),
                                child: Text("lbl_help_centre".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray900))
                          ])),
                      CustomButton(
                          height: getVerticalSize(46),
                          text: "msg_become_an_influencer".tr,
                          margin: getMargin(left: 1, top: 23),
                          variant: ButtonVariant.FillCyan3005e,
                          padding: ButtonPadding.PaddingT13,
                          fontStyle: ButtonFontStyle.SatoshiBold13,
                          suffixWidget: Container(
                              height: 70,
                              width: 35,
                              padding: getPadding(all: 3.5),
                              margin: getMargin(left: 25),
                              decoration: BoxDecoration(
                                  color: ColorConstant.cyan300,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(8))),
                              child: CustomImageView(
                                 height: 20,
                                  width: 15,
                                  svgPath:
                                      ImageConstant.imgFrameWhiteA70014x14)),
                          onTap: () {
                            onTapBecomean();
                          }),
                      Padding(
                          padding: getPadding(top: 29),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.blueGray10001)),
                      Padding(
                          padding: getPadding(left: 1, top: 22, bottom: 121),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgQuestion,
                                height: getSize(24),
                                width: getSize(24)),
                            Padding(
                                padding: getPadding(left: 14, top: 2),
                                child: Text("lbl_sign_out".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray600))
                          ]))
                    ]))));
  }

  /// Navigates to the editProfileListedJobsTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the editProfileListedJobsTabContainerScreen.
  onTapImgFrame901() {
    Get.toNamed(
      AppRoutes.editProfileListedJobsTabContainerScreen,
    );
  }

  /// Navigates to the notificationPageClientScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the notificationPageClientScreen.
  onTapMenutab03() {
    Get.toNamed(
      AppRoutes.notificationPageClientScreen,
    );
  }

  /// Navigates to the influencerHomeScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the influencerHomeScreen.
  onTapBecomean() {
    Get.delete<CreatorHireslistTabContainerController>();
    Get.delete<TabController>();
    Get.toNamed(
      AppRoutes.influencerTabScreen,

    );
    controller.dispose();
  }
}