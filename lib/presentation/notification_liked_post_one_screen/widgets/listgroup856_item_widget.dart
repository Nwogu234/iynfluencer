import '../controller/notification_liked_post_one_controller.dart';
import '../models/listgroup856_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listgroup856ItemWidget extends StatelessWidget {
  Listgroup856ItemWidget(
    this.listgroup856ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listgroup856ItemModel listgroup856ItemModelObj;

  var controller = Get.find<NotificationLikedPostOneController>();

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
        decoration: AppDecoration.outlineIndigo506,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                right: 37,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup85263,
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
                  Expanded(
                    child: Padding(
                      padding: getPadding(
                        left: 20,
                        top: 4,
                        bottom: 1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_jane_bayo".tr,
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
                                  text: "msg_liked_your_post".tr,
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
                            "lbl_mar_23".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight12Gray600,
                          ),
                        ],
                      ),
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
                  top: 9,
                  right: 1,
                  bottom: 14,
                ),
                padding: getPadding(
                  left: 7,
                  top: 10,
                  right: 7,
                  bottom: 10,
                ),
                decoration: AppDecoration.outlineIndigo507.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle5094,
                      height: getSize(
                        40,
                      ),
                      width: getSize(
                        40,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: getHorizontalSize(
                          205,
                        ),
                        margin: getMargin(
                          left: 12,
                          top: 5,
                          bottom: 2,
                        ),
                        child: Text(
                          "msg_a_game_influencer".tr,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight1192,
                        ),
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
