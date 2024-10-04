import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

class JobBids {
  String? sId;
  String? jobId;
  String? influencerId;
  String? coverLetter;
  int? price;
  List<String>? terms;
  String? status;
  String? bidId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? hired;
  String? hiredId;
  Influencers? influencer;
  String? id;
  bool? paymentStatus;

  JobBids(
      {this.sId,
      this.jobId,
      this.influencerId,
      this.coverLetter,
      this.price,
      this.terms,
      this.status,
      this.bidId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.hired,
      this.hiredId,
      this.influencer,
      this.id,
      this.paymentStatus});

  JobBids.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    jobId = json['jobId'] ?? '';
    influencerId = json['influencerId'] ?? '';
    coverLetter = json['coverLetter'] ?? '';
    price = json['price'] ?? 0;
    terms = json['terms'] != null 
      ? List<String>.from(json['terms']) 
      : [];
    status = json['status'] ?? '';
    bidId = json['bidId'] ?? '';
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
    iV = json['__v'] ?? 0;
    hired = json['hired'] ?? false;
    hiredId = json['hiredId'] ?? '';
    influencer = json['influencer'] != null
        ? new Influencers.fromJson(json['influencer'])
        : null;
    id = json['id'] ?? '';
    paymentStatus =
        json['paymentStatus'] != null ? json['paymentStatus'] : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['jobId'] = this.jobId;
    data['influencerId'] = this.influencerId;
    data['coverLetter'] = this.coverLetter;
    data['price'] = this.price;
    data['terms'] = this.terms;
    data['status'] = this.status;
    data['bidId'] = this.bidId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['hired'] = this.hired;
    data['hiredId'] = this.hiredId;
    if (this.influencer != null) {
      data['influencer'] = this.influencer!.toJson();
    }
    data['id'] = this.id;
    data['paymentStatus'] = this.paymentStatus;
    return data;
  }
}

class Influencers {
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
  int? iV;
  User? user;

  Influencers(
      {this.sId,
      this.userId,
      this.niche,
      this.bio,
      this.completed,
      this.socials,
      this.suspended,
      this.influencerId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.user});

  Influencers.fromJson(Map<String, dynamic> json) {
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
    iV = json['__v'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    data['__v'] = this.iV;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
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

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool? termsAndConditionsAgreement;
  bool? isNewUser;
  bool? isSocial;
  bool? verified;
  bool? verifiedEmail;
  int? followers;
  int? following;
  int? views;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? creatorId;
  String? influencerId;
  String? country;
  String? dob;
  String? phone;
  String? username;
  String? avatar;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.termsAndConditionsAgreement,
      this.isNewUser,
      this.isSocial,
      this.verified,
      this.verifiedEmail,
      this.followers,
      this.following,
      this.views,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.creatorId,
      this.influencerId,
      this.country,
      this.dob,
      this.phone,
      this.username,
      this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    termsAndConditionsAgreement = json['termsAndConditionsAgreement'];
    isNewUser = json['isNewUser'];
    isSocial = json['isSocial'];
    verified = json['verified'];
    verifiedEmail = json['verifiedEmail'];
    followers = json['followers'];
    following = json['following'];
    views = json['views'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    creatorId = json['creatorId'];
    influencerId = json['influencerId'];
    country = json['country'];
    dob = json['dob'];
    phone = json['phone'];
    username = json['username'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['termsAndConditionsAgreement'] = this.termsAndConditionsAgreement;
    data['isNewUser'] = this.isNewUser;
    data['isSocial'] = this.isSocial;
    data['verified'] = this.verified;
    data['verifiedEmail'] = this.verifiedEmail;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['views'] = this.views;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['creatorId'] = this.creatorId;
    data['influencerId'] = this.influencerId;
    data['country'] = this.country;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Creator {
  final String? id;
  final String? userId;
  final String? creatorId;

  Creator({
    this.id,
    this.userId,
    this.creatorId,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json['_id'],
      userId: json['userId'],
      creatorId: json['creatorId'],
    );
  }
}

//
//
//THIS IS FOR POSTING JOBS
class JobRequest {
  final String? title;
  final List<String>? category;
  final int? budgetFrom;
  final int? budgetTo;
  final String? description;
  final int? duration;
  final List<String>? responsibilities;

  JobRequest({
    required this.title,
    required this.category,
    required this.budgetFrom,
    required this.budgetTo,
    required this.description,
    required this.duration,
    required this.responsibilities,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'budgetFrom': budgetFrom,
      'budgetTo': budgetTo,
      'description': description,
      'duration': duration,
      'responsibilities': responsibilities,
    };
  }

  factory JobRequest.fromJson(Map<String, dynamic> json) {
    return JobRequest(
      title: json['title'],
      category: List<String>.from(json['category']),
      budgetFrom: json['budgetFrom'],
      budgetTo: json['budgetTo'],
      description: json['description'],
      duration: json['duration'],
      responsibilities: List<String>.from(json['responsibilities']),
    );
  }
}

//Send Job Request By Mostly Creators
class SendJobRequest {
  String? jobId;
  String? influencerId;

  SendJobRequest({this.jobId, this.influencerId});

  SendJobRequest.fromJson(Map<String, dynamic> json) {
    jobId = json['jobId'];
    influencerId = json['influencerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobId'] = this.jobId;
    data['influencerId'] = this.influencerId;
    return data;
  }
}
