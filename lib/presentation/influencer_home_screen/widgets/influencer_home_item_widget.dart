import '../controller/influencer_home_controller.dart';
import '../models/influencer_home_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class InfluencerHomeItemWidget extends StatelessWidget {
  InfluencerHomeItemWidget(
    this.influencerHomeItemModelObj, {
    Key? key,
    this.onTapJobpost,
  }) : super(
          key: key,
        );

  InfluencerHomeItemModel influencerHomeItemModelObj;

  var controller = Get.find<InfluencerHomeController>();

  VoidCallback? onTapJobpost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          onTapJobpost?.call();
        },
        child: Container(
          padding: getPadding(
            top: 13,
            bottom: 13,
          ),
          decoration: AppDecoration.outlineIndigo501,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "msg_gaming_app_influencer".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiBold14Gray900ab,
              ),
              Container(
                width: getHorizontalSize(
                  321,
                ),
                margin: getMargin(
                  top: 15,
                  right: 13,
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
                  right: 67,
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
              CustomImageView(
                imagePath: ImageConstant.imgRectangle5069180x335,
                height: getVerticalSize(
                  180,
                ),
                width: getHorizontalSize(
                  335,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    7,
                  ),
                ),
                margin: getMargin(
                  top: 16,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 10,
                  bottom: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup85230,
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
                        top: 7,
                        bottom: 3,
                      ),
                      child: Text(
                        "lbl_mark_adebayo".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold14Gray900ab,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 8,
                        top: 9,
                        bottom: 3,
                      ),
                      child: Text(
                        "lbl_11_mins_ago".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight125,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
