import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/controller/chats_opened_controller.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/modals/hire_modal.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_button_one.dart';
import 'package:iynfluencer/widgets/custom_button_two.dart';
import 'package:iynfluencer/widgets/datelable.dart';
import 'package:url_launcher/url_launcher.dart';
import '../influencer_profile_about_page/widgets/chipviewframe89_item_widget.dart';
import 'controller/influencer_profile_about_controller.dart';
import 'models/chipviewframe89_item_model.dart';
import 'models/influencer_profile_about_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class InfluencerProfileAboutPage extends StatelessWidget {
  InfluencerProfileAboutPage({required this.selectedInfluencer});

  final Influencer selectedInfluencer;

  ChatData chatData = ChatData(
    id: 'id',
    creatorId: 'CreatorId',
    creatorUserId: 'CreatorUserId',
    influencerId: 'InfluencerId',
    influencerUserId: 'defaultInfluencerUserId',
    unreadByCreator: 0,
    unreadByInfluencer: 0,
    blockedByCreator: false,
    blockedByInfluencer: false,
    chatId: ' ',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    messages: const [],
    influencerUser: UserModel(
        id: 'id',
        firstName: 'firstName',
        lastName: 'lastName',
        email: 'email',
        password: 'password',
        termsAndConditionsAgreement: false,
        isNewUser: false,
        isSocial: false,
        verified: false,
        verifiedEmail: false,
        followers: 0,
        following: 0,
        views: 0,
        userId: 'userId',
        createdAt: '',
        updatedAt: '',
        creatorId: 'creatorId',
        influencerId: 'influencerId',
        country: 'country',
        dob: 'dob',
        phone: 'phone',
        username: 'username',
        avatar: 'avatar',
        cover: 'cover'),
    creatorUser: UserModel(
        id: 'id',
        firstName: 'firstName',
        lastName: 'lastName',
        email: 'email',
        password: 'password',
        termsAndConditionsAgreement: false,
        isNewUser: false,
        isSocial: false,
        verified: false,
        verifiedEmail: false,
        followers: 0,
        following: 0,
        views: 0,
        userId: 'userId',
        createdAt: '',
        updatedAt: '',
        creatorId: 'creatorId',
        influencerId: 'influencerId',
        country: 'country',
        dob: 'dob',
        phone: 'phone',
        username: 'username',
        avatar: 'avatar',
        cover: 'cover'),
  );

  InfluencerProfileAboutController controller = Get.put(
      InfluencerProfileAboutController(InfluencerProfileAboutModel().obs));

  @override
  Widget build(BuildContext context) {
    int socialname = 0;
    ChatsOpenedController chatsController = Get.put(ChatsOpenedController(
        chatData: chatData, selectedInfluencer: selectedInfluencer));

    String? avatarUrl =
        "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${selectedInfluencer!.userId}-avatar.jpeg";
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

    Map<String, IconData> socialIcons = {
      'Facebook': FontAwesomeIcons.facebook,
      'Instagram': FontAwesomeIcons.instagram,
      'Twitter': FontAwesomeIcons.twitter,
      'LinkedIn': FontAwesomeIcons.linkedin,
      'Pinterest': FontAwesomeIcons.pinterest,
      'Snapchat': FontAwesomeIcons.snapchatGhost,
      'YouTube': FontAwesomeIcons.youtube,
      'TikTok': FontAwesomeIcons.tiktok,
      'Reddit': FontAwesomeIcons.redditAlien,
      'Tumblr': FontAwesomeIcons.tumblr,
      'Flickr': FontAwesomeIcons.flickr,
      'Vimeo': FontAwesomeIcons.vimeoV,
      'WhatsApp': FontAwesomeIcons.whatsapp,
      'WeChat': FontAwesomeIcons.weixin,
      'QQ': FontAwesomeIcons.qq,
      'QZone': FontAwesomeIcons.tag,
      'Twitch': FontAwesomeIcons.twitch,
      'Quora': FontAwesomeIcons.quora,
      'Telegram': FontAwesomeIcons.telegram,
      'Viber': FontAwesomeIcons.viber,
      'Line': FontAwesomeIcons.line,
      'SlideShare': FontAwesomeIcons.slideshare,
    };

      void _launchURL(String url) async {
        final uri = Uri.parse(url);
       if (await canLaunchUrl(uri)) {
         await launchUrl(uri);
       } else {
       print('Could not launch $url');
      }
    }

    String formatFollowers(int followers) {
      if (followers >= 1000000000) {
        return "${(followers / 1000000000).toStringAsFixed(1)}B";
      } else if (followers >= 1000000) {
        return "${(followers / 1000000).toStringAsFixed(1)}M";
      } else if (followers >= 1000) {
        return "${(followers / 1000).toStringAsFixed(1)}k";
      } else {
        return "$followers";
      }
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: CustomAppBar(
                          height: getVerticalSize(44),
                          leadingWidth: 45,
                          leading: AppbarImage(
                              color: ColorConstant.black900,
                              height: getSize(30),
                              width: getSize(30),
                              svgPath: ImageConstant.imgArrowleftGray200,
                              margin: getMargin(left: 15),
                              onTap: () {
                                onTapArrowleft7();
                              }),
                          actions: [
                            AppbarImage(
                              color: ColorConstant.black900,
                              height: getVerticalSize(13),
                              width: getHorizontalSize(20),
                              svgPath: ImageConstant.imgVector,
                              margin: getMargin(left: 16, right: 16, bottom: 4),
                              onTap: () {},
                            )
                          ]),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              url: imageProvider,
                              fit: BoxFit.cover,
                              height: getSize(85),
                              width: getSize(85),
                              radius: BorderRadius.circular(getSize(70)),
                              margin: getMargin(left: 5)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getPadding(
                                top: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      "190".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold16
                                          .copyWith(fontSize: 17.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                    ),
                                    child: Text("Jobs".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16
                                            .copyWith(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getPadding(
                                top: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      "10+".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtSatoshiBold16
                                          .copyWith(fontSize: 17.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                    ),
                                    child: Text("Reviews".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16
                                            .copyWith(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getPadding(
                                top: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      "21.6k".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtSatoshiBold16
                                          .copyWith(fontSize: 17.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                    ),
                                    child: Text("Total Views".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16
                                            .copyWith(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "${capitalizeFirstLetter(selectedInfluencer?.user?.first.firstName)} ${capitalizeFirstLetter(selectedInfluencer?.user?.first.lastName)}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.txtSatoshiBold16.copyWith(fontSize: 19.sp),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Column(
                            children:
                                selectedInfluencer.niche?.take(1).map((social) {
                                      return Text(
                                        'Passionate $social influencer on a mission to inspire and empower',
                                        style: AppStyle.txtSatoshiMedium,
                                      );
                                    }).toList() ??
                                    [SizedBox.shrink()])),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Row(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, right: 10),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: getSize(20),
                                  width: getSize(20),
                                  color: ColorConstant.black90087,
                                ),
                              ),
                              Padding(
                                  padding: getPadding(top: 3),
                                  child: Text(
                                    "${capitalizeFirstLetter(selectedInfluencer?.user?.first.country)}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold16.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal),
                                  )),
                              SizedBox(width: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 10),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgCalenders,
                                  height: getSize(25),
                                  width: getSize(25),
                                  color: ColorConstant.black90087,
                                ),
                              ),
                              Padding(
                                  padding: getPadding(top: 2),
                                  child: Text(
                                    "Joined April 2022".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold16.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal),
                                  )),
                            ])),
                      ],
                    ),
                    Padding(
                        padding: getPadding(left: 2, bottom: 14, top: 14),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButtonTwo(
                                shape: ButtonShape.RoundedBorderz12,
                                height: getVerticalSize(50),
                                width: getHorizontalSize(161),
                                text: "Hire Now".tr,
                                padding: ButtonPaddingz.PaddingAll12,
                                onTap: () => Get.bottomSheet(
                                    HireModal(influencer: selectedInfluencer),
                                    backgroundColor: ColorConstant.whiteA700),
                                fontStyle: ButtonFontStylez.SatoshiBold15,
                              ),
                              CustomButton(
                                  shape: ButtonShapes.RoundedBorder12,
                                  onTap: () {
                                    chatsController.onTapChatCard(
                                        selectedInfluencer, chatData);
                                  },
                                  height: getVerticalSize(50),
                                  width: getHorizontalSize(161),
                                  text: "Message".tr,
                                  margin: getMargin(left: 12),
                                  variant: ButtonVariant.FillGray200ab,
                                  padding: ButtonPadding.PaddingAll4,
                                  fontStyle:
                                      ButtonFontStyle.SatoshiBold15Gray900)
                            ])),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: ColorConstant.gray200Ab),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ColorConstant.whiteA70001,
                                      width: getHorizontalSize(1)),
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder17),
                              child: Container(
                                width: getHorizontalSize(370),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "lbl_about".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtH2Gray600,
                                        ),
                                      ),
                                      Text("${selectedInfluencer.bio!}",
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiMedium
                                              .copyWith(
                                                  fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ColorConstant.whiteA70001,
                                      width: getHorizontalSize(1)),
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder17),
                              child: Container(
                                width: getHorizontalSize(370),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2),
                                        child: Text(
                                          "Niche".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtH2Gray600,
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 2,
                                          top: 10,
                                        ),
                                        child: Wrap(
                                          runSpacing: getVerticalSize(5),
                                          spacing: getHorizontalSize(5),
                                          children: selectedInfluencer?.niche
                                                  ?.map((item) {
                                                return Chipviewframe89ItemWidget(
                                                  Chipviewframe89ItemModel(
                                                    chipviewframe89ModelObj:
                                                        item,
                                                  ),
                                                );
                                              })?.toList() ??
                                              [],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ColorConstant.whiteA70001,
                                      width: getHorizontalSize(1)),
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder17),
                              child: Container(
                                width: getHorizontalSize(370),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2),
                                        child: Text(
                                          "Social Media".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtH2Gray600,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 12.0
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: selectedInfluencer.socials
                                                  ?.take(3)
                                                  .map((social) {
                                                socialname =
                                                    social.followersCount;
                                                IconData iconData = socialIcons[
                                                        capitalizeFirstLetter(
                                                            social
                                                                .platformName)] ??
                                                    Icons.error;
                                                return Row(
                                                  children: [
                                                  iconData == FontAwesomeIcons.tiktok ?
                                                     InkWell(
                                                          onTap: () =>
                                                          _launchURL(social.platformUrl),
                                                       child: Container(
                                                        width: 35.w, 
                                                        height: 35.h, 
                                                        color: Colors.transparent, 
                                                         child: Icon(iconData,
                                                          color: Colors.black,
                                                          size: 35.sp)),
                                                 ) : InkWell(
                                                    onTap: () =>
                                                          _launchURL(social.platformUrl),
                                                   child: CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgTiktok,
                                                            height: getSize(35),
                                                            width: getSize(35)),
                                                 ),
                                                 SizedBox(width:15),
                                                 Column(
                                                  children: [
                                                   Text(
                                                    
                                                    formatFollowers(socialname),
                                                    style: AppStyle.txtSatoshiBold16
                                                     .copyWith(fontSize: 17.sp),
                                                    ),
                                                   Text(
                                                    'followers',
                                                    style: AppStyle.txtSatoshiBold16
                                                     .copyWith(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.normal)
                                                   ),
                                                  ],
                                                 ),
                                                 SizedBox(width: 50),
                                                  iconData == FontAwesomeIcons.twitter ?
                                                     InkWell(
                                                          onTap: () =>
                                                          _launchURL(social.platformUrl),
                                                       child: Container(
                                                        width: 35.w, 
                                                        height: 35.h, 
                                                        color: Colors.transparent, 
                                                         child: Icon(iconData,
                                                          color: Colors.black,
                                                          size: 35.sp)),
                                                 ) : InkWell(
                                                    onTap: () =>
                                                          _launchURL(social.platformUrl),
                                                   child: CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgTwitter,
                                                            height: getSize(35),
                                                            width: getSize(35)),
                                                 ),
                                                 SizedBox(width:15),
                                                 Column(
                                                  children: [
                                                   Text(formatFollowers(socialname),
                                                    style: AppStyle.txtSatoshiBold16
                                                     .copyWith(fontSize: 17.sp),
                                                    ),
                                                   Text(
                                                    'followers',
                                                    style: AppStyle.txtSatoshiBold16
                                                     .copyWith(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.normal)
                                                   ),
                                                  ],
                                                 )
                                                  ]);
                                              }).toList() ??
                                              [
                                                IconButton(
                                                  icon: Icon(
                                                      FontAwesomeIcons.heart,
                                                      color: Colors.white,
                                                      size: 15),
                                                  onPressed: () {},
                                                )
                                              ],
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8.0
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: selectedInfluencer.socials
                                                  ?.take(3)
                                                  .map((social) {
                                                socialname =
                                                    social.followersCount;
                                                IconData iconData = socialIcons[
                                                        capitalizeFirstLetter(
                                                            social
                                                                .platformName)] ??
                                                    Icons.error;
                                                return Row(
                                                  children: [
                                                  iconData == FontAwesomeIcons.youtube ?
                                                     InkWell(
                                                          onTap: () =>
                                                          _launchURL(social.platformUrl),
                                                       child: Container(
                                                        width: 35.w, 
                                                        height: 35.h, 
                                                        color: Colors.transparent, 
                                                         child: Icon(iconData,
                                                          color: Colors.black,
                                                          size: 35.sp)),
                                                 ) : InkWell(
                                                    onTap: () =>
                                                          _launchURL(social.platformUrl),
                                                   child: CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgYoutube,
                                                            height: getSize(35),
                                                            width: getSize(35)),
                                                 ),
                                                 SizedBox(width:15),
                                                 Column(
                                                  children: [
                                                   Text(formatFollowers(socialname),
                                                    style: AppStyle.txtSatoshiBold16
                                                     .copyWith(fontSize: 17.sp),
                                                    ),
                                                   Text(
                                                    'followers',
                                                    style: AppStyle.txtSatoshiBold16
                                                     .copyWith(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.normal)
                                                   ),
                                                  ],
                                                 ),
                                                 SizedBox(width: 50),
                                                  iconData == FontAwesomeIcons.facebook ?
                                                     InkWell(
                                                          onTap: () =>
                                                          _launchURL(social.platformUrl),
                                                       child: Container(
                                                        width: 35.w, 
                                                        height: 35.h, 
                                                        color: Colors.transparent, 
                                                         child: Icon(iconData,
                                                          color: Colors.black,
                                                          size: 35.sp)),
                                                 ) : InkWell(
                                                    onTap: () =>
                                                          _launchURL(social.platformUrl),
                                                   child: CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgFacebook,
                                                            height: getSize(35),
                                                            width: getSize(35)),
                                                 ),
                                                 SizedBox(width:15),
                                                 Column(
                                                  children: [
                                                   Text(formatFollowers(socialname),
                                                    style: AppStyle.txtSatoshiBold16
                                                     .copyWith(fontSize: 17.sp),
                                                    ),
                                                   Text(
                                                    'followers',
                                                    style: AppStyle.txtSatoshiBold16
                                                     .copyWith(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.normal)
                                                   ),
                                                  ],
                                                 )
                                                  ]);
                                              }).toList() ??
                                              [
                                                IconButton(
                                                  icon: Icon(
                                                      FontAwesomeIcons.heart,
                                                      color: Colors.white,
                                                      size: 15),
                                                  onPressed: () {},
                                                )
                                              ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                           Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ColorConstant.whiteA70001,
                                      width: getHorizontalSize(1)),
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder17),
                              child: Container(
                                width: getHorizontalSize(370),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "Jobs Completed".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtH2Gray600,
                                        ),
                                      ),
                                      Text(
                                        "(${selectedInfluencer?.jobsDone})"
                                                      .tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiMedium
                                              .copyWith(
                                                  fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft7() {
    Get.back();
  }

  /* onTapChatCard(Influencer? selectedInfluencer, ChatData chatData) {
    Get.to(ChatsOpenedScreen(
      selectedInfluencer: selectedInfluencer,
      chatData: chatData,
    ));
  } */
}
