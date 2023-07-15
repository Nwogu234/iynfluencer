import '../controller/jobs_requests_influencer_controller.dart';
import '../models/listgroup854_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class Listgroup854ItemWidget extends StatelessWidget {
  Listgroup854ItemWidget(
    this.listgroup854ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listgroup854ItemModel listgroup854ItemModelObj;

  var controller = Get.find<JobsRequestsInfluencerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 2,
          right: 2,
        ),
        decoration: AppDecoration.outlineIndigo501,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                right: 7,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup85243,
                    height: getSize(
                      45,
                    ),
                    width: getSize(
                      45,
                    ),
                    radius: BorderRadius.circular(
                      getSize(
                        22.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                      top: 4,
                      bottom: 1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            listgroup854ItemModelObj.nameTxt.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold145,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 1,
                            top: 1,
                          ),
                          child: Obx(
                            () => Text(
                              listgroup854ItemModelObj.durationTxt.value,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    svgPath: ImageConstant.imgVector,
                    height: getVerticalSize(
                      1,
                    ),
                    width: getHorizontalSize(
                      13,
                    ),
                    margin: getMargin(
                      top: 15,
                      bottom: 28,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 20,
              ),
              child: Text(
                "msg_music_video_influencer2".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiBold14Gray900ab,
              ),
            ),
            Container(
              width: getHorizontalSize(
                321,
              ),
              margin: getMargin(
                left: 1,
                top: 8,
                right: 9,
              ),
              child: Text(
                "msg_looking_for_a_game".tr,
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiLight14Gray900ab,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 14,
                right: 62,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_budget".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight135Gray600,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 3,
                        ),
                        child: Text(
                          "lbl_200_500".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold125Gray900a7,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "msg_project_duration".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight135Gray600,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 3,
                        ),
                        child: Text(
                          "lbl_10_weeks".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold125Gray900a7,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 20,
                bottom: 16,
              ),
              child: Row(
                children: [
                  CustomButton(
                    height: getVerticalSize(
                      32,
                    ),
                    width: getHorizontalSize(
                      90,
                    ),
                    text: "lbl_view_details".tr,
                    fontStyle: ButtonFontStyle.SatoshiBold12,
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      32,
                    ),
                    width: getHorizontalSize(
                      72,
                    ),
                    text: "lbl_dismiss".tr,
                    margin: getMargin(
                      left: 12,
                    ),
                    variant: ButtonVariant.OutlineIndigo50_2,
                    fontStyle: ButtonFontStyle.SatoshiBold12Gray900ab,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
