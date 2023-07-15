import '../controller/notification_mentions_one_controller.dart';
import '../models/listgroup855_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listgroup855ItemWidget extends StatelessWidget {
  Listgroup855ItemWidget(
    this.listgroup855ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listgroup855ItemModel listgroup855ItemModelObj;

  var controller = Get.find<NotificationMentionsOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: getPadding(
        top: 10,
        bottom: 10,
      ),
      decoration: AppDecoration.outlineIndigo506,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup85254,
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
            margin: getMargin(
              bottom: 8,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 4,
              bottom: 8,
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
                        text: "msg_mentioned_you_on".tr,
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
                  "lbl_15_min_ago".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiLight12Gray600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
