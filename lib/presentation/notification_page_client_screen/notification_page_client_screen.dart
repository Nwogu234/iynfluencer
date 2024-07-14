import '../notification_page_client_screen/widgets/listgroup854_item_widget.dart';
import 'controller/notification_page_client_controller.dart';
import 'models/listgroup854_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class NotificationPageClientScreen
    extends GetWidget<NotificationPageClientController> {
  const NotificationPageClientScreen({Key? key}) : super(key: key);

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
                    margin: getMargin(left: 20, top: 6, bottom: 12),
                    onTap: () {
                      onTapArrowleft12();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_notifications".tr),
                styleType: Style.bgOutlineIndigo50),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: double.maxFinite,
                                  padding: getPadding(top: 10, bottom: 10),
                                  decoration: AppDecoration.outlineIndigo505,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGroup85220,
                                            height: getSize(40),
                                            width: getSize(40),
                                            radius: BorderRadius.circular(
                                                getSize(20.0)),
                                            margin: getMargin(bottom: 8)),
                                        Padding(
                                            padding:
                                                getPadding(top: 4, bottom: 8),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                "lbl_jane_bayo"
                                                                    .tr,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .gray900,
                                                                fontSize:
                                                                    getFontSize(
                                                                        13),
                                                                fontFamily:
                                                                    'Satoshi',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        TextSpan(
                                                            text:
                                                                "msg_tagged_you_on_a"
                                                                    .tr,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .gray900,
                                                                fontSize:
                                                                    getFontSize(
                                                                        13),
                                                                fontFamily:
                                                                    'Satoshi',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300))
                                                      ]),
                                                      textAlign:
                                                          TextAlign.left),
                                                  Text("lbl_15_min_ago".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiLight12)
                                                ]))
                                      ])),
                              SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                      padding: getPadding(
                                          left: 20,
                                          top: 10,
                                          right: 20,
                                          bottom: 10),
                                      decoration:
                                          AppDecoration.outlineIndigo501,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(right: 7),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgGroup85221,
                                                          height: getSize(40),
                                                          width: getSize(40),
                                                          radius: BorderRadius
                                                              .circular(getSize(
                                                                  20.0))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 4),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                              text: "lbl_mark_adebayo2".tr,
                                                                              style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(13), fontFamily: 'Satoshi', fontWeight: FontWeight.w700)),
                                                                          TextSpan(
                                                                              text: "msg_sent_a_bid_on_game".tr,
                                                                              style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(13), fontFamily: 'Satoshi', fontWeight: FontWeight.w300))
                                                                        ]),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Text(
                                                                    "lbl_5_min_ago"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtSatoshiLight12)
                                                              ]))
                                                    ])),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Container(
                                                    margin: getMargin(
                                                        left: 61,
                                                        top: 11,
                                                        right: 2),
                                                    padding: getPadding(
                                                        left: 8,
                                                        top: 7,
                                                        right: 8,
                                                        bottom: 7),
                                                    decoration: AppDecoration
                                                        .outlineIndigo506
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .circleBorder7),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 3),
                                                              child: Row(
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgGroup85222,
                                                                        height: getSize(
                                                                            28),
                                                                        width: getSize(
                                                                            28)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                9,
                                                                            top:
                                                                                6,
                                                                            bottom:
                                                                                5),
                                                                        child: Text(
                                                                            "lbl_victor_uche"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtSatoshiBold118))
                                                                  ])),
                                                          Container(
                                                              width:
                                                                  getHorizontalSize(
                                                                      251),
                                                              margin: getMargin(
                                                                  left: 3,
                                                                  top: 8),
                                                              child: Text(
                                                                  "msg_looking_for_a_game3"
                                                                      .tr,
                                                                  maxLines:
                                                                      null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSatoshiLight1137))
                                                        ]))),
                                            Padding(
                                                padding: getPadding(
                                                    left: 61,
                                                    top: 12,
                                                    bottom: 7),
                                                child: Row(children: [
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(32),
                                                      width:
                                                          getHorizontalSize(72),
                                                      text: "lbl_dismiss".tr,
                                                      variant: ButtonVariant
                                                          .OutlineIndigo50_2,
                                                      fontStyle: ButtonFontStyle
                                                          .SatoshiBold12Gray900ab),
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(32),
                                                      width:
                                                          getHorizontalSize(90),
                                                      text:
                                                          "lbl_view_details".tr,
                                                      margin:
                                                          getMargin(left: 8),
                                                      fontStyle: ButtonFontStyle
                                                          .SatoshiBold12)
                                                ]))
                                          ]))),
                              Obx(() => ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: getVerticalSize(1));
                                  },
                                  itemCount: controller
                                      .notificationPageClientModelObj
                                      .value
                                      .listgroup854ItemList
                                      .value
                                      .length,
                                  itemBuilder: (context, index) {
                                    Listgroup854ItemModel model = controller
                                        .notificationPageClientModelObj
                                        .value
                                        .listgroup854ItemList
                                        .value[index];
                                    return Listgroup854ItemWidget(model);
                                  })),
                              SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                      width: double.maxFinite,
                                      padding: getPadding(
                                          left: 20,
                                          top: 10,
                                          right: 20,
                                          bottom: 10),
                                      decoration:
                                          AppDecoration.outlineIndigo501,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(right: 37),
                                                child: Row(children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgGroup85225,
                                                      height: getSize(40),
                                                      width: getSize(40),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getSize(20.0))),
                                                  Expanded(
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 20,
                                                              top: 4,
                                                              bottom: 1),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                              text: "lbl_jane_bayo".tr,
                                                                              style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(13), fontFamily: 'Satoshi', fontWeight: FontWeight.w700)),
                                                                          TextSpan(
                                                                              text: "msg_liked_your_post".tr,
                                                                              style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(13), fontFamily: 'Satoshi', fontWeight: FontWeight.w300))
                                                                        ]),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Text(
                                                                    "lbl_mar_23"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtSatoshiLight12)
                                                              ])))
                                                ])),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Container(
                                                    margin: getMargin(
                                                        left: 61,
                                                        top: 9,
                                                        right: 1,
                                                        bottom: 14),
                                                    padding: getPadding(
                                                        left: 7,
                                                        top: 10,
                                                        right: 7,
                                                        bottom: 10),
                                                    decoration: AppDecoration
                                                        .outlineIndigo506
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .circleBorder7),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgRectangle5094,
                                                              height:
                                                                  getSize(40),
                                                              width:
                                                                  getSize(40),
                                                              radius: BorderRadius
                                                                  .circular(
                                                                      getHorizontalSize(
                                                                          5))),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      getHorizontalSize(
                                                                          205),
                                                                  margin:
                                                                      getMargin(
                                                                          left:
                                                                              12,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              2),
                                                                  child: Text(
                                                                      "msg_a_game_influencer"
                                                                          .tr,
                                                                      maxLines:
                                                                          null,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtSatoshiLight1192)))
                                                        ])))
                                          ]))),
                              Container(
                                  width: double.maxFinite,
                                  padding: getPadding(top: 10, bottom: 10),
                                  decoration: AppDecoration.outlineIndigo501,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGroup85226,
                                            height: getSize(40),
                                            width: getSize(40),
                                            radius: BorderRadius.circular(
                                                getSize(20.0)),
                                            margin: getMargin(bottom: 8)),
                                        Padding(
                                            padding:
                                                getPadding(top: 4, bottom: 8),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                "lbl_james_ayo"
                                                                    .tr,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .gray900,
                                                                fontSize:
                                                                    getFontSize(
                                                                        13),
                                                                fontFamily:
                                                                    'Satoshi',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        TextSpan(
                                                            text:
                                                                "msg_requested_payment"
                                                                    .tr,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .gray900,
                                                                fontSize:
                                                                    getFontSize(
                                                                        13),
                                                                fontFamily:
                                                                    'Satoshi',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300))
                                                      ]),
                                                      textAlign:
                                                          TextAlign.left),
                                                  Text("lbl_4_hours_ago".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiLight12)
                                                ]))
                                      ])),
                              SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                      padding: getPadding(
                                          left: 20,
                                          top: 10,
                                          right: 20,
                                          bottom: 10),
                                      decoration:
                                          AppDecoration.outlineIndigo505,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(right: 7),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgGroup85227,
                                                          height: getSize(40),
                                                          width: getSize(40),
                                                          radius: BorderRadius
                                                              .circular(getSize(
                                                                  20.0))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 4),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                              text: "lbl_mark_adebayo2".tr,
                                                                              style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(13), fontFamily: 'Satoshi', fontWeight: FontWeight.w700)),
                                                                          TextSpan(
                                                                              text: "msg_sent_a_bid_on_game".tr,
                                                                              style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(13), fontFamily: 'Satoshi', fontWeight: FontWeight.w300))
                                                                        ]),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Text(
                                                                    "lbl_5_min_ago"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtSatoshiLight12)
                                                              ]))
                                                    ])),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Container(
                                                    margin: getMargin(
                                                        left: 61,
                                                        top: 11,
                                                        right: 2),
                                                    padding: getPadding(
                                                        left: 8,
                                                        top: 7,
                                                        right: 8,
                                                        bottom: 7),
                                                    decoration: AppDecoration
                                                        .outlineIndigo506
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .circleBorder7),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 3),
                                                              child: Row(
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgGroup85228,
                                                                        height: getSize(
                                                                            28),
                                                                        width: getSize(
                                                                            28)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                9,
                                                                            top:
                                                                                6,
                                                                            bottom:
                                                                                5),
                                                                        child: Text(
                                                                            "lbl_victor_uche"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtSatoshiBold118))
                                                                  ])),
                                                          Container(
                                                              width:
                                                                  getHorizontalSize(
                                                                      251),
                                                              margin: getMargin(
                                                                  left: 3,
                                                                  top: 8),
                                                              child: Text(
                                                                  "msg_looking_for_a_game3"
                                                                      .tr,
                                                                  maxLines:
                                                                      null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtSatoshiLight1137))
                                                        ]))),
                                            Padding(
                                                padding: getPadding(
                                                    left: 61,
                                                    top: 12,
                                                    bottom: 7),
                                                child: Row(children: [
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(32),
                                                      width:
                                                          getHorizontalSize(72),
                                                      text: "lbl_dismiss".tr,
                                                      variant: ButtonVariant
                                                          .OutlineIndigo50_2,
                                                      fontStyle: ButtonFontStyle
                                                          .SatoshiBold12Gray900ab),
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(32),
                                                      width:
                                                          getHorizontalSize(90),
                                                      text:
                                                          "lbl_view_details".tr,
                                                      margin:
                                                          getMargin(left: 8),
                                                      fontStyle: ButtonFontStyle
                                                          .SatoshiBold12)
                                                ]))
                                          ])))
                            ]))))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft12() {
    Get.back();
  }
}
