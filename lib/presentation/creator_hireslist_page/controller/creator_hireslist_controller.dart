import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/creator_hireslist_page/models/creator_hireslist_model.dart';/// A controller class for the CreatorHireslistPage.
///
/// This class manages the state of the CreatorHireslistPage, including the
/// current creatorHireslistModelObj
class CreatorHireslistController extends GetxController {CreatorHireslistController(this.creatorHireslistModelObj);

Rx<CreatorHireslistModel> creatorHireslistModelObj;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in creatorHireslistModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} creatorHireslistModelObj.value.dropdownItemList.refresh(); } 
 }
