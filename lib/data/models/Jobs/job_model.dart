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
       docs: (json['docs'] as List<dynamic>).map((i) => Job.fromJson(i as Map<String, dynamic>)).toList(),
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
  final  String? influencerId;
  final bool? suspended;
  final String? jobId;
  final String? createdAt;
  final String? updatedAt;
  final int? version;
  final String? status;
  final List<Influencerz>? influencerz;
  final List<JobBid>? bids;
  final List<Creator>? creator;
  final List<Review>? review;
  final int? bidsCount;
  final List <User>? user;

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
      this.influencerId,
      this.suspended,
      this.jobId,
      this.createdAt,
      this.updatedAt,
      this.version,
      this.status,
      this.influencerz,
      this.bids,
      this.creator,
      this.review,
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
      'influencerId': influencerId,
      'public': public,
      'hired': hired,
      'suspended': suspended,
      'jobId': jobId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'version': version,
      'status': status,
      'influencer':  influencerz?.map((b) => b.toJson()).toList(),
      'bids': bids?.map((b) => b.toJson()).toList(),
      'bidsCount': bidsCount,
      'creator': creator?.map((b) => b.toJson()).toList(),
      'review': review?.map((b) => b.toJson()).toList(),
      'user': user?.map((b) => b.toJson()).toList(),
    };
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['_id'],
      creatorId: json['creatorId'],
      title: json['title'],
      description: json['description'],
      responsibilities: (json['responsibilities'] as List?)?.map((e) => e as String).toList(),
      category: (json['category'] as List?)?.map((e) => e as String).toList(),
      budgetFrom: json['budgetFrom'],
      budgetTo: json['budgetTo'],
      duration: json['duration'],
      influencerId: json['influencerId'],
      public: json['public'],
      hired: json['hired'],
      suspended: json['suspended'],
      jobId: json['jobId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
      status: json['status'],
      bids: json['bids'] is List
        ? (json['bids'] as List<dynamic>?)?.map((i) => JobBid.fromJson(i)).toList()
        : null,  
      bidsCount: json['bidsCount'],
      influencerz: json['influencer'] is List
        ? (json['influencer'] as List<dynamic>?)?.map((i) => Influencerz.fromJson(i)).toList()
        : null,  
      creator: json['creator'] is List
        ? (json['creator'] as List<dynamic>?)?.map((e) => Creator.fromJson(e)).toList()
        : null,  
      review: json['review'] is List
        ? (json['review'] as List<dynamic>?)?.map((e) => Review.fromJson(e)).toList()
        : null,  
      user: json['user'] is List
        ? (json['user'] as List<dynamic>?)?.map((e) => User.fromJson(e)).toList()
        : null,  
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
  bool? paymentStatus;

  JobBid(
      {this.id,
      this.jobId,
      this.influencerId,
      this.coverLetter,
      this.price,
      this.status,
      this.bidId,
      this.createdAt,
      this.updatedAt,
      this.version,
      this.paymentStatus});

  factory JobBid.fromJson(Map<String, dynamic> json) {
    return JobBid(
        id: json['_id'],
        jobId: json['jobId'],
        influencerId: json['influencerId'],
        coverLetter: json['coverLetter'],
        price: json['price'],
        status: json['status'],
        bidId: json['bidId'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        version: json['version'],
        paymentStatus: json['paymentStatus']);
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'version': version,
    };
  }
}

class Creator {
  final String? id;
  final String? userId;
  final String? creatorId;
  final User? user;

  Creator({this.id, this.userId, this.creatorId, this.user});

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json['_id'],
      userId: json['userId'],
      creatorId: json['creatorId'],
      user: json['user'] != null ? new User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'creatorId': creatorId,
      'user': user?.toJson(), 
    };
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


class Review {
  final String id;
  final String influencerId;
  final String creatorId;
  final String jobId;
  final List<String> proof;
  final String createdAt;
  final String updatedAt;

  Review({
    required this.id,
    required this.influencerId,
    required this.creatorId,
    required this.jobId,
    required this.proof,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'],
      influencerId: json['influencerId'],
      creatorId: json['creatorId'],
      jobId: json['jobId'],
      proof: List<String>.from(json['proof']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'influencerId': influencerId,
      'creatorId': creatorId,
      'jobId': jobId,
      'proof': proof,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      
    };
  }
} 


class Influencerz {
  String id;
  String userId;
  String influencerId;

  Influencerz({required this.id, required this.userId, required this.influencerId});

  factory Influencerz.fromJson(Map<String, dynamic> json) {
    return Influencerz(
      id: json['_id'],
      userId: json['userId'],
      influencerId: json['influencerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'influencerId':influencerId
    
    };
  }
}





