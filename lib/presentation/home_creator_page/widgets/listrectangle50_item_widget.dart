import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/controller/influencer_profile_comm_post_tab_container_controller.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/influencer_profile_comm_post_tab_container_screen.dart';

import '../../../data/models/Influencer/influencer_response_model.dart';
import '../controller/home_creator_controller.dart';
import '../models/listrectangle50_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listrectangle50ItemWidget extends StatelessWidget {
  Listrectangle50ItemWidget(
      this.listrectangle50, {
        Key? key,
      }) : super(
    key: key,
  );

  Influencer listrectangle50;

  var controller = Get.find<HomeCreatorController>();

  onTapprofilecard(Influencer listrectangle50) {
    final influencerProfileCommPostTabContainerController =
    Get.put(InfluencerProfileCommPostTabContainerController());
    influencerProfileCommPostTabContainerController
        .setSelectedInfluencer(listrectangle50);

    Get.to(
      InfluencerProfileCommPostTabContainerScreen(
          listrectangle50: listrectangle50),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? avatarUrl =
        "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${listrectangle50.userId}-avatar.jpeg";
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
        onTapprofilecard(listrectangle50);
      },
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          decoration: AppDecoration.outlineIndigo50.copyWith(
            // image: DecorationImage(
            //   image: AssetImage(ImageConstant.infbkgrd),
            //   fit: BoxFit.cover,  // Optional, but commonly used to define how the image should fill the space
            // ),
            color: Color(0xFFFDE9ED),
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getVerticalSize(
                  267,
                ),
                width: getHorizontalSize(
                  335,
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(
                      child: Padding(
                        padding: getPadding(top: 35),
                        child: Container(
                          height: getVerticalSize(210), // Set the height of the container
                          width: getHorizontalSize(210),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.cyan300.withOpacity(0.5), // Pink glow effect
                                spreadRadius: 3,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: CustomImageView(
                              fit: BoxFit.cover,
                              url: imageProvider,
                              height: getVerticalSize(
                                200,
                              ),
                              width: getHorizontalSize(
                                180,
                              ),
                              radius: BorderRadius.circular(360),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: getHorizontalSize(
                          67,
                        ),
                        margin: getMargin(
                          top: 13,
                          right: 10,
                        ),
                        padding: getPadding(
                          left: 8,
                          top: 1,
                          right: 8,
                          bottom: 1,
                        ),
                        decoration: AppDecoration.txtFillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.txtCircleBorder11,
                        ),
                        child: Text(
                          "lbl_top_rated".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold115,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 13,
                    right: 19,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${capitalizeFirstLetter(listrectangle50.user?.first.firstName)} ${capitalizeFirstLetter(listrectangle50.user?.first.lastName)}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold16,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 12,
                          top: 1,
                          bottom: 2,
                        ),
                        child: Text(
                          "${listrectangle50.user?.first.country}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13,
                        ),
                      ),
                      Spacer(),
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
              ),
              Padding(
                padding: getPadding(
                  left: 14,
                  top: 5,
                  bottom: 18,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgFrameBlueGray400,
                      height: getSize(
                        15,
                      ),
                      width: getSize(
                        15,
                      ),
                      margin: getMargin(
                        bottom: 3,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 8,
                      ),
                      child: Text(
                        "${listrectangle50.jobsDone.toString()} jobs completed",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight135,
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
