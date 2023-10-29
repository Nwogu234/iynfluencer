import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';
class ChatInputBar extends StatelessWidget {
  final TextEditingController messageController;

  ChatInputBar({required this.messageController});

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(ChatsInputController());
    return  Container(
      height: getVerticalSize(42),
      width: getHorizontalSize(334),
      margin: getMargin(left: 21, right: 20, bottom: 45),
      decoration: AppDecoration.outlineIndigo505,
      child: Stack(alignment: Alignment.center, children: [
        Obx(
              () => CustomTextFormField(
            width: getHorizontalSize(334),
            focusNode: FocusNode(),
            autofocus: true,
            onChanged: (text) {
              controller.message.value = text; // Update the message in the controller.
            },
            hintText: "lbl_write_a_message".tr,
            padding: TextFormFieldPadding.PaddingT11,
            fontStyle: TextFormFieldFontStyle.SatoshiLight14,
            textInputAction: TextInputAction.done,
            alignment: Alignment.center,
            suffix: Container(
              // margin: getMargin(left: 30, top: 10, right: 16, bottom: 10),
              child: IconButton(
                onPressed: controller.message.value.isNotEmpty
                    ? controller.sendMessage
                    : null, // Handle camera action here if needed
                icon: controller.message.value.isNotEmpty
                    ? Icon(
                  Icons.send,
                  color: Colors.blue, // You can set the desired color here
                  size: 24.0,       // You can set the desired icon size here
                )
                    : CustomImageView(
                  height: 24,
                  width: 24,
                  svgPath: ImageConstant.imgCamera,
                  // Add any other necessary properties and styling for CustomImageView
                ),

              ),
            ),
            suffixConstraints: BoxConstraints(maxHeight: getVerticalSize(42)),
          ),
        ),
      ]),
    );
  }
}

class ChatsInputController extends GetxController {
  var message = "".obs; // This will hold the message from the chat input.

  void sendMessage() {
    if (message.value.isNotEmpty) {
      // Handle sending the message logic here

      // Clear the message after sending
      message.value = "";
    }
  }
}
