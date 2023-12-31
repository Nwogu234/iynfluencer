import 'controller/creator_profile_reveiws_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/creator_profile_reveiws_page/creator_profile_reveiws_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class CreatorProfileReveiwsTabContainerScreen
    extends GetWidget<CreatorProfileReveiwsTabContainerController> {
  const CreatorProfileReveiwsTabContainerScreen({Key? key}) : super(key: key);

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
                          height: getVerticalSize(325),
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
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
                                                      margin:
                                                          getMargin(left: 15),
                                                      onTap: () {
                                                        onTapArrowleft15();
                                                      }),
                                                  actions: [
                                                    AppbarImage(
                                                        height:
                                                            getVerticalSize(26),
                                                        width:
                                                            getHorizontalSize(
                                                                60),
                                                        svgPath: ImageConstant
                                                            .imgComputer,
                                                        margin: getMargin(
                                                            left: 16,
                                                            right: 16,
                                                            bottom: 4),
                                                     onTap: (){
                                                      Get.back();
                                                     },
                                                    )
                                                  ])
                                            ]))),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding:
                                            getPadding(left: 20, right: 21),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgGroup9471,
                                                  height: getSize(85),
                                                  width: getSize(85),
                                                  radius: BorderRadius.circular(
                                                      getSize(42.5)),
                                                  margin: getMargin(left: 7)),
                                              Padding(
                                                  padding: getPadding(top: 8),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 3),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "lbl_mark_adebayo"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtSatoshiBold24),
                                                                  Padding(
                                                                      padding: getPadding(
                                                                          top:
                                                                              1),
                                                                      child: Row(
                                                                          children: [
                                                                            Text("lbl_lagos_nigeria".tr,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.left,
                                                                                style: AppStyle.txtSatoshiLight14),
                                                                            Card(
                                                                                clipBehavior: Clip.antiAlias,
                                                                                elevation: 0,
                                                                                margin: getMargin(left: 10, bottom: 4),
                                                                                color: ColorConstant.gray20001,
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.circleBorder7),
                                                                                child: Container(
                                                                                    height: getSize(14),
                                                                                    width: getSize(14),
                                                                                    decoration: AppDecoration.fillGray20001.copyWith(borderRadius: BorderRadiusStyle.circleBorder7),
                                                                                    child: Stack(children: [
                                                                                      CustomImageView(svgPath: ImageConstant.imgContrast, height: getVerticalSize(13), width: getHorizontalSize(14), alignment: Alignment.center)
                                                                                    ])))
                                                                          ])),
                                                                  Padding(
                                                                      padding: getPadding(
                                                                          top:
                                                                              5),
                                                                      child: Row(
                                                                          children: [
                                                                            CustomImageView(
                                                                                svgPath: ImageConstant.imgFrameBlueGray400,
                                                                                height: getSize(15),
                                                                                width: getSize(15),
                                                                                margin: getMargin(bottom: 3)),
                                                                            Padding(
                                                                                padding: getPadding(left: 8),
                                                                                child: Text("lbl_8_jobs_posted".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSatoshiLight135))
                                                                          ])),
                                                                  Padding(
                                                                      padding:
                                                                          getPadding(
                                                                              top: 6),
                                                                      child: RichText(
                                                                          text: TextSpan(children: [
                                                                            TextSpan(
                                                                                text: "lbl_member_since".tr,
                                                                                style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(13.5), fontFamily: 'Satoshi', fontWeight: FontWeight.w300)),
                                                                            TextSpan(
                                                                                text: "lbl_mar_20222".tr,
                                                                                style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(12.5), fontFamily: 'Satoshi', fontWeight: FontWeight.w300))
                                                                          ]),
                                                                          textAlign: TextAlign.left))
                                                                ])),
                                                        CustomButton(
                                                            height:
                                                                getVerticalSize(
                                                                    34),
                                                            width:
                                                                getHorizontalSize(
                                                                    110),
                                                            text: "lbl_message"
                                                                .tr,
                                                            margin: getMargin(
                                                                bottom: 71),
                                                            variant: ButtonVariant
                                                                .FillGray200ab,
                                                            padding:
                                                                ButtonPadding
                                                                    .PaddingAll4,
                                                            fontStyle:
                                                                ButtonFontStyle
                                                                    .SatoshiBold15Gray900)
                                                      ]))
                                            ])))
                              ])),
                      Expanded(
                          child: SingleChildScrollView(
                              padding: getPadding(top: 14),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: getVerticalSize(44),
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        ColorConstant.indigo50,
                                                    width:
                                                        getHorizontalSize(1)))),
                                        child: TabBar(
                                            controller:
                                                controller.tabviewController,
                                            labelColor: ColorConstant.cyan300,
                                            labelStyle: TextStyle(
                                                fontSize: getFontSize(14.5),
                                                fontFamily: 'Satoshi',
                                                fontWeight: FontWeight.w300),
                                            unselectedLabelColor:
                                                ColorConstant.gray600,
                                            unselectedLabelStyle: TextStyle(
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Satoshi',
                                                fontWeight: FontWeight.w300),
                                            indicator: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: ColorConstant
                                                            .cyan300,
                                                        width:
                                                            getHorizontalSize(
                                                                2)))),
                                            tabs: [
                                              Tab(
                                                  child: Text(
                                                      "lbl_listed_jobs".tr,
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                              Tab(
                                                  child: Text(
                                                      "lbl_community_posts".tr,
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                              Tab(
                                                  child: Text("lbl_reviews".tr,
                                                      overflow: TextOverflow
                                                          .ellipsis))
                                            ])),
                                    SizedBox(
                                        height: getVerticalSize(436),
                                        child: TabBarView(
                                            controller:
                                                controller.tabviewController,
                                            children: [
                                              CreatorProfileReveiwsPage(),
                                              CreatorProfileReveiwsPage(),
                                              CreatorProfileReveiwsPage()
                                            ]))
                                  ])))
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft15() {
    Get.back();
  }
}
