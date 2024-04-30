import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
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

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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


  @override
  Widget build(BuildContext context) {
    // Initialize screen_util
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: false);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: SizedBox(
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
                        style: AppStyle.txtSatoshiBold14Gray900.copyWith(fontSize: 14.sp),
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
                    ),
                  ],
                ),
              /*   Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Obx(
                          () => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 1.h);
                        },
                        itemCount: controller.isTrendLoading.value
                            ? 5  
                            : controller.hiredJobs.length,
                        itemBuilder: (context, index) {
                          if (controller.isTrendLoading.value) {
                            return TrendinghorizonItemSkeletonWidget();
                          } else {
                            Job model = controller.hiredJobs[index];
                            return HiresItemWidget(
                              model,
                              onTapBidcard: () {
                                onTapBidcard(model);
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ), */

                 Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Obx(() {
                      if (controller.isTrendLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else if (controller.hiredJobs.isEmpty && !controller.isTrendLoading.value) {
                         return ResponsiveEmptyWidget(
                          errorMessage: 'No Hired jobs Available',
                          buttonText: "Retry Now",
                          onRetry: () {
                            controller.getUser();
                          },
                          fullPage: true,
                        ); // Your erro
                      } else {
                        return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(height: 1.h),
                          itemCount: controller.hiredJobs.length,
                          itemBuilder: (context, index) {
                            Job model = controller.hiredJobs[index];
                            return HiresItemWidget(
                              model,
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
    );
  }

  onTapBidcard(model) {
    Get.to(JobDetailsScreen(selectedJob: model));
  }
}
