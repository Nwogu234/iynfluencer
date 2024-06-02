import 'package:iynfluencer/data/models/Jobs/job_model.dart';

import '../controller/creator_hireslist_controller.dart';
import '../models/hires_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class HiresItemWidget extends StatelessWidget {
   final Job? hiresItemlistObj;

  HiresItemWidget({
     this.hiresItemlistObj,
    this.onTapBidcard,
  });


  var controller = Get.find<CreatorHireslistController>();

  VoidCallback? onTapBidcard;

  @override
  Widget build(BuildContext context) {
    DateTime? parsedDate =
        DateTime.tryParse(hiresItemlistObj?.createdAt ?? "lbl_mar_18_2023".tr);
    String formattedDate = parsedDate != null
        ? "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}"
        : 'Unknown Date';

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    String? avatarUrl = 
   'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${hiresItemlistObj?.creator?.userId}-avatar.jpeg' ?? ImageConstant.imgGroup85235x35;
    String imageProvider;

    print(avatarUrl);

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = "${controller.user.baseUrl}$avatarUrl";
    } else {
      imageProvider = 'https://cdn-icons-png.flaticon.com/512/6915/6915987.png';
    }


    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          onTapBidcard?.call();
        },
        child: Container(
          padding: getPadding(
            left: 4,
            top: 12,
            right: 4,
            bottom: 12,
          ),
          decoration: AppDecoration.outlineIndigo502,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                      url: imageProvider,
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
                            "\$${capitalizeFirstLetter(hiresItemlistObj?.user?.firstName)}-\$${capitalizeFirstLetter(hiresItemlistObj?.user?.lastName)}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold145,
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
                                    hiresItemlistObj?.user?.country ??
                                        "lbl_lagos_nigeria".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight14,
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
                      height: getVerticalSize(
                        1,
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
                        top: 1,
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
                              style: AppStyle.txtSatoshiLight135Gray600,
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              25,
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
                            style: AppStyle.txtSatoshiLight135Gray600,
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: getPadding(
                              top: 7,
                            ),
                            child: Text(
                              "\$${capitalizeFirstLetter(hiresItemlistObj?.budgetFrom.toString())}-\$${capitalizeFirstLetter(hiresItemlistObj?.budgetTo.toString())}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold125Gray900a7,
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
                            style: AppStyle.txtSatoshiLight135Gray600,
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: getPadding(
                              top: 9,
                            ),
                            child: Text(
                              "$formattedDate",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold125Gray900a7,
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
    );
  }
}
