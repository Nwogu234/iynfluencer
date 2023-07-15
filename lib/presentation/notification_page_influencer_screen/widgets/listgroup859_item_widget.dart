import '../controller/notification_page_influencer_controller.dart';
import '../models/listgroup859_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listgroup859ItemWidget extends StatelessWidget {
  Listgroup859ItemWidget(
    this.listgroup859ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listgroup859ItemModel listgroup859ItemModelObj;

  var controller = Get.find<NotificationPageInfluencerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: getPadding(
        top: 10,
        bottom: 10,
      ),
      decoration: AppDecoration.outlineIndigo505,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup85265,
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
                        text: "lbl_james_ayo".tr,
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
                        text: "msg_approved_payment".tr,
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
                Obx(
                  () => Text(
                    listgroup859ItemModelObj.durationTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiLight12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
