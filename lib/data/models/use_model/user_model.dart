import 'dart:io';

class UserModel {
  final String id;
  final String avatar;
  final String firstName;
  final String lastName;
  final String email;
  final bool termsAndConditionsAgreement;
  final bool isNewUser;
  final bool isSocial;
  final bool verified;
  final bool verifiedEmail;
  final int followers;
  final int following;
  final int views;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? creatorId;
  final String? influencerId;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.termsAndConditionsAgreement,
    required this.isNewUser,
    required this.isSocial,
    required this.verified,
    required this.verifiedEmail,
    required this.followers,
    required this.following,
    required this.views,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.creatorId,
    required this.influencerId,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      termsAndConditionsAgreement: json['termsAndConditionsAgreement'] ?? false,
      isNewUser: json['isNewUser'] ?? false,
      isSocial: json['isSocial'] ?? false,
      verified: json['verified'] ?? false,
      verifiedEmail: json['verifiedEmail'] ?? false,
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      views: json['views'] ?? 0,
      userId: json['userId'] ?? '',
      avatar: json['avatar'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String) ?? DateTime.now(),
      updatedAt: DateTime.parse(json['updatedAt'] as String) ?? DateTime.now(),
      creatorId: json['creatorId'] ?? null,
      influencerId: json['influencerId'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'termsAndConditionsAgreement': termsAndConditionsAgreement,
      'isNewUser': isNewUser,
      'isSocial': isSocial,
      'verified': verified,
      'verifiedEmail': verifiedEmail,
      'followers': followers,
      'following': following,
      'views': views,
      'userId': userId,
      'avatar': avatar,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'creatorId': creatorId,
      'influencerId': influencerId,
    };
  }
}

class EditProfileArguments {
  final String firstName;
  final String lastName;
  final String country;
  final String profileImage;
  final String bio;

  EditProfileArguments(
      this.firstName, this.lastName, this.country, this.profileImage, this.bio);
}
