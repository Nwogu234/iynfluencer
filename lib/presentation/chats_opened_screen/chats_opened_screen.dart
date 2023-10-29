import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chatbubble.dart';

import 'controller/chats_opened_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';


class ChatsOpenedScreen extends GetWidget<ChatsOpenedController> {
  const ChatsOpenedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorConstant.gray5001,
        appBar: CustomAppBar(
                height: getVerticalSize(64),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(30),
                    width: getSize(30),
                    svgPath: ImageConstant.imgArrowleftGray600,
                    margin: getMargin(left: 10, top: 5, bottom: 20,right: 10),
                    onTap: () {
                      onTapArrowleft8();
                    }),
                title: Padding(
                    padding: getPadding(left: 2),
                    child: Row(children: [
                      AppbarCircleimage(
                          imagePath: ImageConstant.imgGroup85235x35,
                        margin: getMargin(
                          left: 10,
                          top: 5,
                          bottom: 20,
                        ),
                      ),
                      AppbarSubtitle(
                          text: "lbl_mark_adebayo".tr,
                          margin: getMargin(left: 14, top: 5, bottom: 20),
                      )
                    ])),
                // actions: [
                //   AppbarImage(
                //       height: getSize(18),
                //       width: getSize(18),
                //       svgPath: ImageConstant.imgFrame18x18,
                //       margin:
                //           getMargin(left: 23, top: 23, right: 22, bottom: 1),
                //    onTap: (){
                //     Get.back();
                //    },
                //   ),
                //   AppbarImage(
                //       height: getSize(20),
                //       width: getSize(20),
                //       svgPath: ImageConstant.imgFrame20x20,
                //       margin: getMargin(left: 23, top: 22, right: 45),
                //    onTap: (){
                //     Get.back();
                //    },)
                // ],
                styleType: Style.bgOutlineIndigo50_1),
        body: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: getPadding(left: 19, top: 25, right: 19, bottom: 10),  // give some bottom padding to account for ChatInputBar
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                ChatMessageBubble(
                  messageText: "msg_hey_favour_how".tr,
                  isReceived: false,
                  timestamp: "lbl_7_13_pm".tr,
                  leadingImagePath: ImageConstant.imgTrashCyan300,
                  trailingImagePath: ImageConstant.imgFile,
                ),
                ChatMessageBubble(
                  messageText: "msg_just_rounded_up".tr,
                  isReceived: true,
                  timestamp: "lbl_7_13_pm".tr,
                  leadingImagePath: ImageConstant.imgTrashGray20003,
                  trailingImagePath: ImageConstant.imgFrame2,
                ),
                ChatMessageBubble(
                  messageText: "msg_i_will_most_certainly".tr,
                  isReceived: true,
                  timestamp: "lbl_8_12_pm".tr,
                  leadingImagePath: ImageConstant.imgBookmarkGray20003,
                  trailingImagePath: ImageConstant.imgFrame2,
                ),
            ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ChatInputBar(
                messageController: controller.messageController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowleft8() {
    Get.back();
  }
}

