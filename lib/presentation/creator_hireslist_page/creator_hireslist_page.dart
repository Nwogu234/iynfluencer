import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
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
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: size.width,
                child: Padding(
                    padding: getPadding(left: 20, top: 14, right: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 8, bottom: 7),
                                    child: Text("lbl_all_hires".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiBold14Gray900)),
                                CustomDropDown(
                                    width: getHorizontalSize(120),
                                    icon: SizedBox.shrink(),
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    hintText: "lbl_filter".tr,
                                    variant: DropDownVariant.OutlineIndigo50,
                                    padding: DropDownPadding.PaddingT8,
                                    fontStyle: DropDownFontStyle.SatoshiBold135,
                                    items: controller.creatorHireslistModelObj
                                        ?.value.dropdownItemList.value,
                                    prefix: Container(
                                        margin: getMargin(
                                            left: 13, top: 5, bottom: 5),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgSignalBlack900)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(35)),
                                    onChanged: (value) {
                                      controller.onSelected(value);
                                    })
                              ]),
                          Expanded(
                              child: Padding(
                                  padding: getPadding(top: 15),
                                  child: Obx(() => ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(1));
                                      },
                                      itemCount: controller.isTrendLoading.value
                                          ? 5 // Adjust the number of skeleton items as needed
                                          : controller.hiredJobs.length,
                                      itemBuilder: (context, index) {
                                        if (controller.isTrendLoading.value) {
                                          return TrendinghorizonItemSkeletonWidget(); // Skeleton widget
                                        } else {
                                          Job model =
                                              controller.hiredJobs[index];
                                          return HiresItemWidget(model,
                                              onTapBidcard: () {
                                            onTapBidcard(model);
                                          });
                                        }
                                      }))))
                        ])))));
  }

  /// Navigates to the jobClientScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the jobClientScreen.
  onTapBidcard(model) {
    Get.to(JobDetailsScreen(selectedJob: model));
  }
}
