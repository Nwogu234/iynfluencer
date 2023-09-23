import '../../../data/models/Influencer/influencer_response_model.dart';
import '../controller/home_creator_controller.dart';
import '../models/listrectangle50_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listrectangle50ItemWidget extends StatelessWidget {
  Listrectangle50ItemWidget(
    this.listrectangle50, {
    Key? key,
  }) : super(
          key: key,
        );

  Influencer listrectangle50;

  var controller = Get.find<HomeCreatorController>();

  @override
  Widget build(BuildContext context) {
    String? avatarUrl =
        listrectangle50.user?.first.avatar; // Assuming this is a String
    String imageProvider;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          decoration: AppDecoration.outlineIndigo50.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getVerticalSize(
                  267,
                ),
                width: getHorizontalSize(
                  335,
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      url: imageProvider,
                      height: getVerticalSize(
                        267,
                      ),
                      width: getHorizontalSize(
                        335,
                      ),
                      radius: BorderRadius.only(
                        topLeft: Radius.circular(
                          getHorizontalSize(
                            10,
                          ),
                        ),
                        topRight: Radius.circular(
                          getHorizontalSize(
                            10,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: getHorizontalSize(
                          67,
                        ),
                        margin: getMargin(
                          top: 13,
                          right: 10,
                        ),
                        padding: getPadding(
                          left: 8,
                          top: 1,
                          right: 8,
                          bottom: 1,
                        ),
                        decoration: AppDecoration.txtFillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.txtCircleBorder11,
                        ),
                        child: Text(
                          "lbl_top_rated".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold115,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 13,
                    right: 19,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${capitalizeFirstLetter(listrectangle50.user?.first.firstName)} ${capitalizeFirstLetter(listrectangle50.user?.first.lastName)}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold16,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 12,
                          top: 1,
                          bottom: 2,
                        ),
                        child: Text(
                          "${listrectangle50.user?.first.country}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        svgPath: ImageConstant.imgFrameAmber500,
                        height: getSize(
                          18,
                        ),
                        width: getSize(
                          18,
                        ),
                        margin: getMargin(
                          bottom: 4,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 6,
                          bottom: 3,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "lbl_3_52".tr,
                                style: TextStyle(
                                  color: ColorConstant.gray900,
                                  fontSize: getFontSize(
                                    13.5,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: ColorConstant.blueGray400,
                                  fontSize: getFontSize(
                                    13.5,
                                  ),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 14,
                  top: 5,
                  bottom: 18,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgFrameBlueGray400,
                      height: getSize(
                        15,
                      ),
                      width: getSize(
                        15,
                      ),
                      margin: getMargin(
                        bottom: 3,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 8,
                      ),
                      child: Text(
                        "${listrectangle50.jobsDone.toString()} jobs completed",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight135,
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
