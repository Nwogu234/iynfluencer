import 'controller/search_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_drop_down.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SearchFilterBottomsheet extends StatelessWidget {
  SearchFilterBottomsheet(this.controller, {Key? key}) : super(key: key);

  SearchFilterController controller;

  @override Widget build(BuildContext context) {
    return SingleChildScrollView(child: SizedBox(width: double.maxFinite,
        child: Container(width: double.maxFinite,
            padding: getPadding(left: 19, top: 22, right: 19, bottom: 22),
            decoration: AppDecoration.fillWhiteA700.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL15),
            child: Column(mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: getPadding(left: 1, right: 2),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("lbl_filter".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold16),
                            Padding(padding: getPadding(top: 2),
                                child: Text("lbl_clear".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold14Pink400))
                          ])),
                  Padding(padding: getPadding(left: 2, top: 23),
                      child: Text("lbl_availbililty".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight14Gray900)),
                  Padding(padding: getPadding(left: 1, top: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("msg_select_date_range".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight13),
                            Padding(padding: getPadding(top: 5),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(child: CustomTextFormField(
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller: controller
                                              .frametwelveController,
                                          hintText: "lbl_from2".tr,
                                          margin: getMargin(right: 8),
                                          padding: TextFormFieldPadding
                                              .PaddingT14,
                                          suffix: Container(margin: getMargin(
                                              left: 30,
                                              top: 14,
                                              right: 10,
                                              bottom: 14),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownBlueGray400)),
                                          suffixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(48)))),
                                      Expanded(child: CustomTextFormField(
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller: controller
                                              .frametwelveoneController,
                                          hintText: "lbl_to2".tr,
                                          margin: getMargin(left: 8),
                                          padding: TextFormFieldPadding
                                              .PaddingT14,
                                          textInputAction: TextInputAction.done,
                                          suffix: Container(margin: getMargin(
                                              left: 30,
                                              top: 14,
                                              right: 10,
                                              bottom: 14),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdownBlueGray400)),
                                          suffixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(48))))
                                    ]))
                          ])),
                  CustomDropDown(focusNode: FocusNode(),
                      autofocus: true,
                      icon: Container(margin: getMargin(left: 30),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgArrowdownBlueGray400)),
                      hintText: "lbl_country".tr,
                      margin: getMargin(left: 2, top: 23, right: 8),
                      variant: DropDownVariant.None,
                      items: controller.searchFilterModelObj.value
                          .dropdownItemList.value,
                      onChanged: (value) {
                        controller.onSelected(value);
                      }),
                  CustomDropDown(focusNode: FocusNode(),
                      autofocus: true,
                      icon: Container(margin: getMargin(left: 30),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgArrowdownBlueGray400)),
                      hintText: "lbl_category".tr,
                      margin: getMargin(left: 2, top: 32, right: 8),
                      variant: DropDownVariant.None,
                      items: controller.searchFilterModelObj.value
                          .dropdownItemList1.value,
                      onChanged: (value) {
                        controller.onSelected1(value);
                      }),
                  CustomDropDown(focusNode: FocusNode(),
                      autofocus: true,
                      icon: Container(margin: getMargin(left: 30),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgArrowdownBlueGray400)),
                      hintText: "lbl_expertise".tr,
                      margin: getMargin(left: 2, top: 32, right: 8),
                      variant: DropDownVariant.None,
                      items: controller.searchFilterModelObj.value
                          .dropdownItemList2.value,
                      onChanged: (value) {
                        controller.onSelected2(value);
                      }),
                  CustomButton(height: getVerticalSize(50),
                      text: "lbl_apply_filters".tr,
                      margin: getMargin(left: 1, top: 25, bottom: 14),
                      padding: ButtonPadding.PaddingAll15,
                      onTap: () {
                        onTapApplyfilters();
                      })
                ]))));
  }

  /// Navigates to the searchResultsScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the searchResultsScreen.
  onTapApplyfilters() {
    Get.toNamed(AppRoutes.searchResultsScreen,);
  }
}
