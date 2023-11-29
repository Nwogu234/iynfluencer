import 'package:get/get.dart';

/// This class defines the variables used in the [complete_profile_influencer_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CompleteProfileInfluencerModel {
  String bio;
  List<String> niches; // Update this to be a list of strings
  List<Social> socials;
  List<User> user;

  CompleteProfileInfluencerModel({
    required this.bio,
    required this.niches,
    required this.socials,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'niche': niches,
      'socials': socials.map((social) => social.toJson()).toList(),
      'user': user.map((user) => user.toJson()).toList(),
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

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? userId;
  final String? country;
  final String? avatar;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.country,
    required this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userId': userId,
      'country': country,
      'avatar': avatar,
    };
  }
}
