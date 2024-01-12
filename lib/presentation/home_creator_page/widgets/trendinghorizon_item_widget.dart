import 'dart:math';

import 'package:country_flags/country_flags.dart';

import '../../../data/models/Influencer/influencer_response_model.dart';
import '../controller/home_creator_controller.dart';
import '../models/trendinghorizon_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendinghorizonItemWidget extends StatelessWidget {
  final Influencer trendinghorizonItem;
  final controller = Get.find<HomeCreatorController>();


  TrendinghorizonItemWidget(this.trendinghorizonItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String countryCode = controller.user.getCountryCode(controller.user.capitalizeFirstLetter(trendinghorizonItem.user!.first.country!));
    print(countryCode);
    String? avatarUrl =
        trendinghorizonItem.user?.first.avatar;
        // "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${trendinghorizonItem.userId}-avatar.jpeg";
    String imageProvider;

    print (avatarUrl);
    if (avatarUrl!.isNotEmpty) {

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
          padding: EdgeInsets.only(right: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                fit: BoxFit.cover,
                url: imageProvider,
                height: getSize(70),
                width: getSize(70),
                radius: BorderRadius.circular(45),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Padding(
                      padding: getPadding(left: 6),
                      child: Text(
                        "${capitalizeFirstLetter(trendinghorizonItem.user?.first.firstName)} ${capitalizeFirstLetter(trendinghorizonItem.user?.first.lastName)}".length > 10
                            ? "${capitalizeFirstLetter(trendinghorizonItem.user?.first.firstName)} ${capitalizeFirstLetter(trendinghorizonItem.user?.first.lastName)}".substring(0, 7) + "..."
                            : "${capitalizeFirstLetter(trendinghorizonItem.user?.first.firstName)} ${capitalizeFirstLetter(trendinghorizonItem.user?.first.lastName)}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold16B.copyWith(fontSize: getFontSize(12)),
                      ),
                    )
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
