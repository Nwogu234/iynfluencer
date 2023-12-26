import 'package:iynfluencer/data/models/Jobs/job_model.dart';

import '../Socials/social.dart';

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? userId;
  final String? country;
  final String? countryCode;
  final String? avatar;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.country,
    this.countryCode,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userId: json['userId'],
      country: json['country'], // Optional field
      avatar: json['avatar'], // Optional field
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userId'] = this.userId;
    data['country'] = this.country;
    data['avatar'] = this.avatar;
    return data;
  }
}

class InfluencerResponse {
  final String status;
  final String message;
  final InfluencerData data;

  InfluencerResponse(
      {required this.status, required this.message, required this.data});

  factory InfluencerResponse.fromJson(Map<String, dynamic> json) {
    return InfluencerResponse(
      status: json['status'],
      message: json['message'],
      data: InfluencerData.fromJson(json['data']),
    );
  }
}

class InfluencerData {
  final List<Influencer> docs;
  // Other fields like totalDocs, limit, etc.

  InfluencerData({required this.docs});

  factory InfluencerData.fromJson(Map<String, dynamic> json) {
    return InfluencerData(
      docs: (json['docs'] as List).map((i) => Influencer.fromJson(i)).toList(),
    );
  }
}

class Influencer {
  final String? id;
  final String? userId;
  final List<String>? niche;
  final String? bio;
  final bool? completed;
  final List<Social>? socials;
  final bool? suspended;
  final String? influencerId;
  final int? jobsDone;
  final List<User>? user;
  final List<Job>? jobs;

  Influencer(
      {this.id,
      this.userId,
      this.niche,
      this.bio,
      this.completed,
      this.socials,
      this.suspended,
      this.influencerId,
      this.user,
      this.jobsDone,
      this.jobs});

  factory Influencer.fromJson(Map<String, dynamic> json) {
    return Influencer(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      niche: (json['niche'] as List?)?.map((i) => i as String).toList(),
      bio: json['bio'] as String?,
      completed: json['completed'] as bool?,
      socials: (json['socials'] as List?)
          ?.map((i) => Social.fromJson(i as Map<String, dynamic>))
          .toList(),
      suspended: json['suspended'] as bool?,
      influencerId: json['influencerId'] as String?,
      user: (json['user'] as List?)!
          .map((i) => User.fromJson(i as Map<String, dynamic>))
          .toList(),
      jobsDone: (json['jobsCompleted'] as int?),
      jobs: (json['jobs'] as List?)
          ?.map((i) => Job.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }
}

class InfluencerProfile {
  String? sId;
  String? userId;
  List<String>? niche;
  String? bio;
  bool? completed;
  List<Socials>? socials;
  bool? suspended;
  String? influencerId;
  String? createdAt;
  String? updatedAt;

  InfluencerProfile(
      {this.sId,
      this.userId,
      this.niche,
      this.bio,
      this.completed,
      this.socials,
      this.suspended,
      this.influencerId,
      this.createdAt,
      this.updatedAt});

  InfluencerProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    niche = json['niche'].cast<String>();
    bio = json['bio'];
    completed = json['completed'];
    if (json['socials'] != null) {
      socials = <Socials>[];
      json['socials'].forEach((v) {
        socials!.add(new Socials.fromJson(v));
      });
    }
    suspended = json['suspended'];
    influencerId = json['influencerId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['niche'] = this.niche;
    data['bio'] = this.bio;
    data['completed'] = this.completed;
    if (this.socials != null) {
      data['socials'] = this.socials!.map((v) => v.toJson()).toList();
    }
    data['suspended'] = this.suspended;
    data['influencerId'] = this.influencerId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Socials {
  String? name;
  int? followers;
  String? url;

  Socials({this.name, this.followers, this.url});

  Socials.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    followers = json['followers'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['followers'] = this.followers;
    data['url'] = this.url;
    return data;
  }
}
