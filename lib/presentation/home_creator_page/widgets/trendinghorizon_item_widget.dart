import 'dart:math';

import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

import '../../../data/models/Influencer/influencer_response_model.dart';
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

    String? avatarUrl =   trendinghorizonItem.user?.first.avatar;
   // 'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${trendinghorizonItem.userId}-avatar.jpeg';
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

    return SafeArea(
      child: Container(
        height: 600,
        width: 310,
        decoration: BoxDecoration(
          color: ColorConstant.blue1000,
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right:40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                         alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle
                          ),
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
                      ),
                      Padding(
                        padding: getPadding(
                          left: 25,
                          top: 6,
                          bottom: 3,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${capitalizeFirstLetter(trendinghorizonItem.user?.first.firstName)} ${capitalizeFirstLetter(trendinghorizonItem.user?.first.lastName)}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16,
      
                            ),
                            Padding(
                              padding: getPadding(
                                top: 1,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgFrameGray60015x15,
                                    height: getSize(
                                      15,
                                    ),
                                    width: getSize(
                                      15,
                                    ),
                                    margin: getMargin(
                                      bottom: 4,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 6,
                                    ),
                                    child: Text(
                                        "${capitalizeFirstLetter(trendinghorizonItem.user?.first.country)}",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold16.copyWith(
                                        fontWeight: FontWeight.normal
                                      ),
      
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 27,
                    bottom: 11,
                    left:28,
                    right: 17
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(top: 2, left: 20, bottom: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Jobs Completed".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight135Gray600,
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 2,
                                  ),
                                  child: Text(
                                     "${trendinghorizonItem.jobsDone.toString()} jobs completed"
                                          .tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:1, right:20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Rating".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight135Gray600,
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 2,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                 CustomImageView(
                                      svgPath: ImageConstant.imgFrameAmber500,
                                      height: getSize(
                                         18,
                                    ),
                                     width: getSize(
                                       18,
                                     ),
                                  margin: getMargin(
                                    bottom: 4,
                                     ),
                                   ),
                           Padding(
                        padding: getPadding(
                          left: 6,
                          bottom: 3,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "lbl_3_52".tr,
                                style: TextStyle(
                                  color: ColorConstant.gray900,
                                  fontSize: getFontSize(
                                    13.5,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: ColorConstant.blueGray400,
                                  fontSize: getFontSize(
                                    13.5,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                               ],
                              ),
                                textAlign: TextAlign.left,
                               ),
                                  ),
      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

