/// This class defines the variables used in the [complete_profile_creator_screen],
/// and is typically used to hold data that is passed between different parts of the application.
import 'package:get/get.dart';

import '../../../data/models/Influencer/influencer_response_model.dart';

class CompleteProfileCreatorModel {
  String bio;
  List<String> niches;


  CompleteProfileCreatorModel({

    required this.bio,
    required this.niches,
  });

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'niche': niches,
    };
  }
}

class Social {
  String name;
  int followers;
  String url;

  Social({
    required this.name,
    required this.followers,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'followers': followers,
      'url': url,
  };
}}
