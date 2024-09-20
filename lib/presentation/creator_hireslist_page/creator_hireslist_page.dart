import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/presentation/job_hired_screen/job_hired_screen.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';
import '../creator_hireslist_page/widgets/hires_item_widget.dart';
import 'controller/creator_hireslist_controller.dart';
import 'models/creator_hireslist_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_drop_down.dart';

// ignore_for_file: must_be_immutable
 class CreatorHireslistPage extends StatefulWidget {
  CreatorHireslistPage({Key? key}) : super(key: key);
  @override
  State<CreatorHireslistPage> createState() => _CreatorHireslistPageState();
}
class _CreatorHireslistPageState extends State<CreatorHireslistPage>
    with SingleTickerProviderStateMixin {
  late CreatorHireslistController controller;
  GlobalKey<ScaffoldState> _hiredListScaffoldKey = GlobalKey<ScaffoldState>();
  // Initialize creatorJobslistModelObj here
  final creatorHireslistModelObj = CreatorHireslistModel();
  // List<JobRequest> jobpostingItemList = [];
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    controller = Get.put(CreatorHireslistController(creatorHireslistModelObj));
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

   Future<void> _refresh() async {
    await controller.refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize screen_util
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: false);
    return SafeArea(
      child: Scaffold(
        key: _hiredListScaffoldKey,
        backgroundColor: Colors.transparent,
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SizedBox(
            width: 1.sw,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          "lbl_all_hires".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold14Gray900
                              .copyWith(fontSize: 14.sp),
                        ),
                       ),
                       CustomButton(
                        height: getVerticalSize(
                          35,
                        ),
                        width: getHorizontalSize(
                          83,
                        ),
                        text: "lbl_filter".tr,
                        variant: ButtonVariant.OutlineIndigo50,
                        padding: ButtonPadding.PaddingT8,
                        fontStyle: ButtonFontStyle.SatoshiBold135,
                        prefixWidget: Container(
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSignalBlack900,
                          ),
                        ),
                       )
                    ]
                      ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Obx(() {
                      if (controller.isTrendLoading.value) {
                        return Center(
                          child: CustomLoadingWidget(
                          animationController: animationController,
                             ),);
                      } else if (controller.error.value.isNotEmpty) {
                        return ResponsiveErrorWidget(
                          errorMessage: controller.error.value,
                          smallMessage: controller.hiredJobs.isEmpty ? 'Your past and current hires will appear here'
                           : '',
                          onRetry: () {
                            controller.getUser();
                          },
                          fullPage: true,
                        );
                      } else {
                        return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 1.h),
                          itemCount: controller.hiredJobs.length,
                          itemBuilder: (context, index) {
                            Job model = controller.hiredJobs[index];
                            return HiresItemWidget(
                             hiresItemlistObj: model,
                              onTapBidcard: () {
                                onTapBidcard(model);
                              },
                            );
                          },
                        );
                      }
                    }),
                  ))
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  onTapBidcard(model) {
    Get.to(JobHiredScreen(selectedJob: model),
     transition: Transition.zoom,
     duration: Duration(seconds:1)
    );
  }
} 




/* 
class CreatorHireslistPage extends StatefulWidget {
  CreatorHireslistPage({Key? key}) : super(key: key);
  @override
  State<CreatorHireslistPage> createState() => _CreatorHireslistPageState();
}

class _CreatorHireslistPageState extends State<CreatorHireslistPage>
    with SingleTickerProviderStateMixin {
  late CreatorHireslistController controller;
 // GlobalKey<ScaffoldState> _hiredListScaffoldKey = GlobalKey<ScaffoldState>();
  // Initialize creatorJobslistModelObj here
  final creatorHireslistModelObj = CreatorHireslistModel();
  // List<JobRequest> jobpostingItemList = [];
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    controller = Get.put(CreatorHireslistController(creatorHireslistModelObj));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    await controller.refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: false);
    return SafeArea(
      child: Scaffold(
    //  key: _hiredListScaffoldKey,
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.maxFinite,
        child: GestureDetector(
          onTap: () {
            onTapBidcard();
          },
          child: Container(
            padding: getPadding(
              left: 4,
              top: 12,
              right: 4,
              bottom: 12,
            ),
            decoration: AppDecoration.outlineIndigo502,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                     padding: EdgeInsets.only( bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_all_hires".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold14Gray900
                              .copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold
                                ),
                        ),
                         CustomButton(
                          height: getVerticalSize(
                            35,
                          ),
                          width: getHorizontalSize(
                            83,
                          ),
                          text: "lbl_filter".tr,
                          variant: ButtonVariant.OutlineIndigo50,
                          padding: ButtonPadding.PaddingT8,
                          fontStyle: ButtonFontStyle.SatoshiBold135,
                          prefixWidget: Container(
                            child: CustomImageView(
                              svgPath: ImageConstant.imgSignalBlack900,
                            ),
                          ),
                         )
                      ]
                        ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 1,
                      right: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgGroup85235x35,
                          height: getSize(
                            50,
                          ),
                          width: getSize(
                            50,
                          ),
                          radius: BorderRadius.circular(
                            getSize(
                              25.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 16,
                            top: 6,
                            bottom: 3,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mark Adebayo",
                                // "\$${capitalizeFirstLetter(hiresItemlistObj?.user?.firstName)}-\$${capitalizeFirstLetter(hiresItemlistObj?.user?.lastName)}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold145.copyWith(
                                  color: ColorConstant.black900,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5
                                ),
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
                                        left: 3,
                                      ),
                                      child: Text(
                                     //   hiresItemlistObj?.user?.country ??
                                            "lbl_lagos_nigeria".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                                          fontSize: 14
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgVector,
                          color: ColorConstant.black9000,
                          height: getVerticalSize(
                            13,
                          ),
                          width: getHorizontalSize(
                            13,
                          ),
                          margin: getMargin(
                            top: 11,
                            bottom: 37,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 1,
                      top: 27,
                      bottom: 11,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 14
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                  bottom: 4,
                                ),
                                child: Text(
                                  "lbl_project_status".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                                          fontSize: 13.5
                                        ),
                                ),
                              ),
                              CustomButton(
                                height: getVerticalSize(
                                  24,
                                ),
                                width: getHorizontalSize(
                                  83,
                                ),
                                text: "lbl_in_progress".tr,
                                margin: getMargin(
                                  top: 3,
                                ),
                                variant: ButtonVariant.FillLime100b2,
                                shape: ButtonShapes.RoundedBorder12,
                                padding: ButtonPadding.PaddingAll4,
                                fontStyle: ButtonFontStyle.SatoshiBold115,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 1,
                            bottom: 4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_project_cost".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                                          fontSize: 13.5
                                        ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: getPadding(
                                  top: 7,
                                ),
                                child: Text(
                                  "\$200",
                                  //   "\$${capitalizeFirstLetter(hiresItemlistObj?.budgetFrom.toString())}-\$${capitalizeFirstLetter(hiresItemlistObj?.budgetTo.toString())}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                   style: AppStyle.txtSatoshiBold145.copyWith(
                                   color: ColorConstant.black900,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 12.5
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            bottom: 4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_deadline".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                 style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                                          fontSize: 13.5
                                        ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: getPadding(
                                  top: 9,
                                ),
                                child: Text(
                                  "Mar 18, 2023",
                                  //   "$formattedDate",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold145.copyWith(
                                   color: ColorConstant.black900,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 12.5
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
          ),
        ),
      ),
    ));
  }

  onTapBidcard() {
    Get.to(JobHiredScreen());
  }
}
 */