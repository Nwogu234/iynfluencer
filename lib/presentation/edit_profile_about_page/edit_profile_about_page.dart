import '../edit_profile_about_page/widgets/chipviewframe91_item_widget.dart';
import 'controller/edit_profile_about_controller.dart';
import 'models/chipviewframe91_item_model.dart';
import 'models/edit_profile_about_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class EditProfileAboutPage extends StatelessWidget {
  EditProfileAboutPage({Key? key})
      : super(
          key: key,
        );

  EditProfileAboutController controller =
      Get.put(EditProfileAboutController(EditProfileAboutModel().obs));

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
                      top: 33,
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
                            "msg_meet_sarah_a_passionate".tr,
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
                          child: Obx(
                            () => Wrap(
                              runSpacing: getVerticalSize(
                                5,
                              ),
                              spacing: getHorizontalSize(
                                5,
                              ),
                              children: List<Widget>.generate(
                                controller.editProfileAboutModelObj.value
                                    .chipviewframe91ItemList.value.length,
                                (index) {
                                  Chipviewframe91ItemModel model = controller
                                      .editProfileAboutModelObj
                                      .value
                                      .chipviewframe91ItemList
                                      .value[index];

                                  return Chipviewframe91ItemWidget(
                                    model,
                                  );
                                },
                              ),
                            ),
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
                                  left: 6,
                                  top: 2,
                                ),
                                child: Text(
                                  "lbl_lagos_nigeria".tr,
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
                                  left: 10,
                                  top: 1,
                                ),
                                child: Text(
                                  "msg_https_drive_g".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight14BlueA700,
                                ),
                              ),
                            ],
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
