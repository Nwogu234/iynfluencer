import 'package:get/get.dart';
import 'package:iynfluencer/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../data/models/Jobs/job_model.dart';
import './hires_item_model.dart';

/// This class defines the variables used in the [creator_hireslist_page],
/// and is typically used to hold data that is passed between different parts of the application.
class CreatorHireslistModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  RxList<HiresItemModel> hiresItemList = RxList(List.generate(
      4,
      (index) => HiresItemModel(
            id: 'placeholder_id'.obs,
          )));
}
