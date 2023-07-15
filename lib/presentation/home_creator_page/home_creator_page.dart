import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_circleimage.dart';
import '../../widgets/app_bar/appbar_searchview.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import '../creator_profile_draweritem/controller/creator_profile_controller.dart';
import '../creator_profile_draweritem/creator_profile_draweritem.dart';
import '../home_creator_page/widgets/listrectangle50_item_widget.dart';
import '../home_creator_page/widgets/trendinghorizon_item_widget.dart';
import 'controller/home_creator_controller.dart';
import 'models/home_creator_model.dart';
import 'models/listrectangle50_item_model.dart';
import 'models/trendinghorizon_item_model.dart';

class HomeCreatorPage extends StatelessWidget {
  HomeCreatorPage({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeCreatorController controller =
  Get.put(HomeCreatorController(HomeCreatorModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: ColorConstant.whiteA700,
            drawer: CreatorProfileDraweritem(CreatorProfileController()),
            appBar: CustomAppBar(
                height: 63.h,
                leadingWidth: 55.w,
                leading: AppbarCircleimage(
                    imagePath: ImageConstant.imgGroup899,
                    margin: EdgeInsets.only(left: 20.w, top: 14.h, bottom: 14.h),
                    onTap: () {
                      openDrawer();
                    }),
                title: AppbarSearchview(
                    margin: EdgeInsets.only(left: 14.w),
                    hintText: "msg_search_influncers".tr,
                    controller: controller.searchController),
                styleType: Style.bgOutlineIndigo50),
            body: Container(
                width: 1.sw,
                padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 23.w),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 1.h),
                                      child: Text("lbl_trending".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiBold16)),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgForward,
                                      height: 20.h,
                                      width: 20.w,
                                      margin: EdgeInsets.only(bottom: 3.h))
                                ])),
                        Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                                height: 133.h,
                                child: Obx(() => ListView.separated(
                                    padding: EdgeInsets.only(left: 20.w, top: 21.h),
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: 16.h);
                                    },
                                    itemCount: controller
                                        .homeCreatorModelObj
                                        .value
                                        .trendinghorizonItemList
                                        .value
                                        .length,
                                    itemBuilder: (context, index) {
                                      TrendinghorizonItemModel model = controller
                                          .homeCreatorModelObj
                                          .value
                                          .trendinghorizonItemList
                                          .value[index];
                                      return TrendinghorizonItemWidget(model);
                                    })))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 23.h),
                                child: Text("msg_recommended_influencers".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold16))),
                        Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 5.h, right: 20.w),
                            child: Obx(() => ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                      height: 24.h);
                                },
                                itemCount: controller
                                    .homeCreatorModelObj
                                    .value
                                    .listrectangle50ItemList
                                    .value
                                    .length,
                                itemBuilder: (context, index) {
                                  Listrectangle50ItemModel model = controller
                                      .homeCreatorModelObj
                                      .value
                                      .listrectangle50ItemList
                                      .value[index];
                                  return Listrectangle50ItemWidget(model);
                                })))
                      ]),
                ))));
  }

  openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
