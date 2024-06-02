import '../../widgets/custom_drop_down.dart';
import 'controller/search_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:iynfluencer/presentation/search_results_screen/controller/search_results_controller.dart';
import 'package:iynfluencer/presentation/search_results_screen/models/search_results_model.dart';
import 'package:iynfluencer/presentation/search_results_screen/search_results_screen.dart';

 class SearchFilterBottomsheet extends StatelessWidget {

  // SearchFilterController controller;
  // late SearchResultsController searchResultsController;
  SearchFilterController searchFilterController =
  Get.put(SearchFilterController());

  
 // SearchFilterController controller = Get.put(SearchFilterController());
  SearchResultsController controllers =
      Get.put(SearchResultsController(SearchResultsModel().obs));

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Container(
                width: double.maxFinite,
                padding: getPadding(left: 19, top: 22, right: 19, bottom: 22),
                decoration: AppDecoration.fillWhiteA700
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL15),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 1, right: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_filter".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold16),
                                Padding(
                                    padding: getPadding(top: 2),
                                    child: Text("lbl_clear".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiBold14Pink400))
                              ])),
                      Padding(
                          padding: getPadding(left: 2, top: 23),
                          child: Text("lbl_availbililty".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight14Gray900)),
                      Padding(
                          padding: getPadding(left: 1, top: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("msg_select_date_range".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13),
                                Padding(
                                    padding: getPadding(top: 5),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: CustomTextFormField(
                                                  focusNode: FocusNode(),
                                                  autofocus: true,
                                                  controller: searchFilterController
                                                      .frametwelveController,
                                                  hintText: "lbl_from2".tr,
                                                  margin: getMargin(right: 8),
                                                  padding: TextFormFieldPadding
                                                      .PaddingT14,
                                                  suffix: Container(
                                                      margin: getMargin(
                                                          left: 30,
                                                          top: 14,
                                                          right: 10,
                                                          bottom: 14),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowdownBlueGray400)),
                                                  suffixConstraints:
                                                      BoxConstraints(
                                                          maxHeight:
                                                              getVerticalSize(
                                                                  48)))),
                                          Expanded(
                                              child: CustomTextFormField(
                                                  focusNode: FocusNode(),
                                                  autofocus: true,
                                                  controller: searchFilterController
                                                      .frametwelveoneController,
                                                  hintText: "lbl_to2".tr,
                                                  margin: getMargin(left: 8),
                                                  padding: TextFormFieldPadding
                                                      .PaddingT14,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  suffix: Container(
                                                      margin: getMargin(
                                                          left: 30,
                                                          top: 14,
                                                          right: 10,
                                                          bottom: 14),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowdownBlueGray400)),
                                                  suffixConstraints:
                                                      BoxConstraints(
                                                          maxHeight:
                                                              getVerticalSize(
                                                                  48))))
                                        ]))
                              ])),
                      CustomDropDown(
                          focusNode: FocusNode(),
                          autofocus: true,
                          icon: Container(
                              margin: getMargin(left: 30),
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgArrowdownBlueGray400)),
                          hintText: "lbl_country".tr,
                          margin: getMargin(left: 2, top: 23, right: 8),
                          variant:DropDownVariant.None,
                          items: searchFilterController.searchFilterModelObj.value
                              .dropdownItemList1.value,
                          onChanged: (value) {
                            searchFilterController.onSelected1(value);
                          }),
                      CustomDropDown(
                          focusNode: FocusNode(),
                          autofocus: true,
                          icon: Container(
                              margin: getMargin(left: 30),
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgArrowdownBlueGray400)),
                          hintText: "lbl_category".tr,
                          margin: getMargin(left: 2, top: 32, right: 8),
                          variant: DropDownVariant.None,
                          items: searchFilterController.searchFilterModelObj.value
                              .dropdownItemList.value,
                          onChanged: (value) {
                            searchFilterController.onSelected(value);
                          }),
                      CustomButton(
                          height: getVerticalSize(50),
                          text: "lbl_apply_filters".tr,
                          margin: getMargin(left: 1, top: 25, bottom: 14),
                          padding: ButtonPadding.PaddingAll15,
                          onTap: () {
                           // onTapApplyfilters();
                          })
                    ]))));
  }

  /// Navigates to the searchResultsScreen when the action is triggered.
  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the searchResultsScreen.
onTapApplyfilters() {
  
    final String? fromDate = searchFilterController.frametwelveController.text;
    final String? toDate = searchFilterController.frametwelveoneController.text;
    final SelectionPopupModel? selectedNiche = searchFilterController.selectedDropDownValue;
    final SelectionPopupModel? selectedCountry =
        searchFilterController.selectedDropDownValue1;

    controllers.filterInfluencers(
      fromDate: fromDate,
      toDate: toDate,
      selectedNiche: selectedNiche,
      selectedCountry: selectedCountry,
    );

      if (controllers.filteredInfluencers.isEmpty) {
    Get.snackbar(
      'No Influencers Found',
      'There are no influencers matching your filter.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 10),
      backgroundColor: ColorConstant.gray300B2,
      colorText: ColorConstant.black900,
    );
  } else {
    Get.to(() => SearchResultsScreen(
      fromDate: fromDate,
      toDate: toDate,
      selectedNiche: selectedNiche,
      selectedCountry: selectedCountry,
    ));
  }
  }
}