import '../controller/creator_profile_reveiws_controller.dart';
import '../models/listellipse207_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listellipse207ItemWidget extends StatelessWidget {
  Listellipse207ItemWidget(
    this.listellipse207ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listellipse207ItemModel listellipse207ItemModelObj;

  var controller = Get.find<CreatorProfileReveiwsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        decoration: AppDecoration.outlineIndigo501,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse207,
                  height: getSize(
                    50,
                  ),
                  width: getSize(
                    50,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      25,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 6,
                    bottom: 2,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_mark_adebayo".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold145,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgFrameGray60015x15,
                              height: getSize(
                                15,
                              ),
                              width: getSize(
                                15,
                              ),
                              margin: getMargin(
                                bottom: 4,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 6,
                              ),
                              child: Text(
                                "lbl_lagos_nigeria".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomImageView(
                  svgPath: ImageConstant.imgFrame905,
                  height: getVerticalSize(
                    15,
                  ),
                  width: getHorizontalSize(
                    75,
                  ),
                  margin: getMargin(
                    top: 4,
                    bottom: 31,
                  ),
                ),
              ],
            ),
            Container(
              width: getHorizontalSize(
                328,
              ),
              margin: getMargin(
                left: 1,
                top: 27,
                right: 6,
                bottom: 24,
              ),
              child: Obx(
                () => Text(
                  listellipse207ItemModelObj.descriptionTxt.value,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiLight13Gray900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
