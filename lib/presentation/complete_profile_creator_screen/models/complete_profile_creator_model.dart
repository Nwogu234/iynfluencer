/// This class defines the variables used in the [complete_profile_creator_screen],
/// and is typically used to hold data that is passed between different parts of the application.
import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

class CompleteProfileCreatorModel {
  String bio;
  List<String> niches;
  List<Social> socials;
  List<User>? user;

  CompleteProfileCreatorModel({
    required this.bio,
    required this.niches,
    required this.user,
    required this.socials,
  });

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'niche': niches,
      'user': user?.map((user) => user.toJson()).toList(),
      'social': socials.map((social) => social.toJson()).toList(),
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
  }
}
