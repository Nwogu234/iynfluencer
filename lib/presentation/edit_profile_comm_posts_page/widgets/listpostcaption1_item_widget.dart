import '../controller/edit_profile_comm_posts_controller.dart';
import '../models/listpostcaption1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listpostcaption1ItemWidget extends StatelessWidget {
  Listpostcaption1ItemWidget(
    this.listpostcaption1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listpostcaption1ItemModel listpostcaption1ItemModelObj;

  var controller = Get.find<EditProfileCommPostsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          top: 13,
          bottom: 13,
        ),
        decoration: AppDecoration.outlineGray9000c.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                left: 15,
              ),
              child: Text(
                "msg_community_post_caption".tr,
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
                335,
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
                  right: 10,
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
