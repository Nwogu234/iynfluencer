import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/controller/chats_opened_controller.dart';
import 'package:iynfluencer/presentation/influencer_profile_about_page/controller/influencer_profile_about_controller.dart';
import 'package:iynfluencer/presentation/influencer_profile_about_page/influencer_profile_about_page.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/controller/influencer_profile_comm_post_tab_container_controller.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/influencer_profile_comm_post_tab_container_screen.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_button_one.dart';

import '../../../data/models/Influencer/influencer_response_model.dart';
import '../controller/home_creator_controller.dart';
import '../models/listrectangle50_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

/* // ignore: must_be_immutable
class Listrectangle50ItemWidget extends StatefulWidget {
  Listrectangle50ItemWidget(
    this.listrectangle50, 
    this.chatData,
    {
    Key? key,
  }) : super(
          key: key,
        );

  Influencer listrectangle50;
   ChatData? chatData;

  @override
  State<Listrectangle50ItemWidget> createState() =>
      _Listrectangle50ItemWidgetState();
}

class _Listrectangle50ItemWidgetState extends State<Listrectangle50ItemWidget> {
  

  var controller = Get.find<HomeCreatorController>();
  late ChatsOpenedController chatsController;

  onTapprofilecard(Influencer listrectangle50) {
    Get.to(
      InfluencerProfileAboutPage(selectedInfluencer: listrectangle50),
    );
  }

  @override
  void initState() {
    super.initState();
    chatsController = Get.put(ChatsOpenedController(
        chatData: widget.chatData!, selectedInfluencer: widget.listrectangle50));
  }

  @override
  Widget build(BuildContext context) {
    String? avatarUrl = widget.listrectangle50.user?.first.avatar;
    //  'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${listrectangle50.userId}-avatar.jpeg';
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

    return GestureDetector(
      onTap: () {
        onTapprofilecard(widget.listrectangle50);
      },
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CustomImageView(
                          url: widget.listrectangle50.user?.first.avatar ??
                              'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                          fit: BoxFit.cover,
                          height: getSize(60),
                          width: getSize(60),
                          radius: BorderRadius.circular(getSize(50.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        right: 10,
                        top: 6,
                        bottom: 3,
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 170,
                                child: Text(
                                  "${capitalizeFirstLetter(widget.listrectangle50.user?.first.firstName)} ${capitalizeFirstLetter(widget.listrectangle50.user?.first.lastName)}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold14Black900,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  bottom: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                      svgPath:
                                          ImageConstant.imgFrameBlueGray400,
                                      height: getSize(
                                        13,
                                      ),
                                      width: getSize(
                                        13,
                                      ),
                                      margin: getMargin(
                                        bottom: 4,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 4,
                                      ),
                                      child: Text(
                                          "${widget.listrectangle50.jobsDone.toString()} Jobs Completed"
                                              .tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiMedium
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10.sp)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(left: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadiusStyle.txtRoundedBorder6.copyWith(),
                          color: ColorConstant.pink,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        // Ribbon color
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.white,
                            ),
                            Text(
                              'View Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                                    .sp, // Adjust font size according to your design
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text("${widget.listrectangle50.bio}",
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiMedium.copyWith(
                        fontSize: 12.sp, fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: getPadding(right: 10),
                child: Center(
                  child: CustomButtonOne(
                      variant: ButtonVariants.FillCyan300,
                      height: getVerticalSize(50),
                      text: "Message".tr,
                      margin: getMargin(top: 17),
                      padding: ButtonPaddings.PaddingAll15,
                      onTap: () {
                        chatsController.onTapChatCard(
                            widget.listrectangle50, 
                            widget.chatData!
                            );
                      }),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    thickness: .1,
                  ))
            ]),
      ),
    );
  }
}
 */

// ignore: must_be_immutable
class Listrectangle50ItemWidget extends StatefulWidget {
  Listrectangle50ItemWidget(
    this.listrectangle50,
    this.chatData, {
    Key? key,
  }) : super(
          key: key,
        );

  Influencer listrectangle50;
  ChatData? chatData;
//final chatData = Get.arguments as ChatData;

  @override
  State<Listrectangle50ItemWidget> createState() =>
      _Listrectangle50ItemWidgetState();
}

class _Listrectangle50ItemWidgetState extends State<Listrectangle50ItemWidget> {
  var controller = Get.find<HomeCreatorController>();

  // late ChatsOpenedController chatsController;

  final chatsData = ChatData(
      id: '',
      creatorId: '',
      creatorUserId: '',
      influencerId: '',
      influencerUserId: '',
      unreadByCreator: 0,
      unreadByInfluencer: 0,
      blockedByCreator: false,
      blockedByInfluencer: false,
      chatId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      messages: const [],
      influencerUser: null,
      creatorUser: null);

  @override
  void initState() {
    super.initState();
    /* chatsController = Get.put(ChatsOpenedController(
     chatData: widget.chatData!, selectedInfluencer: widget.listrectangle50)); */
    Get.put(ChatsOpenedController(
        chatData: widget.chatData ?? chatsData,
        selectedInfluencer: widget.listrectangle50));
  }

  onTapprofilecard(Influencer listrectangle50, ChatData? chatData) {
    Get.to(
      InfluencerProfileAboutPage(
          chatData: chatData ?? chatsData, selectedInfluencer: listrectangle50),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ChatsOpenedController chatsController =
        Get.find<ChatsOpenedController>();
      String? avatarUrl = widget.listrectangle50.user?.first.avatar;
    //  'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${listrectangle50.userId}-avatar.jpeg';
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

    return GestureDetector(
      onTap: () {
        onTapprofilecard(
          widget.listrectangle50,
          widget.chatData,
        );
      },
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CustomImageView(
                          url: widget.listrectangle50.user?.first.avatar ??
                              'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                          fit: BoxFit.cover,
                          height: getSize(60),
                          width: getSize(60),
                          radius: BorderRadius.circular(getSize(50.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        right: 10,
                        top: 6,
                        bottom: 3,
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 170,
                                child: Text(
                                  "${capitalizeFirstLetter(widget.listrectangle50.user?.first.firstName)} ${capitalizeFirstLetter(widget.listrectangle50.user?.first.lastName)}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold14Black900,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  bottom: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                      svgPath:
                                          ImageConstant.imgFrameBlueGray400,
                                      height: getSize(
                                        13,
                                      ),
                                      width: getSize(
                                        13,
                                      ),
                                      margin: getMargin(
                                        bottom: 4,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 4,
                                      ),
                                      child: Text(
                                          "${widget.listrectangle50.jobsDone.toString()} Jobs Completed"
                                              .tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiMedium
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10.sp)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(left: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadiusStyle.txtRoundedBorder6.copyWith(),
                          color: ColorConstant.pink,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        // Ribbon color
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.white,
                            ),
                            Text(
                              'View Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                                    .sp, // Adjust font size according to your design
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text("${widget.listrectangle50.bio}",
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiMedium.copyWith(
                        fontSize: 12.sp, fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: getPadding(right: 10),
                child: Center(
                  child: CustomButtonOne(
                      variant: ButtonVariants.FillCyan300,
                      height: getVerticalSize(50),
                      text: "Message".tr,
                      margin: getMargin(top: 17),
                      padding: ButtonPaddings.PaddingAll15,
                      onTap: () {
                        chatsController.onTapChatCard(
                            widget.listrectangle50, chatsController.chatData);
                      }),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    thickness: .1,
                  ))
            ]),
      ),
    );
  }
}
