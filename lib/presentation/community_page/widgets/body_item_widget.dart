import '../controller/community_controller.dart';
import '../models/appbar_item_model.dart';
import '../models/body_item_model.dart';
import '../widgets/appbar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class BodyItemWidget extends StatelessWidget {
  BodyItemWidget(
    this.bodyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BodyItemModel bodyItemModelObj;

  var controller = Get.find<CommunityController>();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAppBar(
              height: getVerticalSize(
                41,
              ),
              leadingWidth: 71,
              leading: AppbarCircleimage(
                imagePath: ImageConstant.imgGroup85240x40,
                margin: getMargin(
                  left: 31,
                ),
              ),
              title: AppbarSubtitle1(
                text: "lbl_micheal_scott".tr,
                margin: getMargin(
                  left: 12,
                ),
              ),
              actions: [
                AppbarImage(
                  height: getVerticalSize(
                    1,
                  ),
                  width: getHorizontalSize(
                    13,
                  ),
                  svgPath: ImageConstant.imgVector,
                  margin: getMargin(
                    left: 32,
                    top: 19,
                    right: 32,
                    bottom: 19,
                  ),
                ),
              ],
              // itemCount: bodyItemModelObj.appbarItemList.length,
              // itemBuilder: (context, index) {
              //   AppbarItemModel model = bodyItemModelObj.appbarItemList[index];
              //   return AppbarItemWidget(
              //     model,
              //   );
              // },
            ),
            Padding(
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
            CustomImageView(
              imagePath: ImageConstant.imgRectangle5068,
              height: getVerticalSize(
                211,
              ),
              width: getHorizontalSize(
                343,
              ),
              margin: getMargin(
                top: 11,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
