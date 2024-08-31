import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'listgroup855_item_model.dart';

/// This class defines the variables used in the [jobs_requests_influencer_page],
/// and is typically used to hold data that is passed between different parts of the application.
class JobsRequestsInfluencerModel {
  String? sId;
  String? jobId;
  String? creatorId;
  String? creatorUserId; 
  String? influencerId;
  String? status;
  bool? declined;
  String? jobRequestId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Job? job;
  CreatorUserData? creatorUserData; 
  String? id;

  JobsRequestsInfluencerModel({
    this.sId,
    this.jobId,
    this.creatorId,
    this.creatorUserId,
    this.influencerId,
    this.status,
    this.declined,
    this.jobRequestId,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.job,
    this.creatorUserData,
    this.id,
  });

  JobsRequestsInfluencerModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    jobId = json['jobId'];
    creatorId = json['creatorId'];
    creatorUserId = json['creatorUserId'];
    influencerId = json['influencerId'];
    status = json['status'];
    declined = json['declined'];
    jobRequestId = json['jobRequestId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
    creatorUserData = json['creatorUserData'] != null 
        ? CreatorUserData.fromJson(json['creatorUserData'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['jobId'] = jobId;
    data['creatorId'] = creatorId;
    data['creatorUserId'] = creatorUserId; // New field
    data['influencerId'] = influencerId;
    data['status'] = status;
    data['declined'] = declined;
    data['jobRequestId'] = jobRequestId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (job != null) {
      data['job'] = job!.toJson();
    }
    if (creatorUserData != null) {
      // New field
      data['creatorUserData'] = creatorUserData!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class CreatorUserData {
  String? sId;
  String? firstName;
  String? lastName;
  String? userId;
  String? avatar;
  String? country;

  CreatorUserData({
    this.sId,
    this.firstName,
    this.lastName,
    this.userId,
    this.country,
  });

  CreatorUserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userId = json['userId'];
    avatar = json['avatar'];
    avatar = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userId'] = userId;
    data['avatar'] = avatar;
    data['country'] = country;
    return data;
  }
}
