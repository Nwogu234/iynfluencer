import '../controller/messages_controller.dart';
import '../models/messages_page_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class MessagesPageItemWidget extends StatelessWidget {
  final MessagesPageItemModel messagesPageItemModelObj;

  MessagesPageItemWidget(this.messagesPageItemModelObj, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.chatsOpenedScreen,
        );
        // TODO: Add navigation or other tap functionality
      },
      child: Container(
        width: double.maxFinite,
        padding: getPadding(left: 20, top: 16, right: 20, bottom: 16),
        decoration: AppDecoration.outlineIndigo501,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup883,  // TODO: Replace with dynamic image path
                  height: getSize(55),
                  width: getSize(55),
                  radius: BorderRadius.circular(getSize(27.5)),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,  // Assuming green means online
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    messagesPageItemModelObj.senderTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiBold14Gray900,
                  ),
                  SizedBox(height: 2),
                  Text(
                    "msg_alright_then_will".tr,  // TODO: Make this dynamic
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style:  AppStyle.txtSatoshiLight14Gray900a2.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  messagesPageItemModelObj.timeTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style:  AppStyle.txtSatoshiLight14Gray900a2,
                ),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: ColorConstant.cyan100,
                    shape:BoxShape.circle,// For unread message count background
                  ),
                  child: Text(
                    '5',  // TODO: Replace with dynamic unread message count
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
