import 'package:iynfluencer/widgets/skeletons.dart';
import 'controller/search_creator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview_2.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

class SearchCreatorScreen extends GetWidget<SearchCreatorController> {
  final String? query;
  final List<Influencer>? trendingInfluencers;

  SearchCreatorScreen({Key? key, this.query, this.trendingInfluencers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

// Filter influencers based on the query
    final filteredInfluencers = trendingInfluencers?.where((influencer) {
          final fullName =
              "${capitalizeFirstLetter(influencer.user?.first.firstName)} ${capitalizeFirstLetter(influencer.user?.first.lastName)}";
          return fullName.toLowerCase().contains(query?.toLowerCase() ?? '');
        }).toList() ??
        [];

    String? getAvatarUrl(Influencer influencer) {
      final userId = influencer.user?.first.userId;
      if (userId != null && userId.isNotEmpty) {
        return "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-$userId-avatar.jpeg";
      } else {
        return 'https://cdn-icons-png.flaticon.com/512/6915/6915987.png';
      }
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(60),
                leadingWidth: 50,
                leading: AppbarImage(
                    height: getSize(30),
                    width: getSize(30),
                    svgPath: ImageConstant.imgArrowleftGray600,
                    margin: getMargin(left: 20, top: 15, bottom: 15),
                    onTap: () {
                      onTapArrowleft13();
                    }),
                title: AppbarSearchview2(
                  margin: getMargin(left: 9),
                  hintText: "lbl_search_creator".tr,
                  controller: controller.searchController,
                  initialQuery: query ?? "",
                ),
                styleType: Style.bgOutlineIndigo50),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 16, bottom: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 20, right: 22),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("lbl_recent".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiBold14Gray600),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgFrameGray60020x20,
                                        height: getSize(20),
                                        width: getSize(20))
                                  ]))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: getPadding(left: 20, top: 17),
                              child: SingleChildScrollView(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                    ListView.builder(
                                      itemCount: filteredInfluencers.length,
                                      itemBuilder: (context, index) {
                                        final influencer =
                                            filteredInfluencers[index];
                                        final avatarUrl =
                                            getAvatarUrl(influencer);
                                        final userId =
                                            influencer.user?.first.userId;
                                        return ListTile(
                                          title: Padding(
                                            padding: EdgeInsets.only(left: 6.w),
                                            child: Text(
                                              "${capitalizeFirstLetter(influencer.user?.first.firstName)} ${capitalizeFirstLetter(influencer.user?.first.lastName)}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSatoshiBold125
                                                  .copyWith(fontSize: 16.sp),
                                            ),
                                          ),
                                          leading: userId != null
                                              ? CustomImageView(
                                                  fit: BoxFit.cover,
                                                  url: avatarUrl ??
                                                      ImageConstant
                                                          .imgRectangle5055,
                                                  height: getSize(90),
                                                  width: getSize(90),
                                                  radius:
                                                      BorderRadius.circular(45),
                                                )
                                              : TrendinghorizonItemSkeletonWidget(), // Replace with your actual skeleton widget
                                        );
                                      },
                                    ),
                                  ])))),
                      Padding(
                          padding: getPadding(left: 20, top: 39),
                          child: Text("msg_frequent_searches".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold14Gray600)),
                      Padding(
                          padding: getPadding(left: 20, top: 14),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSearchGray600,
                                height: getSize(13),
                                width: getSize(13),
                                margin: getMargin(bottom: 4)),
                            Padding(
                                padding: getPadding(left: 8),
                                child: Text("msg_influencer_with".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13))
                          ])),
                      Padding(
                          padding: getPadding(left: 20, top: 16),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSearchGray600,
                                height: getSize(13),
                                width: getSize(13),
                                margin: getMargin(top: 2, bottom: 2)),
                            Padding(
                                padding: getPadding(left: 8),
                                child: Text("msg_intermediate_influencers".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13))
                          ])),
                      Padding(
                          padding: getPadding(left: 20, top: 19),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSearchGray600,
                                height: getSize(13),
                                width: getSize(13),
                                margin: getMargin(bottom: 4)),
                            Padding(
                                padding: getPadding(left: 8),
                                child: Text("lbl_top_influencers".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13))
                          ])),
                      Padding(
                          padding: getPadding(left: 20, top: 16, bottom: 5),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSearchGray600,
                                height: getSize(13),
                                width: getSize(13),
                                margin: getMargin(top: 2, bottom: 2)),
                            Padding(
                                padding: getPadding(left: 8),
                                child: Text("msg_india_influencers".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13))
                          ]))
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft13() {
    Get.back();
  }
}
