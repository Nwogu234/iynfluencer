import 'package:country_flags/country_flags.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

import '../controller/search_influncers_controller.dart';
import '../models/trending_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class TrendingItemWidget extends StatelessWidget {
  TrendingItemWidget(
    this.trendingItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Influencer trendingItemModelObj;

  var controller = Get.find<SearchInfluncersController>();

  @override
  Widget build(BuildContext context) {
    String countryCode = controller.user.getCountryCode(controller.user
        .capitalizeFirstLetter(trendingItemModelObj.user!.first.country!));
    print(countryCode);
    String? avatarUrl = trendingItemModelObj.user?.first.avatar;
    //   "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${trendingItemModelObj.userId}-avatar.jpeg";
    String imageProvider;

    print(avatarUrl);


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

    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: getPadding(
            right: 13,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                    getHorizontalSize(
                      27,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 5,
                ),
                child: Row(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: EdgeInsets.symmetric(vertical: 1),
                      color: ColorConstant.gray20001,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: CountryFlag.fromCountryCode(
                        countryCode,
                        height: getVerticalSize(14),
                        width: getHorizontalSize(14),
                        borderRadius: 10,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                        padding: getPadding(left: 5),
                        child: Text(
                         "${capitalizeFirstLetter(trendingItemModelObj.user?.first.firstName)} ${capitalizeFirstLetter(trendingItemModelObj.user?.first.lastName)}".length > 10
                            ? "${capitalizeFirstLetter(trendingItemModelObj.user?.first.firstName)} ${capitalizeFirstLetter(trendingItemModelObj.user?.first.lastName)}".substring(0, 7) + "..."
                            : "${capitalizeFirstLetter(trendingItemModelObj.user?.first.firstName)} ${capitalizeFirstLetter(trendingItemModelObj.user?.first.lastName)}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold16
                              .copyWith(fontSize: getFontSize(12)),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
