import '../controller/creator_jobslist_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';

// ignore: must_be_immutable
class JobpostingItemWidget extends StatelessWidget {
  final Job creatorJobslistModelObj;
  final int index;
  VoidCallback? onTapDetailcard;

  JobpostingItemWidget(
      {required this.creatorJobslistModelObj,
      required this.index,
      this.onTapDetailcard});

  var controller = Get.find<CreatorJobslistController>();

  @override
  Widget build(BuildContext context) {
    String? avatarUrl =
        creatorJobslistModelObj.user?.avatar; // Assuming this is a String
    ImageProvider imageProvider;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = NetworkImage(avatarUrl);
    } else {
      imageProvider = NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/6915/6915987.png');
    }

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return GestureDetector(
      onTap: () {
        onTapDetailcard?.call();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 19,
                right: 26,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    url: avatarUrl ?? ImageConstant.imgGroup852,
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
                      left: 12,
                      top: 3,
                      bottom: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${capitalizeFirstLetter(creatorJobslistModelObj.user?.firstName)} ${capitalizeFirstLetter(creatorJobslistModelObj.user?.lastName)}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold14Gray900ab,
                        ),
                        Padding(
                          padding: getPadding(
                            left: 1,
                            top: 3,
                          ),
                          child: Text(
                            "${creatorJobslistModelObj.createdAt.isDateTime}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight125,
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
                      top: 22,
                      bottom: 21,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 19,
              top: 22,
            ),
            child: Text(
              "${creatorJobslistModelObj.title}",
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
              left: 20,
              top: 8,
              right: 33,
            ),
            child: Text(
              "${creatorJobslistModelObj.description}",
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.txtSatoshiLight14Gray900ab,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 19,
              top: 14,
              right: 88,
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
                        "${capitalizeFirstLetter(creatorJobslistModelObj.budgetFrom.toString())} ${capitalizeFirstLetter(creatorJobslistModelObj.budgetTo.toString())}",
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
                        "${creatorJobslistModelObj.duration}",
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
          SizedBox(
            width: double.maxFinite,
            child: Container(
              margin: getMargin(
                top: 18,
              ),
              padding: getPadding(
                left: 20,
                right: 20,
              ),
              decoration: AppDecoration.outlineIndigo501,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle5066,
                    height: getVerticalSize(
                      181,
                    ),
                    width: getHorizontalSize(
                      335,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        7,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 2,
                      top: 14,
                      right: 5,
                      bottom: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${creatorJobslistModelObj.bidsCount}",
                                style: TextStyle(
                                  color: ColorConstant.gray900E5,
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: "lbl_bids".tr,
                                style: TextStyle(
                                  color: ColorConstant.gray600,
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: ColorConstant.cyan300,
                                  fontSize: getFontSize(
                                    11.5,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: getPadding(
                            left: 13,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${creatorJobslistModelObj.hired}",
                                  style: TextStyle(
                                    color: ColorConstant.gray900E5,
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: "lbl_hires".tr,
                                  style: TextStyle(
                                    color: ColorConstant.gray600,
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                    color: ColorConstant.cyan300,
                                    fontSize: getFontSize(
                                      11.5,
                                    ),
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgFrameGray600,
                          height: getSize(
                            18,
                          ),
                          width: getSize(
                            18,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 6,
                            bottom: 1,
                          ),
                          child: Text(
                            "lbl_237".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold115Gray600,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgEyeGray600,
                          height: getSize(
                            18,
                          ),
                          width: getSize(
                            18,
                          ),
                          margin: getMargin(
                            left: 13,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 6,
                            bottom: 1,
                          ),
                          child: Text(
                            "lbl_865".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold115Gray600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
