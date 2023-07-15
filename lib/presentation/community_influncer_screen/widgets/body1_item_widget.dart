import '../controller/community_influncer_controller.dart';
import '../models/body1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Body1ItemWidget extends StatelessWidget {
  Body1ItemWidget(
    this.body1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Body1ItemModel body1ItemModelObj;

  var controller = Get.find<CommunityInfluncerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          top: 15,
          bottom: 15,
        ),
        decoration: AppDecoration.outlineGray9000c.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(
                left: 15,
                top: 1,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup85244,
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
                      left: 12,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "lbl_micheal_scott".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold14Gray900ab,
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
                      top: 19,
                      bottom: 19,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: getPadding(
                  left: 15,
                  top: 12,
                ),
                child: Text(
                  "msg_write_your_caption".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiLight15,
                ),
              ),
            ),
            Container(
              height: getVerticalSize(
                211,
              ),
              width: getHorizontalSize(
                343,
              ),
              margin: getMargin(
                top: 11,
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle5068,
                    height: getVerticalSize(
                      211,
                    ),
                    width: getHorizontalSize(
                      343,
                    ),
                    alignment: Alignment.center,
                  ),
                  CustomIconButton(
                    height: 54,
                    width: 54,
                    margin: getMargin(
                      right: 4,
                      bottom: 54,
                    ),
                    alignment: Alignment.bottomRight,
                    child: CustomImageView(
                      svgPath: ImageConstant.imgFrameWhiteA700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 14,
                top: 12,
                right: 14,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgThumbupoutline,
                    height: getSize(
                      18,
                    ),
                    width: getSize(
                      18,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 4,
                      top: 1,
                    ),
                    child: Text(
                      "lbl_102".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold12,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgLightbulb,
                    height: getSize(
                      18,
                    ),
                    width: getSize(
                      18,
                    ),
                    margin: getMargin(
                      left: 16,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 4,
                      top: 1,
                    ),
                    child: Text(
                      "lbl_20".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold12,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    svgPath: ImageConstant.imgBookmark,
                    height: getSize(
                      18,
                    ),
                    width: getSize(
                      18,
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
