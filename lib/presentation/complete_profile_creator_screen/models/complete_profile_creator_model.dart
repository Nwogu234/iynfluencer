/// This class defines the variables used in the [complete_profile_creator_screen],
/// and is typically used to hold data that is passed between different parts of the application.
import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

class CompleteProfileCreatorModel {
  String bio;
  List<String> niches;
  List<User>? user;// Update this to be a list of strings

  CompleteProfileCreatorModel({
    required this.bio,
    required this.niches,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'niche': niches,
    };
  }
}
