import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

class JobResponsez {
  final String status;
  final String message;
  final JobDataz data;

  JobResponsez(
      {required this.status, required this.message, required this.data});

  factory JobResponsez.fromJson(Map<String, dynamic> json) {
    return JobResponsez(
      status: json['status'],
      message: json['message'],
      data: JobDataz.fromJson(json['data']),
    );
  }
}

class JobDataz {
  final List<Jobz> docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int? prevPage;
  final int? nextPage;

  JobDataz({
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

  factory JobDataz.fromJson(Map<String, dynamic> json) {
    return JobDataz(
      docs:
          (json['docs'] as List<dynamic>).map((i) => Jobz.fromJson(i)).toList(),
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

class Jobz {
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
  String? influencerId;
  final bool? suspended;
  final String? jobId;
  final String? createdAt;
  final String? updatedAt;
  final int? version;
  final int? amount;
  final String? status;
  final List<JobBidz>? bids;
  final Creatorz? creator;
  final List<Review>? review;
  final CreatorDetails? creatorDetails;
  final int? bidsCount;
  final User? user;

  Jobz(
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
      this.amount,
      this.status,
      this.bids,
      this.creator,
      this.review,
      this.creatorDetails,
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
      'amount': amount,
      'creatorDetails': creatorDetails?.toJson(),
      'status': status,
      'bids': bids?.map((b) => b.toJson()).toList(),
      'bidsCount': bidsCount,
      'creator': creator?.toJson(),
      'review': review?.map((b) => b.toJson()).toList(),
      'user': user?.toJson(),
    };
  }

  factory Jobz.fromJson(Map<String, dynamic> json) {
    return Jobz(
      id: json['_id'],
      creatorId: json['creatorId'],
      title: json['title'],
      description: json['description'],
      responsibilities:
          (json['responsibilities'] as List?)?.map((e) => e as String).toList(),
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
      amount: json['amount'],
      creatorDetails: json['creatorDetails'] != null
          ? CreatorDetails.fromJson(json['creatorDetails'])
          : null,
      status: json['status'],
      bids: (json['bids'] as List?)?.map((i) => JobBidz.fromJson(i)).toList(),
      bidsCount: json['bidsCount'],
      creator:
          json['creator'] != null ? Creatorz.fromJson(json['creator']) : null,
      review: (json['review'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e))
          .toList(),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}

class JobBidz {
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

  JobBidz(
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

  factory JobBidz.fromJson(Map<String, dynamic> json) {
    return JobBidz(
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

class Creatorz {
  final String? id;
  final String? userId;
  final String? creatorId;
  final User? user;

  Creatorz({this.id, this.userId, this.creatorId, this.user});

  factory Creatorz.fromJson(Map<String, dynamic> json) {
    return Creatorz(
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
class CreatorDetails {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? userId;
  final String? avatar;
  final String? country;

  CreatorDetails({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.userId,
    this.avatar,
    this.country,
  });

  factory CreatorDetails.fromJson(Map<String, dynamic> json) {
    return CreatorDetails(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      userId: json['userId'],
      avatar: json['avatar'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userId': userId,
      'avatar': avatar,
      'country': country,
    };
  }
}