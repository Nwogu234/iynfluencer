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
      this.iV});

  JobBids.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    jobId = json['jobId'];
    influencerId = json['influencerId'];
    coverLetter = json['coverLetter'];
    price = json['price'];
    terms = json['terms'].cast<String>();
    status = json['status'];
    bidId = json['bidId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
