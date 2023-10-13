import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

import '../influencer_profile_about_page/widgets/chipviewframe89_item_widget.dart';
import 'controller/influencer_profile_about_controller.dart';
import 'models/chipviewframe89_item_model.dart';
import 'models/influencer_profile_about_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class InfluencerProfileAboutPage extends StatelessWidget {
  InfluencerProfileAboutPage({this.selectedInfluencer});

  final Influencer? selectedInfluencer;

  InfluencerProfileAboutController controller = Get.put(
      InfluencerProfileAboutController(InfluencerProfileAboutModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 20,
                      top: 25,
                      right: 42,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_about".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtH2Gray600,
                        ),
                        Container(
                          width: getHorizontalSize(
                            313,
                          ),
                          margin: getMargin(
                            top: 7,
                          ),
                          child: Text(
                            "${selectedInfluencer?.bio}",
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight14Gray900,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 3,
                            top: 30,
                          ),
                          child: Text(
                            "lbl_niche".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH2Gray600,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 2,
                            top: 10,
                          ),
                          child: Wrap(
                            runSpacing: getVerticalSize(
                              5,
                            ),
                            spacing: getHorizontalSize(
                              5,
                            ),
                            children: selectedInfluencer?.niche?.map((item) {
                                  return Chipviewframe89ItemWidget(
                                    Chipviewframe89ItemModel(
                                      chipviewframe89ModelObj: item,
                                    ),
                                  );
                                })?.toList() ??
                                [],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 6,
                            top: 30,
                          ),
                          child: Text(
                            "lbl_location".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH2Gray600,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 1,
                            top: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgFrameGray900,
                                height: getSize(
                                  15,
                                ),
                                width: getSize(
                                  15,
                                ),
                                margin: getMargin(
                                  top: 2,
                                  bottom: 3,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 2,
                                  top: 2,
                                ),
                                child: Text(
                                  "${selectedInfluencer?.user?.first.country}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight14Gray900,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgTrash,
                                height: getSize(
                                  20,
                                ),
                                width: getSize(
                                  20,
                                ),
                                margin: getMargin(
                                  left: 6,
                                  bottom: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 29,
                          ),
                          child: Text(
                            "lbl_website".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH2Gray600,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 1,
                            top: 9,
                            right: 52,
                          ),
                          child: Expanded(
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgLink,
                                  height: getSize(
                                    20,
                                  ),
                                  width: getSize(
                                    20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 1,
                                  ),
                                  child: Text(
                                    "${selectedInfluencer?.socials?.first?.platformUrl}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight14BlueA700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 7,
                            top: 40,
                          ),
                          child: Text(
                            "lbl_social_media".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH2Gray600,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 2,
                            top: 6,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgPhinstagramlogofill,
                                height: getSize(
                                  24,
                                ),
                                width: getSize(
                                  24,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgIcbaselinefacebook,
                                height: getSize(
                                  24,
                                ),
                                width: getSize(
                                  24,
                                ),
                                margin: getMargin(
                                  left: 9,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgMditwitter,
                                height: getSize(
                                  24,
                                ),
                                width: getSize(
                                  24,
                                ),
                                margin: getMargin(
                                  left: 9,
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
          ),
        ),
      ),
    );
  }
}
