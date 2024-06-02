import '../selectionPopupModel/selection_popup_model.dart';

class Social {
  String platformName;
  int followersCount;
  String platformUrl;

  Social(
      {required this.platformName,
      required this.followersCount,
      required this.platformUrl});

  factory Social.fromJson(Map<String, dynamic> json) {
    return Social(
      platformName: json['name'],
      followersCount: json['followers'],
      platformUrl: json['url'],
    );
  }
}