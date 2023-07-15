import '../controller/messages_controller.dart';
import '../models/messages_page_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class MessagesPageItemWidget extends StatelessWidget {
  MessagesPageItemWidget(
    this.messagesPageItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MessagesPageItemModel messagesPageItemModelObj;

  var controller = Get.find<MessagesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: getPadding(
        left: 20,
        top: 16,
        right: 20,
        bottom: 16,
      ),
      decoration: AppDecoration.outlineIndigo501,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup883,
            height: getSize(
              55,
            ),
            width: getSize(
              55,
            ),
            radius: BorderRadius.circular(
              getSize(
                27.5,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 14,
              top: 10,
              bottom: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    messagesPageItemModelObj.senderTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiBold14Gray900,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 1,
                    top: 2,
                  ),
                  child: Text(
                    "msg_alright_then_will".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiLight13,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: getPadding(
              top: 5,
              bottom: 6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    messagesPageItemModelObj.timeTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiLight125Bluegray40001,
                  ),
                ),
                CustomTextFormField(
                  width: getSize(
                    20,
                  ),
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: messagesPageItemModelObj.framethreeController,
                  hintText: "lbl_2".tr,
                  margin: getMargin(
                    left: 2,
                    top: 6,
                  ),
                  variant: TextFormFieldVariant.FillCyan300,
                  shape: TextFormFieldShape.CircleBorder10,
                  padding: TextFormFieldPadding.PaddingAll3,
                  fontStyle: TextFormFieldFontStyle.SatoshiBold10,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
