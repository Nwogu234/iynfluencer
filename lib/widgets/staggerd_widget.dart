import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../data/models/Influencer/influencer_response_model.dart';
import '../presentation/home_creator_page/controller/home_creator_controller.dart';
import '../presentation/influencer_profile_about_page/influencer_profile_about_page.dart';
import '../theme/app_decoration.dart';
import '../theme/app_style.dart';
import 'custom_image_view.dart';

class StaggeredWidget extends StatelessWidget {
  final Influencer user;
  final ChatData? chatData;
  final controller = Get.find<HomeCreatorController>();

  StaggeredWidget({
    required this.user,
    this.chatData,
  });

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
  Widget build(BuildContext context) {
    String CountryCode = controller.user.getCountryCode(
        controller.user.capitalizeFirstLetter(user.user?.first.country));
    onTapprofilecard(Influencer listrectangle50) {
      Get.to(
        InfluencerProfileAboutPage(
          selectedInfluencer: listrectangle50,
          chatData: chatData ?? chatsData,
        ),
      );
    }

    return Stack(children: [
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: InkWell(
          onTap: () {
            onTapprofilecard(user);
          }, // Placeholder for card tap functionality
          child: Container(
            height: 198.h,
            width: 160.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(user.user?.first.avatar ??
                    'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: getPadding(left: 5, right: 5, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${capitalizeFirstLetter(user.user?.first.firstName)}',
                            style: TextStyle(
                              fontSize: getSize(10.sp),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.circle,
                            size: 5,
                            color: Colors.white,
                          ),
                          SizedBox(width: 2),
                          CountryFlag.fromCountryCode(
                            CountryCode,
                            height: 10,
                            width: 10,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            '${capitalizeFirstLetter(user.user?.first.country)}',
                            style: TextStyle(
                                fontSize: getSize(7.sp), color: Colors.white),
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(bottom: 5),
                            child: Text(
                              "${user.jobsDone.toString()} Jobs Completed".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiMedium.copyWith(
                                  fontSize: getSize(8.sp), color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: getPadding(bottom: 5),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                SizedBox(width: 2),
                                Text(
                                  '3.5',
                                  style: AppStyle.txtSatoshiMedium.copyWith(
                                      fontSize: getSize(8.sp),
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 12,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        right: 100.w,
        top: 15,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusStyle.txtRoundedBorder6,
            color: ColorConstant.pink,
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          // Ribbon color
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 5,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'FEATURED',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 7.sp, // Adjust font size according to your design
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  String capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return '';
    }
    return text.split(' ').map((word) {
      if (word.isEmpty) {
        return '';
      }
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }
}

class ResponsiveEmptyWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final String buttonText;
  final bool fullPage;

  ResponsiveEmptyWidget({
    required this.buttonText,
    required this.errorMessage,
    required this.onRetry,
    this.fullPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullPage
          ? 1.sw
          : 0.8.sw, // 100% of screen width if fullPage, else 80%
      height: fullPage
          ? 1.sh
          : 0.3.sh, // 100% of screen height if fullPage, else 30%
      color: Colors.red.withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp), // Responsive font size
            ),
            SizedBox(height: 20.h), // Responsive height
            ElevatedButton(
              onPressed: onRetry,
              child: Text(buttonText,
                  style: TextStyle(fontSize: 14.sp)), // Responsive font size
            ),
          ],
        ),
      ),
    );
  }
}
