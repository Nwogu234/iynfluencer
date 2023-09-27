import 'package:iynfluencer/data/models/Jobs/job_model.dart';

import '../use_model/user_model.dart';
import '../Socials/social.dart';

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
