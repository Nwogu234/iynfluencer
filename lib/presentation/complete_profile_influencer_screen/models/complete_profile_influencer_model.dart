/// This class defines the variables used in the [complete_profile_influencer_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CompleteProfileInfluencerModel {

  String bio;
  List<String> niches; // Update this to be a list of strings
  List<Social> socials;

  CompleteProfileInfluencerModel({
    required this.bio,
    required this.niches,
    required this.socials,
  });

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'niche': niches,
      'socials': socials.map((social) => social.toJson()).toList(),
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
