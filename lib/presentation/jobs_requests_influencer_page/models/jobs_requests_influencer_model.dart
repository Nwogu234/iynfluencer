import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'listgroup855_item_model.dart';

/// This class defines the variables used in the [jobs_requests_influencer_page],
/// and is typically used to hold data that is passed between different parts of the application.
class JobsRequestsInfluencerModel {
  String? sId;
  String? jobId;
  String? creatorId;
  String? influencerId;
  String? status;
  bool? declined;
  String? jobRequestId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Job? job;
  String? id;

  JobsRequestsInfluencerModel(
      {this.sId,
      this.jobId,
      this.creatorId,
      this.influencerId,
      this.status,
      this.declined,
      this.jobRequestId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.job,
      this.id});

  JobsRequestsInfluencerModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    jobId = json['jobId'];
    creatorId = json['creatorId'];
    influencerId = json['influencerId'];
    status = json['status'];
    declined = json['declined'];
    jobRequestId = json['jobRequestId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['jobId'] = this.jobId;
    data['creatorId'] = this.creatorId;
    data['influencerId'] = this.influencerId;
    data['status'] = this.status;
    data['declined'] = this.declined;
    data['jobRequestId'] = this.jobRequestId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}
