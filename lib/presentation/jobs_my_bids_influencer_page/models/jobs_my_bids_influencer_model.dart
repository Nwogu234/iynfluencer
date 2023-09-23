import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'listmediainflue_item_model.dart';

/// This class defines the variables used in the [jobs_my_bids_influencer_page],
/// and is typically used to hold data that is passed between different parts of the application.
class JobsMyBidsInfluencerModel {
  String? sId;
  String? jobId;
  String? influencerId;
  String? coverLetter;
  int? price;
  String? status;
  String? bidId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Job? job;
  String? id;

  JobsMyBidsInfluencerModel(
      {this.sId,
      this.jobId,
      this.influencerId,
      this.coverLetter,
      this.price,
      this.status,
      this.bidId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.job,
      this.id});

  JobsMyBidsInfluencerModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    jobId = json['jobId'];
    influencerId = json['influencerId'];
    coverLetter = json['coverLetter'];
    price = json['price'];
    status = json['status'];
    bidId = json['bidId'];
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
    data['influencerId'] = this.influencerId;
    data['coverLetter'] = this.coverLetter;
    data['price'] = this.price;
    data['status'] = this.status;
    data['bidId'] = this.bidId;
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
