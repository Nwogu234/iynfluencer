import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_container_screen/controller/edit_profile_listed_jobs_tab_container_controller.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_two_container_screen/controller/edit_profile_listed_jobs_tab_two_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/creator_profile_listed_jobs_page/creator_profile_listed_jobs_page.dart';
import 'package:iynfluencer/presentation/influencer_drawer_item/influencer_drawer.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/controller/influencer_home_controller.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class EditProfileListedJobsTabContainerScreen
    extends GetWidget<EditProfileListedJobsTabContainerController> {
  const EditProfileListedJobsTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    final args = Get.put(UserController());
    final name =
        "${capitalizeFirstLetter(args.userModelObj.value.firstName)} ${capitalizeFirstLetter(args.userModelObj.value.lastName)}";
    final country = capitalizeFirstLetter(args.userModelObj.value.country);

   final profileImageFile = "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${args.userModelObj.value.userId}-avatar.jpeg";

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      SizedBox(
                          height: getVerticalSize(410),
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                    height: getVerticalSize(170),
                                    width: double.maxFinite,
                                    child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgRectangle5059,
                                              height: getVerticalSize(170),
                                              width: getHorizontalSize(375),
                                              alignment: Alignment.center),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: CustomAppBar(
                                         height: getVerticalSize(44),
                                         leadingWidth: 45,
                                         leading: AppbarImage(
                                          height: getSize(30),
                                         width: getSize(30),
                                       svgPath: ImageConstant
                                                 .imgArrowleftGray200,
                                       margin: getMargin(left: 15),
                                        onTap: () {
                                        onTapImgArrowleft();
                                         }),
                                     actions: [
                                       AppbarImage(
                                          height: getVerticalSize(26),
                                          width: getHorizontalSize(60),
                                          svgPath:ImageConstant.imgComputer,
                                          margin: getMargin(
                                                    left: 16,
                                                    right: 16,
                                                     bottom: 4
                                                     ),
                                          onTap: () {},
                                             )
                                            ]),
                                  ),

                                        ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 20),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle
                                              ),
                                            child: CustomImageView(
                                                url: profileImageFile,
                                                fit: BoxFit.cover,
                                                height: getSize(85),
                                                width: getSize(85),
                                                radius: BorderRadius.circular(
                                                    getSize(42.5)),
                                                margin: getMargin(left: 7)),
                                          ),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: SizedBox(
                                                width: double.maxFinite,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                        name, 
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle
                                                            .txtSatoshiBold24),
                                                
                                                   Padding(
                                                     padding: const EdgeInsets.only(
                                                      bottom: 4,
                                                      right: 16
                                                     ),
                                                     child: CustomButton(
                                                      height: getVerticalSize(34),
                                                      width: getHorizontalSize(110),
                                                      text: "Message".tr,
                                                      margin: getMargin(top: 13),
                                                      variant:
                                                        ButtonVariant.FillGray200ab,
                                                      padding:
                                                        ButtonPadding.PaddingAll4,
                                                      fontStyle: ButtonFontStyle
                                                         .SatoshiBold15Gray900,
                                                      onTap: () {
                                                        onTapEditprofile();
                                                     }),
                                                   ) 
                                                
                                                  ],
                                                ),
                                              )),
                                          Row(
                                            children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left:6),
                                              child: Text(
                                                  country!, 
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtSatoshiBold16.copyWith(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.normal)
                                                ),
                                            ),
                                            Card(
                                                clipBehavior:
                                                    Clip.antiAlias,
                                                elevation: 0,
                                                margin: getMargin(
                                                    left: 10),
                                                color:
                                                    ColorConstant.gray20001,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .circleBorder7),
                                                child: Container(
                                                    height: getSize(14),
                                                    width: getSize(14),
                                                    decoration: AppDecoration
                                                        .fillGray20001
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .circleBorder7),
                                                    child: Stack(children: [
                                                      CustomImageView(
                                                          svgPath:
                                                              ImageConstant
                                                                  .imgContrast,
                                                          height:
                                                              getVerticalSize(
                                                                  13),
                                                          width:
                                                              getHorizontalSize(
                                                                  14),
                                                          alignment:
                                                              Alignment
                                                                  .center)
                                                    ])))
                                          ]),

                                    Padding(
                                      padding: EdgeInsets.only(left:6),
                                      child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(top:4),
                                           child: CustomImageView(
                                            svgPath: ImageConstant.imgFrameBlueGray400,
                                            height: getSize(
                                             14,
                                            ),
                                            width: getSize(
                                             14,
                                             ),
                                            margin: getMargin(
                                             bottom: 4,
                                            ),
                                           ),
                                         ),
                                         Padding(
                                         padding: getPadding(
                                          left: 4,
                                         ),
                                          child: Text(
                                           " 0 jobs completed"
                                            .tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16.copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15
                                            )),
                                       ),
                                       ],
                                     ),
                                    ),
                                     Padding(
                                       padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 7
                                       ),
                                       child: Text(
                                        'Member Since ${timeago.format(args.userModelObj.value.createdAt)}',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiBold16.copyWith(
                                          fontWeight: FontWeight.w600)                                
                                         ),
                                     ), 
                                          CustomButton(
                                              height: getVerticalSize(34),
                                              width: getHorizontalSize(110),
                                              text: "lbl_edit_profile".tr,
                                              margin: getMargin(top: 13),
                                              variant:
                                                  ButtonVariant.FillGray200ab,
                                              padding:
                                                  ButtonPadding.PaddingAll4,
                                              fontStyle: ButtonFontStyle
                                                  .SatoshiBold15Gray900,
                                              onTap: () {
                                                onTapEditprofile();
                                              })
                                        ])))
                          ])),
                      Container(
                          height: getVerticalSize(44),
                          width: double.maxFinite,
                          margin: getMargin(top: 11),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorConstant.indigo50,
                                      width: getHorizontalSize(1)))),
                          child: TabBar(
                              controller: controller.tabviewController,
                              labelColor: ColorConstant.cyan100,
                              labelStyle: TextStyle(
                                  fontSize: getFontSize(14.5),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300),
                              unselectedLabelColor: ColorConstant.gray600,
                              unselectedLabelStyle: TextStyle(
                                  fontSize: getFontSize(14),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300),
                              indicator: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: ColorConstant.cyan300,
                                          width: getHorizontalSize(2)))),
                              tabs: [
                                Tab(
                                    child: Text(
                                      "lbl_listed_jobs".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16.copyWith(
                                        fontSize: 16.sp,
                                       fontWeight: FontWeight.normal
                                        ))),
                                Tab(
                                    child: Text("lbl_community_posts".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSatoshiBold16.copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.normal
                                        ))),
                                Tab(
                                    child: Text("Review".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSatoshiBold16.copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.normal
                                        )))
                              ])),
                      SizedBox(
                          height: getVerticalSize(882),
                          child: TabBarView(
                              controller: controller.tabviewController,
                              children: [
                                CreatorProfileListedJobsPage(),
                                CreatorProfileListedJobsPage(),
                                CreatorProfileListedJobsPage()
                              ]))
                    ]))),
            ));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
   Get.back(); 
  }

  /// Navigates to the editProfileDetailsScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the editProfileDetailsScreen.
  onTapEditprofile() {
    Get.toNamed(
      AppRoutes.editProfileDetailsOneScreen,
    );
  }
}