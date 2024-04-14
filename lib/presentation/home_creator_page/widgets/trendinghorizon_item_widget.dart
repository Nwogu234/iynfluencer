import 'dart:math';

import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/Influencer/influencer_response_model.dart';
import '../../influencer_profile_about_page/influencer_profile_about_page.dart';
import '../controller/home_creator_controller.dart';
import '../models/trendinghorizon_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendinghorizonItemWidget extends StatelessWidget {
  final Influencer trendinghorizonItem;
  final controller = Get.find<HomeCreatorController>();

  TrendinghorizonItemWidget(this.trendinghorizonItem, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String countryCode = controller.user.getCountryCode(controller.user
        .capitalizeFirstLetter(trendinghorizonItem.user!.first.country!));
    print(countryCode);
    int socialname = 0;

    String? avatarUrl = trendinghorizonItem.user?.first.avatar;
    // 'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${trendinghorizonItem.userId}-avatar.jpeg';
    String imageProvider;
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
      if (await canLaunch(url)) {
        await launch(url);
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

    print(avatarUrl);
    String CountryCode = controller.user.getCountryCode(controller.user
        .capitalizeFirstLetter(trendinghorizonItem.user?.first.country));

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = "${controller.user.baseUrl}$avatarUrl";
    } else {
      imageProvider = 'https://cdn-icons-png.flaticon.com/512/6915/6915987.png';
    }

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }
    onTapprofilecard(Influencer listrectangle50) {
      Get.to(
        InfluencerProfileAboutPage(selectedInfluencer: listrectangle50),
      );
    }
    return GestureDetector(
      onTap: (){
        onTapprofilecard(trendinghorizonItem);
      },
      child: Container(
        // height: getVerticalSize(px),
         width: 180.w,
        decoration: BoxDecoration(
            color: ColorConstant.trndingblue.withOpacity(0.89),
            borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Padding(
          padding: getPadding(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: CustomImageView(
                        url: imageProvider,
                        fit: BoxFit.cover,
                        height: getSize(
                          60,
                        ),
                        width: getSize(
                          60,
                        ),
                        radius: BorderRadius.circular(
                          getSize(
                            25.0,
                          ),
                        ),
                      ),
                    ),
                    Text(

                      "${capitalizeFirstLetter(trendinghorizonItem.user?.first.firstName)} ${capitalizeFirstLetter(trendinghorizonItem.user?.first.lastName)}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold16,
                      softWrap: false,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CountryFlag.fromCountryCode(
                            countryCode,
                            height: 15,
                            width: 15,
                          ),
                          Padding(
                            padding: getPadding(
                              left: 6,
                            ),
                            child: Text(
                              "${controller.user.capitalizeFirstLetter(trendinghorizonItem.user?.first.country)}"
                                  .tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16
                                  .copyWith(
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: trendinghorizonItem.niche
                      ?.take(1)
                      .map((social) {
                    return Container(
                      width: 155.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.txtRoundedBorder6,
                        color: ColorConstant.pink,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      // Ribbon color
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 5,
                            color: Colors.white,
                          ),
                          Container(
                            width: 120.w,
                            child: Text(
                              '$social Influencer',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp, // Adjust font size according to your design
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList() ??
                      [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.heart,
                              color: Colors.white, size: 15),
                          onPressed: () {},
                        )
                      ], // Provide a default widget in case of null or empty list
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 10, right: 17),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: trendinghorizonItem.socials
                          ?.take(3)
                          .map((social) {
                        socialname = social.followersCount;
                        IconData iconData = socialIcons[
                                capitalizeFirstLetter(
                                    social.platformName)] ??
                            Icons.error;
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA700,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,// Keeps everything tightly together
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        _launchURL(social.platformUrl),
                                    child: Container(
                                      width: 20
                                          .w, // Exact width of the touchable area
                                      height: 20
                                          .h, // Exact height of the touchable area
                                      color: Colors
                                          .transparent, // Optional: makes it easier to see the touch area during development
                                      child: Icon(iconData,
                                          color: Colors.black,
                                          size: 15
                                              .sp), // Your icon with controlled size
                                    ),
                                  ),
                                  Text(formatFollowers(socialname),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black)),
                                  Text('followers',
                                      style: TextStyle(
                                          fontSize: 8.sp,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList() ??
                      [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.heart,
                              color: Colors.white, size: 15),
                          onPressed: () {},
                        )
                      ], // Provide a default widget in case of null or empty list
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
