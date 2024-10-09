import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/chats_influencer_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/models/messages_page_influencer_model.dart';

import '../../../data/models/messages/chatmodel.dart';
import '../controller/messages_page_influencer_controller.dart';
import '../models/listgroup883_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/messages_page_influencer_model.dart';

// ignore: must_be_immutable
class Listgroup883ItemWidget extends StatelessWidget {
  Listgroup883ItemWidget({
    Key? key,
    required this.listgroup883ItemModelObj,
  }) : super(key: key);

  final ChatData listgroup883ItemModelObj;

  final storage = new FlutterSecureStorage();

    
String formatDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays < 1) {
    return DateFormat.jm('en_US').format(dateTime); 
  } else if (difference.inDays == 1) {
    return 'YESTERDAY';
  } else if (difference.inDays < 365) {
    return DateFormat('MMM d').format(dateTime);
  } else {
    return DateFormat('MMM d, yyyy').format(dateTime); 
  }
}


  @override
  Widget build(BuildContext context) {
   // final data = listgroup883ItemModelObj.unreadByCreator;
   String formattedDateTime = listgroup883ItemModelObj.messages.isNotEmpty
        ? formatDateTime(listgroup883ItemModelObj.messages.last.createdAt)
        : '';
    final bool isOnline = false;
    String messageText = listgroup883ItemModelObj.messages.isNotEmpty
        ? listgroup883ItemModelObj.messages.last.text
        : " ";

    String? avatarUrl =
        listgroup883ItemModelObj.creatorUser!.avatar;
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

    return FutureBuilder<int?>(
      future: getData(),
      builder: (context, snapshot){
          final int? unreadByInfluencerValue = snapshot.data;

          final data = unreadByInfluencerValue != null
              ? unreadByInfluencerValue
              : listgroup883ItemModelObj.unreadByCreator;

    return InkWell(
      splashColor: ColorConstant.cyan100,
      onTap: () {
        saveData(0);
        Get.to(
          ChatsInfluencerScreen(
          chatData: listgroup883ItemModelObj,
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
                  fit: BoxFit.cover,
                  url: imageProvider,
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
                    "${capitalizeFirstLetter(listgroup883ItemModelObj.creatorUser?.firstName)}-${capitalizeFirstLetter(listgroup883ItemModelObj.creatorUser?.lastName)}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiBold14Gray900,
                  ),
                 listgroup883ItemModelObj.messages.isNotEmpty  ? SizedBox(height: 10) :SizedBox.shrink(),
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
                    bottom: listgroup883ItemModelObj.messages.isNotEmpty ? 0 : 15,
                    ),
                  child: Text(
                    formattedDateTime,
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
      );
  }

    void saveData(int value) async {
    await storage.write(key: 'unreadByCreator', value: value.toString());
  }

  Future<int?> getData() async {
    String? value = await storage.read(key: 'unreadByCreator');
    return value != null ? int.tryParse(value) : null;
  }
}

/* 

InkWell(
      splashColor: ColorConstant.cyan100,
      onTap: () {
        Get.to(ChatsInfluencerScreen(
          chatData: listgroup883ItemModelObj,
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
                  fit: BoxFit.cover,
                  url: imageProvider,
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
                    "${capitalizeFirstLetter(listgroup883ItemModelObj.creatorUser?.firstName)}-${capitalizeFirstLetter(listgroup883ItemModelObj.creatorUser?.lastName)}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiBold14Gray900,
                  ),
                 listgroup883ItemModelObj.messages.isNotEmpty  ? SizedBox(height: 10) :SizedBox.shrink(),
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
                    bottom: listgroup883ItemModelObj.messages.isNotEmpty ? 0 : 15,
                    ),
                  child: Text(
                    timeago.format(listgroup883ItemModelObj.createdAt),
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
 */