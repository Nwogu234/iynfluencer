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
  final creator;
  final int? bidsCount;
  final User? user;

  Job({
    this.id,
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
    this.creator,
    this.bidsCount,
    this.user,
  });

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
      creator: Creator.fromJson(json['creator']),
      bidsCount: json['bidsCount'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}

class Creator {
  final String id;
  final String userId;
  final String creatorId;

  Creator({
    required this.id,
    required this.userId,
    required this.creatorId,
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
  final String title;
  final List<String> category;
  final int budgetFrom;
  final int budgetTo;
  final String description;
  final int duration;
  final List<String> responsibilities;

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
