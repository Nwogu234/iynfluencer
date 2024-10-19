import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/creator_hireslist_page/models/creator_hireslist_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';

import '../../data/general_controllers/user_controller.dart';
import '../creator_hireslist_tab_container_page/controller/creator_hireslist_tab_container_controller.dart';
import '../creator_hireslist_tab_container_page/models/creator_hireslist_tab_container_model.dart';
import '../home_creator_page/controller/home_creator_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore_for_file: must_be_immutable
class CreatorProfileDraweritem extends StatelessWidget {


  HomeCreatorController controller = Get.put(HomeCreatorController(HomeCreatorModel().obs));
  final tabcontroller = Get.put(CreatorHireslistTabContainerController(CreatorHireslistTabContainerModel().obs));
  final bomcnt = Get.put(BottomBarController());
  final storage = new FlutterSecureStorage();
  
  String capitalize(String text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
     String? avatarUrl = controller.user.userModelObj.value.avatar;
    String imageProvider;

    print(avatarUrl);

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = 'https://cdn-icons-png.flaticon.com/512/6915/6915987.png';
    }
    return Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color:Colors.white
              ),
              //  margin: EdgeInsets.only(right: 20.w),
                padding: EdgeInsets.only(left: 19.w, top: 74.h, right: 19.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        fit: BoxFit.cover,
                          url: imageProvider,
                          height: getSize(50),
                          width: getSize(50),
                          radius: BorderRadius.circular(24.r),
                          onTap: () {
                            onTapImgFrame901();
                          }),
                      Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                              "${capitalize(controller.user.userModelObj.value.firstName)} ${capitalize(controller.user.userModelObj.value.lastName)}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16)),
                      Padding(
                          padding: EdgeInsets.only(left: 1.w),
                          child: Text(
                              "@${controller.user.userModelObj.value.firstName}"
                                  .tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight125Gray600ab)),
                      Padding(
                          padding: EdgeInsets.only(top: 27.h),
                          child: Divider(
                              height: 1.h,
                              thickness: 1.h,
                              color: ColorConstant.blueGray10001,
                              indent: 1.w)),
                      Padding(
                          padding: EdgeInsets.only(left: 1.w, top: 27.h),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgBookmarkBlueGray400,
                                height: 24.h,
                                width: 24.w),
                            GestureDetector(
                              onTap: (){
                                onTapMenutab01();
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(left: 14.w, top: 1.h),
                                  child: Text("Transactions".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtH2Gray900)),
                            )
                          ])),
                      GestureDetector(
                          onTap: () {
                            onTapMenutab03();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 1.w, top: 20.h, right: 8.w),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath:
                                        ImageConstant.imgFrameBlueGray40024x24,
                                    height: 24.h,
                                    width: 24.w),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 14.w, top: 1.h),
                                    child: Text("lbl_notifications".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtH2Gray900)),
                                Spacer(),
                                Container(
                                    width: 20.w,
                                    margin:
                                        EdgeInsets.only(top: 3.h, bottom: 1.h),
                                    padding: EdgeInsets.only(
                                        left: 4.w,
                                        top: 1.h,
                                        right: 4.w,
                                        bottom: 1.h),
                                    decoration: AppDecoration.txtFillRed500
                                        .copyWith(
                                            borderRadius:
                                                BorderRadius.circular(11.r)),
                                    child: Text("lbl_9".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiLight1273))
                              ]))),
                      Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Divider(
                              height: 1.h,
                              thickness: 1.h,
                              color: ColorConstant.blueGray10001,
                              indent: 1.w)),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.settingsScreen,
                              arguments: EditProfileArguments(controller.user.userModelObj.value.firstName,
                                  controller.user.userModelObj.value.lastName,
                                  controller.user.userModelObj.value.country??'', controller.user.userModelObj.value.avatar, "No bio passing yet"));
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 1.w, top: 24.h),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgSettings,
                                  height: 24.h,
                                  width: 24.w),
                              Padding(
                                  padding: EdgeInsets.only(left: 14.w, top: 2.h),
                                  child: Text("lbl_settings".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtH2Gray900))
                            ])),
                      ),
                     /*  Padding(
                          padding: EdgeInsets.only(left: 1.w, top: 19.h),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgFrame4,
                                height: 24.h,
                                width: 24.w),
                            Padding(
                                padding: EdgeInsets.only(left: 14.w, top: 2.h),
                                child: Text("lbl_help_centre".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray900))
                          ])), */
                      CustomButton(
                          height: 46.h,
                          text: "msg_become_an_influencer".tr,
                          margin: EdgeInsets.only(left: 1.w, top: 23.h),
                          variant: ButtonVariant.FillCyan3005e,
                          padding: ButtonPadding.PaddingT13,
                          fontStyle: ButtonFontStyle.SatoshiBold13,
                          suffixWidget: Container(
                              height: 70.h,
                              width: 35.w,
                              padding: EdgeInsets.all(3.5.r),
                              margin: EdgeInsets.only(left: 25.w),
                              decoration: BoxDecoration(
                                  color: ColorConstant.cyan300,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: CustomImageView(
                                  height: 20.h,
                                  width: 15.w,
                                  svgPath:
                                      ImageConstant.imgFrameWhiteA70014x14)),
                          onTap: () {
                            onTapBecomean();
                          }),
                      Padding(
                          padding: EdgeInsets.only(top: 29.h),
                          child: Divider(
                              height: 1.h,
                              thickness: 1.h,
                              color: ColorConstant.blueGray10001)),
                      GestureDetector(
                        onTap: () {
                          storage.write(key: 'token', value: null);
                          storage.write(key: 'activeProfile', value: null);
                          Get.offAllNamed(AppRoutes.logInScreen);
                        },
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 1.w, top: 22.h, bottom: 121.h),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgQuestion,
                                  height: 24.h,
                                  width: 24.w),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 14.w, top: 2.h),
                                  child: Text("lbl_sign_out".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtH2Gray600))
                            ])),
                      )
                    ]))));
  }

  onTapImgFrame901() {
    Get.toNamed(
      AppRoutes.editProfileListedJobsTabTwoContainerScreen,
    );
  }

  onTapMenutab03() {
    Get.toNamed(
      AppRoutes.notificationFirestore,
    );
  }

  onTapMenutab01() {
    Get.toNamed(
      AppRoutes.transactionScreen,
    );
  }

  onTapBecomean() {
    if (controller.user.userModelObj.value.influencerId != null) {
      storage.write(key: "activeProfile", value: "Influencer");
      Get.delete<CreatorHireslistTabContainerController>();
      Get.delete<TabController>();
      Get.offAllNamed(
        AppRoutes.influencerTabScreen,
      );
    } else {
      Get.offAllNamed(
        AppRoutes.completeProfileInfluencerScreen,
      );
    }
  }
}
