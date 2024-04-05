import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
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

   Get.to(
      InfluencerProfileAboutPage(
          selectedInfluencer: listrectangle50),
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
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [
            FittedBox(
              child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 30
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle
                            ),
                          child: CustomImageView(
                            url: imageProvider,
                            fit: BoxFit.cover,
                            height: getSize(60),
                            width: getSize(60),
                            radius: BorderRadius.circular(getSize(25.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Padding(
                      padding: getPadding(
                       right: 50,
                        top: 6,
                        bottom: 3,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${capitalizeFirstLetter(listrectangle50.user?.first.firstName)} ${capitalizeFirstLetter(listrectangle50.user?.first.lastName)}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold16,
                          ),
                          
                          Padding(
                            padding: getPadding(
                              bottom: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    bottom: 4,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                  ),
                                  child: Text(
                                      "${listrectangle50.jobsDone.toString()} jobs completed"
                                          .tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold16.copyWith(
                                          fontWeight: FontWeight.normal)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                     Align(
                        alignment: Alignment.centerRight,
                      child: CustomImageView(
                         svgPath: ImageConstant.imgFrameDustbin,
                         height: getSize(
                               18,
                            ),
                          width: getSize(
                             18,
                             ),
                           margin: getMargin(
                              bottom: 2,
                          ),
                          ),
                       ),
                    ]
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("${listrectangle50.bio}",
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold16
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600)),
            ),
            CustomButtonOne(
                height: getVerticalSize(50),
                text: "Message".tr,
                margin: getMargin(top: 17),
                padding: ButtonPaddings.PaddingAll156,
                onTap: () {
                  ChatsOpenedScreen();
                }),   
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    thickness: 1.2,
                  ))           
          ]),
        ),
      ),
    );
  }
}
