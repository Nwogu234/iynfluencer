import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

class JobResponse {
  final String status;
  final String message;
  final JobData data;

  JobResponse(
      {required this.status, required this.message, required this.data});

  factory JobResponse.fromJson(Map<String, dynamic> json) {
    return JobResponse(
      status: json['status'],
      message: json['message'],
      data: JobData.fromJson(json['data']),
    );
  }
}

class JobData {
  final List<Job> docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int? prevPage;
  final int? nextPage;

  JobData({
    required this.docs,
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory JobData.fromJson(Map<String, dynamic> json) {
    return JobData(
      docs: (json['docs'] as List).map((i) => Job.fromJson(i)).toList(),
      totalDocs: json['totalDocs'],
      limit: json['limit'],
      totalPages: json['totalPages'],
      page: json['page'],
      pagingCounter: json['pagingCounter'],
      hasPrevPage: json['hasPrevPage'],
      hasNextPage: json['hasNextPage'],
      prevPage: json['prevPage'],
      nextPage: json['nextPage'],
    );
  }
}

class Job {
  final String? id;
  final String? creatorId;
  final String? title;
  final String? description;
  final List<String>? responsibilities;
  final List<String>? category;
  final int? budgetFrom;
  final int? budgetTo;
  final int? duration;
  final bool? public;
  final bool? hired;
  final bool? suspended;
  final String? jobId;
  final String? createdAt;
  final String? updatedAt;
  final int? version;
  final String? status;
  final List<JobBid>? bids;
  final Creator? creator;
  final int? bidsCount;
  final User? user;

  Job(
      {this.id,
      this.creatorId,
      this.title,
      this.description,
      this.responsibilities,
      this.category,
      this.budgetFrom,
      this.budgetTo,
      this.duration,
      this.public,
      this.hired,
      this.suspended,
      this.jobId,
      this.createdAt,
      this.updatedAt,
      this.version,
      this.status,
      this.bids,
      this.creator,
      this.bidsCount,
      this.user});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'budgetFrom': budgetFrom,
      'budgetTo': budgetTo,
      'description': description,
      'duration': duration,
      'id': id,
      'creatorId': creatorId,
      'public': public,
      'hired': hired,
      'suspended': suspended,
      'jobId': jobId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'version': version,
      'status': status,
      'bids': bids?.map((bids) => bids.toJson()).toList(),
      'bidsCount': bidsCount,
      'creator': creator,
      "user": user
    };
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['_id'],
      creatorId: json['creatorId'],
      title: json['title'],
      description: json['description'],
      responsibilities: List<String>.from(json['responsibilities']),
      category: List<String>.from(json['category']),
      budgetFrom: json['budgetFrom'],
      budgetTo: json['budgetTo'],
      duration: json['duration'],
      public: json['public'],
      hired: json['hired'],
      suspended: json['suspended'],
      jobId: json['jobId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
      status: json['status'],
      bids: json['bids'] != null
          ? (json['bids'] as List).map((i) => JobBid.fromJson(i)).toList()
          : null,
      bidsCount: json['bidsCount'],
      // creator:
      //     (json['creator'] as List).map((i) => Creator.fromJson(i)).toList(),
      // user: (json['user'] as List?)!
      //     .map((i) => User.fromJson(i as Map<String, dynamic>))
      //     .toList(),
      creator: json['creator'] != null
          ? new Creator.fromJson(json['creator'])
          : null,
      user: json['user'] != null ? new User.fromJson(json['user']) : null,
    );
  }
}

class JobBid {
  String? id;
  String? jobId;
  String? influencerId;
  String? coverLetter;
  int? price;
  String? status;
  String? bidId;
  String? createdAt;
  String? updatedAt;
  int? version;

  JobBid({
     this.id,
     this.jobId,
     this.influencerId,
     this.coverLetter,
     this.price,
     this.status,
     this.bidId,
     this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory JobBid.fromJson(Map<String, dynamic> json) {
    return JobBid(
      id: json['_id'],
      jobId: json['jobId'],
      influencerId: json['influencerId'],
      coverLetter: json['coverLetter'],
      price: json['price'],
      status: json['status'],
      bidId: json['bidId'],
      createdAt : json['createdAt'],
      updatedAt : json['updatedAt'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'influencerId': influencerId,
      'coverLetter': coverLetter,
      'price': price,
      'status': status,
      'bidId': bidId,
      'createdAt' : createdAt,
      'updatedAt' : updatedAt,
      'version': version,
    };
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
