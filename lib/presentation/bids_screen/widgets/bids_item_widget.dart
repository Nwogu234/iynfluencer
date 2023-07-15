import '../controller/bids_controller.dart';
import '../models/bids_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class BidsItemWidget extends StatelessWidget {
  BidsItemWidget(
    this.bidsItemModelObj, {
    Key? key,
    this.onTapViewdetails,
  }) : super(
          key: key,
        );

  BidsItemModel bidsItemModelObj;

  var controller = Get.find<BidsController>();

  VoidCallback? onTapViewdetails;

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
            SizedBox(
              width: double.maxFinite,
              child: Container(
                padding: getPadding(
                  left: 25,
                  top: 19,
                  right: 25,
                  bottom: 19,
                ),
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        right: 4,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup8525,
                            height: getSize(
                              50,
                            ),
                            width: getSize(
                              50,
                            ),
                            radius: BorderRadius.circular(
                              getSize(
                                25.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 13,
                              top: 17,
                              bottom: 12,
                            ),
                            child: Obx(
                              () => Text(
                                bidsItemModelObj.biddernameTxt.value,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold145,
                              ),
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
                              top: 24,
                              bottom: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 19,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_bid_amount".tr,
                              style: TextStyle(
                                color: ColorConstant.gray600,
                                fontSize: getFontSize(
                                  14,
                                ),
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: "lbl_200".tr,
                              style: TextStyle(
                                color: ColorConstant.gray900,
                                fontSize: getFontSize(
                                  13,
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
                    Container(
                      width: getHorizontalSize(
                        303,
                      ),
                      margin: getMargin(
                        left: 1,
                        top: 12,
                        right: 20,
                      ),
                      child: Text(
                        "msg_hello_i_m_interested".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight138,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 22,
                top: 4,
                bottom: 15,
              ),
              child: Row(
                children: [
                  CustomButton(
                    height: getVerticalSize(
                      32,
                    ),
                    width: getHorizontalSize(
                      90,
                    ),
                    text: "lbl_view_details".tr,
                    fontStyle: ButtonFontStyle.SatoshiBold12,
                    onTap: () {
                      onTapViewdetails?.call();
                    },
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      32,
                    ),
                    width: getHorizontalSize(
                      72,
                    ),
                    text: "lbl_dismiss".tr,
                    margin: getMargin(
                      left: 12,
                    ),
                    variant: ButtonVariant.OutlineIndigo50_2,
                    fontStyle: ButtonFontStyle.SatoshiBold12Gray900ab,
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
