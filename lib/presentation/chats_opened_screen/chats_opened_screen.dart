import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chatbubble.dart';
import 'package:iynfluencer/widgets/datelable.dart';
export 'package:get/get.dart';
import 'controller/chats_opened_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatsOpenedScreen extends StatefulWidget {
  ChatsOpenedScreen({
    Key? key, 
  this.selectedInfluencer,
  this.chatData,
  }) : super(key: key);

  final Influencer? selectedInfluencer;
  final ChatData?  chatData;
 


  @override
  State<ChatsOpenedScreen> createState() => _ChatsOpenedScreenState();
}

class _ChatsOpenedScreenState extends State<ChatsOpenedScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   ChatsOpenedController controller = Get.put(ChatsOpenedController());

  @override
  Widget build(BuildContext context) {

     String? avatarUrl =
       "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.selectedInfluencer!.userId}-avatar.jpeg";
    String imageProvider;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    final scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
        key:_scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorConstant.gray5001,
        appBar: CustomAppBar(
            height: getVerticalSize(64),
            leadingWidth: 52,
            leading: AppbarImage(
                height: getSize(30),
                width: getSize(30),
                svgPath: ImageConstant.imgArrowleftGray600,
                margin: getMargin(left: 10, top: 5, bottom: 20, right: 10),
                onTap: () {
                  onTapArrowleft8();
                }),
            title: Padding(
                padding: getPadding(left: 2, bottom: 2, top: 2),
                child: Row(children: [
                  AppbarCircleimage(
                    url: imageProvider,
                    margin: getMargin(
                      left: 10,
                      top: 5,
                      bottom: 20,
                    ),
                  ),
                  AppbarSubtitle(
                    text:"${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.firstName)} ${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.lastName)}".tr,
                    margin: getMargin(left: 14, top: 5, bottom: 20),
                  )
                ])),
            actions: [
              AppbarImage(
                height: getSize(18),
                width: getSize(18),
                svgPath: ImageConstant.imgFrame18x18,
                margin: getMargin(left: 23, right: 8, bottom: 10),
                onTap: () {
                  Get.back();
                },
              ),
              AppbarImage(
                height: getSize(20),
                width: getSize(20),
                svgPath: ImageConstant.imgFrame20x20,
                margin: getMargin(left: 23, right: 22, bottom: 10),
                onTap: () {
                  Get.back();
                },
              )
            ],
            styleType: Style.bgOutlineIndigo50_1),
        body: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: getPadding(
                    left: 19,
                    top: 5,
                    right: 19,
                    bottom:
                        10), // give some bottom padding to account for ChatInputBar
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       DateLable(
                        dateTime: widget.chatData?.createdAt ?? DateTime.now(),
                        ), 
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
