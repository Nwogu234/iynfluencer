import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/jobs_requests_influencer_page/controller/jobs_requests_influencer_controller.dart';
import 'package:iynfluencer/presentation/jobs_requests_influencer_page/models/jobs_requests_influencer_model.dart';

import '../request_detail_screen/widgets/request_detail_item_widget.dart';
import 'controller/request_detail_controller.dart';
import 'models/request_detail_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class RequestDetailScreen extends StatelessWidget {
  RequestDetailScreen({Key? key, this.jobrequest}) : super(key: key);
  JobsRequestsInfluencerModel? jobrequest;
  RequestDetailController controller =
      Get.put<RequestDetailController>(RequestDetailController());
  // show the dialog
  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button for close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dismiss Request'),
          content: Text('Are You Sure you want to Dismiss Request'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // close the dialog
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Perform an action when OK button is pressed
                // Navigator.of(context).pop(); // close the dialog
                controller.declineRequest(
                    jobrequest!.jobRequestId!, Navigator.of(context));
              },
            ),
          ],
        );
      },
    );
  }

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
                  onTapArrowleft19();
                }),
            centerTitle: true,
            title: AppbarTitle(text: jobrequest!.job!.title!),
            styleType: Style.bgOutlineIndigo50_1),
        body: SizedBox(
          width: size.width,
          child: Obx(() {
            if (controller.isLoading.value) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return SingleChildScrollView(
                padding: getPadding(top: 25),
                child: Padding(
                  padding: getPadding(bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 19),
                          child: Text("msg_gaming_app_influencer".tr,
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
                              margin: getMargin(left: 20, top: 9, right: 30),
                              child: Text(jobrequest!.job!.description!,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight13Gray900ab))),
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
                              margin: getMargin(left: 20, top: 9, right: 20),
                              child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(15));
                                  },
                                  itemCount:
                                      jobrequest!.job!.responsibilities!.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                        jobrequest!
                                            .job!.responsibilities![index],
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSatoshiLight13Gray900ab);
                                  }))),

                      Padding(
                          padding: getPadding(left: 20, top: 28),
                          child: Text("lbl_about_job".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold14Gray900)),
                      // Padding(
                      //     padding: getPadding(left: 20, top: 14, right: 53),
                      //     child: Obx(() => ListView.separated(
                      //         physics: NeverScrollableScrollPhysics(),
                      //         shrinkWrap: true,
                      //         separatorBuilder: (context, index) {
                      //           return SizedBox(height: getVerticalSize(15));
                      //         },
                      //         itemCount: controller.requestDetailModelObj.value
                      //             .requestDetailItemList.value.length,
                      //         itemBuilder: (context, index) {
                      //           RequestDetailItemModel model = controller
                      //               .requestDetailModelObj
                      //               .value
                      //               .requestDetailItemList
                      //               .value[index];
                      //           return RequestDetailItemWidget(model);
                      //         }))),
                      Padding(
                          padding: getPadding(left: 20, top: 7),
                          child: Text("lbl_total_bids".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight135Gray600)),
                      Padding(
                          padding: getPadding(left: 20, top: 6),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_502".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray900,
                                        fontSize: getFontSize(12.5),
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: "lbl_bidders".tr,
                                    style: TextStyle(
                                        color: ColorConstant.gray600,
                                        fontSize: getFontSize(13.5),
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w300))
                              ]),
                              textAlign: TextAlign.left)),
                      Padding(
                          padding: getPadding(left: 20, top: 30),
                          child: Text("lbl_about_client".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold14Gray900)),
                      Padding(
                          padding: getPadding(left: 20, top: 13, right: 53),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgGroup85246,
                                height: getSize(40),
                                width: getSize(40),
                                radius: BorderRadius.circular(getSize(20.0))),
                            Padding(
                                padding: getPadding(left: 16, top: 4),
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
                                      Row(children: [
                                        Text("lbl_lagos_nigeria".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSatoshiLight12),
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin:
                                                getMargin(left: 10, bottom: 3),
                                            color: ColorConstant.gray20001,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder7),
                                            child: Container(
                                                height: getSize(14),
                                                width: getSize(14),
                                                decoration: AppDecoration
                                                    .fillGray20001
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .circleBorder7),
                                                child: Stack(children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgContrast,
                                                      height:
                                                          getVerticalSize(13),
                                                      width:
                                                          getHorizontalSize(14),
                                                      alignment:
                                                          Alignment.center)
                                                ])))
                                      ])
                                    ])),
                            Spacer(),
                            CustomButton(
                                height: getVerticalSize(30),
                                width: getHorizontalSize(86),
                                text: "lbl_message".tr,
                                margin: getMargin(top: 5, bottom: 5),
                                variant: ButtonVariant.FillGray200ab,
                                padding: ButtonPadding.PaddingAll4,
                                fontStyle: ButtonFontStyle.SatoshiBold13)
                          ])),
                      Padding(
                          padding: getPadding(left: 20, top: 19),
                          child: Row(children: [
                            Padding(
                                padding: getPadding(top: 1),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_13_jobs_posted".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiBold125Gray900a7),
                                      Padding(
                                          padding: getPadding(top: 3),
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "lbl_3_open_jobs".tr,
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .gray600,
                                                        fontSize:
                                                            getFontSize(13.5),
                                                        fontFamily: 'Satoshi',
                                                        fontWeight:
                                                            FontWeight.w300)),
                                                TextSpan(
                                                    text: "lbl_view".tr,
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .blue900,
                                                        fontSize:
                                                            getFontSize(13.5),
                                                        fontFamily: 'Satoshi',
                                                        fontWeight:
                                                            FontWeight.w300))
                                              ]),
                                              textAlign: TextAlign.left))
                                    ])),
                            Padding(
                                padding: getPadding(left: 70, bottom: 1),
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
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(left: 22, top: 75, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: CustomButton(
                                      height: getVerticalSize(44),
                                      text: "lbl_bid".tr,
                                      margin: getMargin(right: 21),
                                      padding: ButtonPadding.PaddingAll12,
                                      onTap: () {
                                        onTapBid(jobrequest!.job!);
                                      })),
                              Expanded(
                                child: CustomButton(
                                    height: getVerticalSize(44),
                                    text: "lbl_decline".tr,
                                    margin: getMargin(left: 21),
                                    variant: ButtonVariant.FillRedA700,
                                    padding: ButtonPadding.PaddingAll12,
                                    fontStyle:
                                        ButtonFontStyle.SatoshiBold14Gray200,
                                    onTap: () {
                                      _showAlertDialog(context);
                                    },
                                    alignment: Alignment.center),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  /// Navigates to the requestAcceptedOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the requestAcceptedOneScreen.
  onTapAccept() {
    Get.toNamed(
      AppRoutes.requestAcceptedOneScreen,
    );
  }

  onTapBid(Job selectedJob) {
    Get.toNamed(AppRoutes.bidScreen, arguments: selectedJob);
  }

  /// Navigates to the chargeScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the chargeScreen.
  onTapCounteroffer() {
    Get.toNamed(
      AppRoutes.chargeScreen,
    );
  }

  /// Navigates to the requestAcceptedScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the requestAcceptedScreen.
  onTapDecline() {
    Get.toNamed(
      AppRoutes.requestAcceptedScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft19() {
    Get.back();
  }
}
