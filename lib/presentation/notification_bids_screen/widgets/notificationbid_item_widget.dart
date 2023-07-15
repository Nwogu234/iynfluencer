import '../controller/notification_bids_controller.dart';
import '../models/notificationbid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class NotificationbidItemWidget extends StatelessWidget {
  NotificationbidItemWidget(
    this.notificationbidItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationbidItemModel notificationbidItemModelObj;

  var controller = Get.find<NotificationBidsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 20,
          top: 10,
          right: 20,
          bottom: 10,
        ),
        decoration: AppDecoration.outlineIndigo501,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                right: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup85214,
                    height: getSize(
                      40,
                    ),
                    width: getSize(
                      40,
                    ),
                    radius: BorderRadius.circular(
                      getSize(
                        20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "lbl_mark_adebayo2".tr,
                                style: TextStyle(
                                  color: ColorConstant.gray900,
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: "msg_sent_a_bid_on_game".tr,
                                style: TextStyle(
                                  color: ColorConstant.gray900,
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "lbl_5_min_ago".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: getMargin(
                  left: 61,
                  top: 11,
                  right: 2,
                ),
                padding: getPadding(
                  left: 8,
                  top: 7,
                  right: 8,
                  bottom: 7,
                ),
                decoration: AppDecoration.outlineIndigo506.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 3,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup85228x28,
                            height: getSize(
                              28,
                            ),
                            width: getSize(
                              28,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 9,
                              top: 6,
                              bottom: 5,
                            ),
                            child: Text(
                              "lbl_victor_uche".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold118,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        251,
                      ),
                      margin: getMargin(
                        left: 3,
                        top: 8,
                      ),
                      child: Text(
                        "msg_looking_for_a_game3".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight1137,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 61,
                top: 12,
                bottom: 7,
              ),
              child: Row(
                children: [
                  CustomButton(
                    height: getVerticalSize(
                      32,
                    ),
                    width: getHorizontalSize(
                      72,
                    ),
                    text: "lbl_dismiss".tr,
                    variant: ButtonVariant.OutlineIndigo50_2,
                    fontStyle: ButtonFontStyle.SatoshiBold12Gray900ab,
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      32,
                    ),
                    width: getHorizontalSize(
                      90,
                    ),
                    text: "lbl_view_details".tr,
                    margin: getMargin(
                      left: 8,
                    ),
                    fontStyle: ButtonFontStyle.SatoshiBold12,
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
