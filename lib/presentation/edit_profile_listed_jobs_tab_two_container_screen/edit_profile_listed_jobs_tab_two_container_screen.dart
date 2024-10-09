import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/creator_hireslist_page/creator_hireslist_page.dart';
import 'package:iynfluencer/presentation/creator_jobslist_page/creator_jobslist_page.dart';
import 'package:iynfluencer/presentation/creator_profile_draweritem/creator_profile_draweritem.dart';
import 'package:iynfluencer/presentation/creator_profile_listed_jobs_page/creator_profile_listed_jobs_page.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_two_container_screen/controller/edit_profile_listed_jobs_tab_two_container_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/controller/home_creator_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

import '../../data/general_controllers/user_controller.dart';

class EditProfileListedJobsTabTwoContainerScreen
    extends GetWidget<EditProfileListedJobsTabTwoContainerController> {
  const EditProfileListedJobsTabTwoContainerScreen({Key? key})
      : super(key: key);

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
    final country = args.userModelObj.value.country;
    final profileImageFile = args.userModelObj.value.avatar;

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
                          height: getVerticalSize(365),
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
                                              imagePath: ImageConstant.imgRectangle5059,
                                              height: getVerticalSize(170),
                                              width: getHorizontalSize(375),
                                              alignment: Alignment.center),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowleftGray200,
                                              height: getSize(30),
                                              width: getSize(30),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 15, top: 14),
                                              onTap: () {
                                                onTapImgArrowleft();
                                              })
                                        ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 20,right: 20),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              url: args.userModelObj.value.avatar,
                                              fit: BoxFit.cover,
                                              height: getSize(85),
                                              width: getSize(85),
                                              radius: BorderRadius.circular(
                                                  getSize(42.5)),
                                              margin: getMargin(left: 7)),
                                          Padding(
                                              padding: getPadding(top: 11),
                                              child: Text(name,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiBold24)),
                                          Padding(
                                              padding: getPadding(top: 1),
                                              child: Row(children: [
                                                Text(
                                                  country!,                                                 overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtSatoshiBold16.copyWith(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.normal
                                                    )),
                                                Card(
                                                    clipBehavior:
                                                    Clip.antiAlias,
                                                    elevation: 0,
                                                    margin: getMargin(
                                                        left: 10, bottom: 4),
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
                                              ])),
                                     Padding(
                                      padding: EdgeInsets.only(left:7),
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
                                      padding: getPadding(top: 10),
                                      child: Obx(() {
                                        if (controller.profileRx.value!= null) {
                                          return Text(
                                           // controller.profileRx.value!.data.bio
                                           truncateWithEllipsis(
                                            myString: controller.profileRx.value!.data.bio,
                                              textLength: 120,
                                            ),
                                           );  // Displaying profile bio
                                        } else {
                                          return CircularProgressIndicator();  // Show loading or placeholder
                                        }
                                      }),
                                    ),

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
                              labelColor: ColorConstant.cyan300,
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
                                    child: Text("lbl_listed_jobs".tr,
                                        overflow: TextOverflow.ellipsis)),
                                Tab(
                                    child: Text("Hired Jobs".tr,
                                        overflow: TextOverflow.ellipsis))
                              ])),
                      SizedBox(
                          height: getVerticalSize(882),
                          child: TabBarView(
                              controller: controller.tabviewController,
                              children: [
                               // CreatorProfileListedJobsPage(),
                               // CreatorProfileListedJobsPage()
                                CreatorJobslistPage(),
                                CreatorHireslistPage(),
                              ]))
                    ]))),
            bottomNavigationBar: CustomButton(
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
                })));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
    // String? capitalizeFirstLetter(String? text) {
    //   if (text == null || text.isEmpty) {
    //     return text;
    //   }
    //   return text[0].toUpperCase() + text.substring(1);
    // }
    //
    // final args = Get.arguments as EditProfileArguments;
    // final name =
    //     "${capitalizeFirstLetter(args.firstName)} ${capitalizeFirstLetter(args.lastName)}";
    // final profileImageFile = args.profileImage;
    // final controller =
    //     HomeCreatorController(Rx<HomeCreatorModel>(HomeCreatorModel()));

    Get.back();
  }

  /// Navigates to the editProfileDetailsScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the editProfileDetailsScreen.
  onTapEditprofile() {
    Get.toNamed(
      AppRoutes.editProfileDetailsScreen,
    );
  }
}