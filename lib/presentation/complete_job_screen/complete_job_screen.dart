import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/presentation/complete_job_screen/controller/complete_job_controller.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';

class CompleteJobScreen extends StatelessWidget {
   CompleteJobScreen({Key? key}) : super(key: key);

  final CompleteJobController controller = Get.put(CompleteJobController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
          height: getVerticalSize(48),
          leadingWidth: 50,
          leading: AppbarImage(
              height: getSize(30),
              width: getSize(30),
              svgPath: ImageConstant.imgArrowleftGray600,
              margin: getMargin(left: 20, top: 9, bottom: 9),
              onTap: () {
                onTapArrowleft17();
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Complete Job".tr),
          styleType: Style.bgOutlineIndigo50_1),
      body: Container(
        width: double.maxFinite,
        padding: getPadding(all: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Text(
                  "Milestones completed".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold18,
                ),
              ],
          ),
        ),
      ),
    ));
  }

  onTapArrowleft17() {
    Get.back();
  }
}
/*                             Padding(
                              padding: getPadding(
                                top: 29,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_add_description".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13Gray900
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  CustomTextFormField(
                                    maxLines: 4,
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller:
                                        controller.frametwelveoneController,
                                    hintText: "msg_explain_briefly".tr,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a duration';
                                      }
                                      return null; // Return null if the input is valid
                                    },
                                    margin: getMargin(
                                      top: 6,
                                    ),
                                    // padding: TextFormFieldPadding.PaddingT38,
                                  ),
                                ],
                              ),
                            ), */