import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/search_filter_bottomsheet/models/search_filter_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SearchFilterBottomsheet.
///
/// This class manages the state of the SearchFilterBottomsheet, including the
/// current searchFilterModelObj
class SearchFilterController extends GetxController {
  TextEditingController frametwelveController = TextEditingController();

  TextEditingController frametwelveoneController = TextEditingController();

  Rx<SearchFilterModel> searchFilterModelObj = SearchFilterModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  @override
  void onClose() {
    super.onClose();
    frametwelveController.dispose();
    frametwelveoneController.dispose();
  }

  onSelected(SelectionPopupModel value) {
  selectedDropDownValue = value; 
  for (var element in searchFilterModelObj.value.dropdownItemList.value) {
    element.isSelected = false;
    if (element.id == value.id) {
      element.isSelected = true;
    }
  }
  searchFilterModelObj.value.dropdownItemList.refresh();
}

  onSelected1(SelectionPopupModel value) {
  selectedDropDownValue1 = value; 
  for (var element in searchFilterModelObj.value.dropdownItemList1.value) {
    element.isSelected = false;
    if (element.id == value.id) {
      element.isSelected = true;
    }
  }
  searchFilterModelObj.value.dropdownItemList1.refresh();
}

}
