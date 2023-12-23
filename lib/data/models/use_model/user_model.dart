class UserModel {
  final String id;
  String avatar;
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
  final String? country;
  final String? dob;
  final String? influencerId;
  final String? phone;
  String?  countryCode;

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
    required this.phone,
    required this.country,
    required this.dob,
    required this.avatar,
     this.countryCode
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
      avatar: json['avatar']??'',
      country: json["country"]??null,
      dob: json['dob'] != null ? json['dob'] : null,      createdAt: DateTime.parse(json['createdAt'] as String) ?? DateTime.now(),
      updatedAt: DateTime.parse(json['updatedAt'] as String) ?? DateTime.now(),
      creatorId: json['creatorId'] ?? null,
      phone: json['phone']?? null,
      influencerId: json['influencerId'] ?? null,
    );
  }
}

class UpdateUser {
  final String userName;
  final String phoneNumber;
  final String dob;
  final String country;

  UpdateUser({
    required this.userName,
    required this.phoneNumber,
    required this.country,
    required this.dob,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'phone': phoneNumber,
      'country': country,
      'dob': dob, // Convert DateTime to string
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
