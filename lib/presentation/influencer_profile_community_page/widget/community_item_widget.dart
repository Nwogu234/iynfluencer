import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/models/body_item_model.dart';
import 'package:iynfluencer/presentation/influencer_profile_community_page/controller/influencer_profile_community_controller.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class CommunityItemWidget extends StatelessWidget {
  CommunityItemWidget(
    this.bodyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BodyItemModel bodyItemModelObj;

  var controller = Get.find<InfluencerProfileCommunityController>();

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
           
            Padding(
              padding: getPadding(
                left: 15,
                top: 12,
              ),
              child: Text(
                "Community caption post here".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiBold16.copyWith(
                fontSize: 16.sp,
               fontWeight: FontWeight.normal
              ),
            )
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
