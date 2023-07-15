import '../controller/creator_jobslist_controller.dart';
import '../models/jobposting_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class JobpostingItemWidget extends StatelessWidget {
  JobpostingItemWidget(
    this.jobpostingItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  JobpostingItemModel jobpostingItemModelObj;

  var controller = Get.find<CreatorJobslistController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: getPadding(
              left: 19,
              right: 26,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup852,
                  height: getSize(
                    45,
                  ),
                  width: getSize(
                    45,
                  ),
                  radius: BorderRadius.circular(
                    getSize(
                      22.5,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 12,
                    top: 3,
                    bottom: 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_micheal_scott".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold14Gray900ab,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 1,
                          top: 3,
                        ),
                        child: Text(
                          "lbl_mar_16_2023".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight125,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomImageView(
                  svgPath: ImageConstant.imgVector,
                  height: getVerticalSize(
                    1,
                  ),
                  width: getHorizontalSize(
                    13,
                  ),
                  margin: getMargin(
                    top: 22,
                    bottom: 21,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 19,
            top: 22,
          ),
          child: Text(
            "msg_music_video_influencer".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtSatoshiBold14Gray900ab,
          ),
        ),
        Container(
          width: getHorizontalSize(
            321,
          ),
          margin: getMargin(
            left: 20,
            top: 8,
            right: 33,
          ),
          child: Text(
            "msg_looking_for_a_game".tr,
            maxLines: null,
            textAlign: TextAlign.left,
            style: AppStyle.txtSatoshiLight14Gray900ab,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 19,
            top: 14,
            right: 88,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "lbl_budget".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiLight135Gray600,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 3,
                    ),
                    child: Text(
                      "lbl_200_500".tr,
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
                  Text(
                    "msg_project_duration".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiLight135Gray600,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 3,
                    ),
                    child: Text(
                      "lbl_10_weeks".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold125Gray900a7,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          child: Container(
            margin: getMargin(
              top: 18,
            ),
            padding: getPadding(
              left: 20,
              right: 20,
            ),
            decoration: AppDecoration.outlineIndigo501,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle5066,
                  height: getVerticalSize(
                    181,
                  ),
                  width: getHorizontalSize(
                    335,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      7,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 2,
                    top: 14,
                    right: 5,
                    bottom: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_14".tr,
                              style: TextStyle(
                                color: ColorConstant.gray900E5,
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "lbl_bids".tr,
                              style: TextStyle(
                                color: ColorConstant.gray600,
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: " ",
                              style: TextStyle(
                                color: ColorConstant.cyan300,
                                fontSize: getFontSize(
                                  11.5,
                                ),
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 13,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "lbl_0".tr,
                                style: TextStyle(
                                  color: ColorConstant.gray900E5,
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: "lbl_hires".tr,
                                style: TextStyle(
                                  color: ColorConstant.gray600,
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: ColorConstant.cyan300,
                                  fontSize: getFontSize(
                                    11.5,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        svgPath: ImageConstant.imgFrameGray600,
                        height: getSize(
                          18,
                        ),
                        width: getSize(
                          18,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 6,
                          bottom: 1,
                        ),
                        child: Text(
                          "lbl_237".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold115Gray600,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgEyeGray600,
                        height: getSize(
                          18,
                        ),
                        width: getSize(
                          18,
                        ),
                        margin: getMargin(
                          left: 13,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 6,
                          bottom: 1,
                        ),
                        child: Text(
                          "lbl_865".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold115Gray600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
