import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import '../job_details_screen/widgets/job_details_item_widget.dart';
import 'controller/creator_job_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class CreatorJobDetailsScreen extends GetWidget<CreatorJobDetailsController> {
  const CreatorJobDetailsScreen({this.selectedJob});

  final Job? selectedJob;

  @override
  Widget build(BuildContext context) {
    // final List<Job> jobDetailsItemList = [
    //   selectedJob,
    // ];
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

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
                      onTapArrowleft16();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_job_details".tr),
                styleType: Style.bgOutlineIndigo50_1),
            body: SizedBox(
              width: size.width,
              child: SingleChildScrollView(
                padding: getPadding(top: 25),
                child: Padding(
                  padding: getPadding(bottom: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(left: 19),
                            child: Text("${selectedJob?.title}",
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
                                child: Text("${selectedJob?.description}",
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtSatoshiLight13Gray900ab))),
                        Padding(
                            padding: getPadding(left: 20, top: 29),
                            child: Text("lbl_responsiblities".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900)),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: getHorizontalSize(334),
                              margin: getMargin(left: 20, top: 9, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: selectedJob!.responsibilities!
                                    .map((mediaFile) {
                                  return Padding(
                                      padding: getPadding(top: 7),
                                      child: Text(
                                          mediaFile, //duration,budget,list of r4
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiLight13Gray900ab));
                                }).toList(),
                              ),
                            )),
                        Padding(
                            padding: getPadding(left: 20, top: 28),
                            child: Text("lbl_about_job".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900)),
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                    padding: getPadding(left: 20, top: 7),
                                    child: Text(
                                        "lbl_total_bids"
                                            .tr, //duration,budget,list of r4
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSatoshiBold125Gray900a7)),
                                Padding(
                                    padding: getPadding(left: 20, top: 6),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "${selectedJob?.bidsCount ?? 0} ",
                                              style: AppStyle
                                                  .txtSatoshiBold125Gray900a7),
                                          TextSpan(
                                              text: "lbl_bidders".tr,
                                              style: AppStyle
                                                  .txtSatoshiBold125Gray900a7)
                                        ]),
                                        textAlign: TextAlign.left)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(left: 20, top: 7),
                                  child: Text(
                                    "Duration".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(left: 20, top: 7),
                                  child: Text(
                                    "${selectedJob?.duration} days",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(left: 20, top: 7),
                                  child: Text(
                                    "lbl_budget".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(left: 20, top: 7),
                                  child: Text(
                                    '\$${capitalizeFirstLetter(selectedJob?.budgetFrom.toString())} - ${capitalizeFirstLetter(selectedJob?.budgetTo.toString())}',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            bottomNavigationBar: Container(
                margin: getMargin(left: 20, right: 20, bottom: 20),
                decoration: AppDecoration.outlineIndigo507,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          height: getVerticalSize(44),
                          text: "See all bids".tr,
                          padding: ButtonPadding.PaddingAll12,
                          onTap: () {
                            onTapBid();
                          })
                    ]))));
  }

  /// Navigates to the bidScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the bidScreen.
  onTapBid() {
    Get.toNamed(
      AppRoutes.bidsScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft16() {
    Get.back();
  }
}
