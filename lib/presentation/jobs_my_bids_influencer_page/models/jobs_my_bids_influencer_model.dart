import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
//import 'package:iynfluencer/data/models/Jobs/job_model.dart';
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

 class Jobs {
  String id;
  String creatorId;
  String title;
  String description;
  List<String> responsibilities;
  List<String> category;
  int budgetFrom;
  int budgetTo;
  int duration;
  bool public;
  bool hired;
  bool suspended;
  String jobId;
  DateTime createdAt;
  DateTime updatedAt;
  String? influencerId;
  String? hiredId;
  final int? version;

  Jobs({
    required this.id,
    required this.creatorId,
    required this.title,
    required this.description,
    required this.responsibilities,
    required this.category,
    required this.budgetFrom,
    required this.budgetTo,
    required this.duration,
    required this.public,
    required this.hired,
    required this.suspended,
    required this.jobId,
    required this.createdAt,
    required this.updatedAt,
    this.influencerId,
    this.hiredId,
    this.version,
  });

  factory Jobs.fromJson(Map<String, dynamic> json) {
    var responsibilitiesFromJson = json['responsibilities'];
    List<String> responsibilitiesList = responsibilitiesFromJson != null
        ? List<String>.from(responsibilitiesFromJson)
        : [];
    var categoryFromJson = json['category'];
    List<String> categoryList = categoryFromJson != null
        ? List<String>.from(categoryFromJson)
        : [];

    return Jobs(
      id: json['_id'],
      creatorId: json['creatorId'],
      title: json['title'],
      description: json['description'],
      responsibilities: responsibilitiesList,
      category: categoryList,
      budgetFrom: json['budgetFrom'],
      budgetTo: json['budgetTo'],
      duration: json['duration'],
      public: json['public'],
      hired: json['hired'],
      suspended: json['suspended'],
      jobId: json['jobId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      influencerId: json['influencerId'],
      hiredId: json['hiredId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'creatorId': creatorId,
      'title': title,
      'description': description,
      'responsibilities': responsibilities,
      'category': category,
      'budgetFrom': budgetFrom,
      'budgetTo': budgetTo,
      'duration': duration,
      'public': public,
      'hired': hired,
      'suspended': suspended,
      'jobId': jobId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'influencerId': influencerId,
      'hiredId': hiredId,
    };
  }
}
