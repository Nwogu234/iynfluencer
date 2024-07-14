import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/bid_screen/models/bid_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/edit_bid_screen/controller/edit_bid_controller.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class EditBidScreen extends GetWidget {
  EditBidScreen({Key? key}) : super(key: key);
  
   final Job selectedJob = Get.arguments as Job;

  

  final EditBidController controller =
      Get.put(EditBidController(BidModel().obs));
  Widget _buildAccountForm() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller.animationController, curve: Curves.easeIn),
      ),
      child: Form(
        // key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: CustomTextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                maxLines: 4,
                controller: controller.termsAndConditionController,
                hintText: "msg_input_all_terms".tr,
                margin: getMargin(
                  top: 6,
                ),
                // padding: TextFormFieldPadding.PaddingT38,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task';
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: CustomButton(
                      text: 'Cancel',
                      onTap: () {
                        controller.isAddingTermsOfContract.value = false;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: CustomButton(
                      text: 'Add',
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.errorText.value = "";
                          controller.addTermsAndCondition(
                              controller.termsAndConditionController.text);
                          // controller.animationController.reverse();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
            title: AppbarTitle(text: "Edit bid".tr),
            styleType: Style.bgOutlineIndigo50_1),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(all: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "msg_gaming_app_influencer2".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold18,
                ),
                Padding(
                  padding: getPadding(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_cover_letter".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight13Gray900,
                      ),
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: controller.frametwelveController,
                        hintText: "msg_explain_briefly".tr,
                        margin: getMargin(top: 7),
                        padding: TextFormFieldPadding.PaddingT38,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(top: 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("lbl_project_charge".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13Gray900),
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: controller.priceController,
                        hintText: "lbl_300".tr,
                        margin: getMargin(top: 6),
                        textInputAction: TextInputAction.done,
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: getPadding(top: 27, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "msg_terms_of_contract".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold14Gray900,
                        ),
                        CustomButton(
                          height: getVerticalSize(44.h),
                          text: "Add the Terms of Contract",
                          onTap: () {
                            controller.startAddingTermsOfContract();
                          },
                          margin: getMargin(top: 24.h),
                          variant: ButtonVariant.OutlineGray300b2,
                          padding: ButtonPadding.PaddingT12,
                          fontStyle: ButtonFontStyle.SatoshiLight14,
                          prefixWidget: Container(
                            margin: getMargin(right: 6.w),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgFrameGray700),
                          ),
                        ),
                        Obx(() => controller.isAddingTermsOfContract.value
                            ? _buildAccountForm()
                            : _buildAccountChips()),
                        if (controller.errorText.value != null)
                          Obx(
                            () => Text(
                              controller.errorText.value,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 10.sp,
                              ),
                            ),
                          )
                      ],
                    )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: getMargin(left: 20, right: 20, bottom: 20),
          decoration: AppDecoration.outlineIndigo507,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => CustomButton(
                  height: getVerticalSize(44),
                  text: "lbl_submit_bid2".tr,
                  padding: ButtonPadding.PaddingAll12,
                  loading: controller.isLoading.value,
                  onTap: () {
                    controller.editForm(
                      context, 
                      selectedJob.jobId ?? '', 
                      selectedJob.bids?.first.bidId ?? '',
                      selectedJob.creator?.userId ?? '',
                      selectedJob.title!
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //This is for showing the list of responsibilities
  Widget _buildAccountChips() {
    List responsibilitiesCopy = controller.termsAndConditions.toList();

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller.animationController, curve: Curves.easeOut),
      ),
      child: Wrap(
        spacing: 8.0.w,
        children: responsibilitiesCopy.map((account) {
          return Chip(
            label: Text("${account.toString()}"),
            deleteIcon: Icon(Icons.close),
            onDeleted: () => controller.handleDelete(account),
          );
        }).toList(),
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft17() {
    Get.back();
  }
}
