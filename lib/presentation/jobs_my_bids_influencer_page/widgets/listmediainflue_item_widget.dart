import '../controller/jobs_my_bids_influencer_controller.dart';
import '../models/listmediainflue_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class ListmediainflueItemWidget extends StatelessWidget {
  ListmediainflueItemWidget(
    this.listmediainflueItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListmediainflueItemModel listmediainflueItemModelObj;

  var controller = Get.find<JobsMyBidsInfluencerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        decoration: AppDecoration.outlineIndigo501,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                right: 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      listmediainflueItemModelObj.mediainfluencerTxt.value,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold16,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgVector,
                    height: getVerticalSize(
                      1,
                    ),
                    width: getHorizontalSize(
                      13,
                    ),
                    margin: getMargin(
                      top: 11,
                      bottom: 9,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Container(
                margin: getMargin(
                  top: 17,
                ),
                padding: getPadding(
                  left: 12,
                  top: 7,
                  right: 12,
                  bottom: 7,
                ),
                decoration: AppDecoration.outlineIndigo508.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 2,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup85233,
                            height: getSize(
                              30,
                            ),
                            width: getSize(
                              30,
                            ),
                            radius: BorderRadius.circular(
                              getSize(
                                15.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 12,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Obx(
                              () => Text(
                                listmediainflueItemModelObj.victorucheTxt.value,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900ab,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 13,
                              top: 9,
                              bottom: 3,
                            ),
                            child: Text(
                              "lbl_1_week_ago".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight125,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        310,
                      ),
                      margin: getMargin(
                        top: 11,
                      ),
                      child: Text(
                        "msg_looking_for_a_game3".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight14Gray900ab,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 4,
                top: 15,
                right: 78,
                bottom: 19,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_status".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight135Gray600,
                      ),
                      CustomButton(
                        height: getVerticalSize(
                          25,
                        ),
                        width: getHorizontalSize(
                          94,
                        ),
                        text: "lbl_accepted".tr,
                        margin: getMargin(
                          top: 5,
                        ),
                        variant: ButtonVariant.FillGreenA10099,
                        shape: ButtonShape.RoundedBorder12,
                        padding: ButtonPadding.PaddingT4,
                        fontStyle: ButtonFontStyle.SatoshiBold115Green700,
                        prefixWidget: Container(
                          margin: getMargin(
                            right: 4,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSearchGreen700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: getPadding(
                      top: 2,
                      bottom: 3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_your_bid_price".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight135Gray600,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 7,
                          ),
                          child: Text(
                            "lbl_500".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold125Gray900a7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
