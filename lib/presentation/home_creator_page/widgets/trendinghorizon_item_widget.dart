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
        "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${trendinghorizonItem.userId}-avatar.jpeg";
    ImageProvider imageProvider;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = NetworkImage(avatarUrl);
    } else {
      imageProvider = NetworkImage('https://cdn-icons-png.flaticon.com/512/6915/6915987.png');
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
                url: avatarUrl ?? ImageConstant.imgRectangle5055,
                height: getSize(90),
                width: getSize(90),
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
                      child: Container(
                        height: 14.h,
                        width: 14.w,
                        decoration: AppDecoration.fillGray20001.copyWith(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Stack(
                          children: [
                            CountryFlag.fromCountryCode(
                              countryCode,
                              height: 48,
                              width: 62,
                              borderRadius: 8,
                            ),
                            // Icon(
                            //   Icons.local_fire_department_rounded,
                            //   size: 14.sp,
                            //   color: Colors.deepOrange,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: Text(
                        "${capitalizeFirstLetter(trendinghorizonItem.user?.first.firstName)} ${capitalizeFirstLetter(trendinghorizonItem.user?.first.lastName)}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold125.copyWith(fontSize: 16.sp),
                      ),
                    ),
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
