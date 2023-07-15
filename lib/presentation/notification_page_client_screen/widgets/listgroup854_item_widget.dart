import '../controller/notification_page_client_controller.dart';
import '../models/listgroup854_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listgroup854ItemWidget extends StatelessWidget {
  Listgroup854ItemWidget(
    this.listgroup854ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listgroup854ItemModel listgroup854ItemModelObj;

  var controller = Get.find<NotificationPageClientController>();

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
            imagePath: ImageConstant.imgGroup85223,
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
                        text: "msg_requested_payment".tr,
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
                    listgroup854ItemModelObj.durationTxt.value,
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
