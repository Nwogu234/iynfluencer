///SelectionPopupModel is common model
///used for setting data into dropdowns
class SelectionPopupModel {
  int? id;
  String title;
  dynamic value;
  bool isSelected;
  String? flag;
  String? code;

  SelectionPopupModel(
      {this.id,
      required this.title,
      this.value,
      this.isSelected = false,
      this.flag,
      this.code
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectionPopupModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          value == other.value &&
          flag == other.flag &&
          code == other.code;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ value.hashCode ^ flag.hashCode ^ code.hashCode;

  @override
  String toString() {
    return 'SelectionPopupModel {id: $id, title: $title, value: $value, isSelected: $isSelected, flag: $flag, code: $code }';
  }
}
