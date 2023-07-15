import '../controller/jobs_jobs_influencer_controller.dart';
import '../models/listclient_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class ListclientItemWidget extends StatelessWidget {
  ListclientItemWidget(
    this.listclientItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListclientItemModel listclientItemModelObj;

  var controller = Get.find<JobsJobsInfluencerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(
        255,
      ),
      width: getHorizontalSize(
        336,
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: getPadding(
                left: 5,
                top: 21,
                right: 5,
                bottom: 21,
              ),
              decoration: AppDecoration.outlineIndigo501,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 70,
                      right: 69,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_client".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight135Gray600,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 5,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGroup85237,
                                    height: getSize(
                                      30,
                                    ),
                                    width: getSize(
                                      30,
                                    ),
                                    radius: BorderRadius.circular(
                                      getSize(
                                        15.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 12,
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "lbl_alfred_ruo".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold14Gray900ab,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: getPadding(
                            left: 64,
                            top: 2,
                            bottom: 3,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_project_status".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight135Gray600,
                              ),
                              CustomButton(
                                height: getVerticalSize(
                                  25,
                                ),
                                width: getHorizontalSize(
                                  82,
                                ),
                                text: "lbl_completed".tr,
                                margin: getMargin(
                                  top: 3,
                                ),
                                variant: ButtonVariant.FillGreenA10099,
                                shape: ButtonShape.RoundedBorder12,
                                padding: ButtonPadding.PaddingAll4,
                                fontStyle:
                                    ButtonFontStyle.SatoshiBold115Green700,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 15,
                      right: 74,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_project_cost".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight135Gray600,
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 7,
                                ),
                                child: Text(
                                  "lbl_200".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold125Gray900a7,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_deadline".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight135Gray600,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 9,
                              ),
                              child: Text(
                                "lbl_mar_18_2023".tr,
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
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        listclientItemModelObj.mediainfluencerTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold18Gray900ab,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgVector,
                      height: getVerticalSize(
                        1,
                      ),
                      width: getHorizontalSize(
                        13,
                      ),
                      margin: getMargin(
                        left: 168,
                        top: 11,
                        bottom: 12,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: getPadding(
                    left: 3,
                    top: 17,
                    right: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle509454x58,
                        height: getVerticalSize(
                          54,
                        ),
                        width: getHorizontalSize(
                          58,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            6,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: getHorizontalSize(
                            240,
                          ),
                          margin: getMargin(
                            left: 16,
                            top: 6,
                            bottom: 10,
                          ),
                          child: Text(
                            "msg_a_game_influencer".tr,
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight14Gray900ab,
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
    );
  }
}
