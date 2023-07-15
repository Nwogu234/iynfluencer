import '../jobs_my_bids_influencer_page/widgets/listmediainflue_item_widget.dart';
import 'controller/jobs_my_bids_influencer_controller.dart';
import 'models/jobs_my_bids_influencer_model.dart';
import 'models/listmediainflue_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class JobsMyBidsInfluencerPage extends StatelessWidget {
  JobsMyBidsInfluencerPage({Key? key})
      : super(
          key: key,
        );

  JobsMyBidsInfluencerController controller =
      Get.put(JobsMyBidsInfluencerController(JobsMyBidsInfluencerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: getPadding(
              left: 20,
              top: 14,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left:19,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 8,
                          bottom: 7,
                        ),
                        child: Text(
                          "lbl_all_bids2".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold14Gray900,
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
                ),
                Expanded(
                  child: Padding(
                    padding: getPadding(
                       top: 10,
                      bottom: 180,
                    ),
                    child: Obx(
                      () => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: false,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(
                            height: getVerticalSize(
                              1,
                            ),
                          );
                        },
                        itemCount: controller.jobsMyBidsInfluencerModelObj
                            .value.listmediainflueItemList.value.length,
                        itemBuilder: (context, index) {
                          ListmediainflueItemModel model = controller
                              .jobsMyBidsInfluencerModelObj
                              .value
                              .listmediainflueItemList
                              .value[index];
                          return ListmediainflueItemWidget(
                            model,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
