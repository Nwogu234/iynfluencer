import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/binding/chats_opened_binding.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';

import '../controller/messages_controller.dart';
import '../models/messages_page_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessagesPageItemWidget extends StatelessWidget {
  final ChatData messagesPageItemModelObj;

  MessagesPageItemWidget({
    Key? key,
    required this.messagesPageItemModelObj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = messagesPageItemModelObj.unreadByCreator;  // will change this later
    final bool isOnline = false;
    String messageText = messagesPageItemModelObj.messages.isNotEmpty
        ? messagesPageItemModelObj.messages.last.text
        : " ";

    String? avatarUrl =
        "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${messagesPageItemModelObj.influencerUserId}-avatar.jpeg";
    // Assuming this is a String
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

    return InkWell(
      splashColor: ColorConstant.cyan100,
      onTap: () {
        Get.to(ChatsOpenedScreen(
          chatData: messagesPageItemModelObj,
        ));
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
                  url: imageProvider,
                  fit: BoxFit.cover,
                  height: getSize(55),
                  width: getSize(55),
                  radius: BorderRadius.circular(getSize(27.5)),
                ),
                isOnline == true
                    ? Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ))
                    : SizedBox.shrink()
              ],
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${capitalizeFirstLetter(messagesPageItemModelObj.influencerUser?.firstName)}-${capitalizeFirstLetter(messagesPageItemModelObj.influencerUser?.lastName)}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiBold14Gray900,
                  ),
                 messagesPageItemModelObj.messages.isNotEmpty  ? SizedBox(height: 15) :SizedBox.shrink(),
                  Text(
                    messageText,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiLight14Gray900a2
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom:  messagesPageItemModelObj.messages.isNotEmpty ? 0 : 15,
                    ),
                  child: Text(
                    timeago.format(messagesPageItemModelObj.createdAt),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiLight14Gray900a2,
                  ),
                ),
                SizedBox(height: 6),
                data == 0
                    ? const SizedBox.shrink()
                    : Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: ColorConstant.cyan100,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "${data > 99 ? '99=' : data.toString()}".tr,
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
