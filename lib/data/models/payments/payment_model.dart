import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';

class PaymentModel {
  final bool status;
  final String message;
  final Data data;

  PaymentModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<Payment> docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int? prevPage;
  final int? nextPage;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['docs'] as List;
    List<Payment> docsList = list.map((i) => Payment.fromJson(i)).toList();
    return Data(
      docs: docsList,
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

class Payment {
  String? id;
  String? creatorId;
  String? influencerId;
  String? jobId;
  String? bidId;
  String? reference;
  String? status;
  int? amount;
  int? baseAmount;
  List<dynamic>? history;
  bool? success;
  bool? allocated;
  String? transactionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Bid? bid;
  Influencer? influencer;
  Job? job;
  String? ids;

  Payment({
    this.id,
    this.creatorId,
    this.influencerId,
    this.jobId,
    this.bidId,
    this.reference,
    this.status,
    this.amount,
    this.baseAmount,
    this.history,
    this.success,
    this.allocated,
    this.transactionId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.bid,
    this.influencer,
    this.job,
    this.ids,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['_id'] ?? null,
      creatorId: json['creatorId'] ?? null,
      influencerId: json['influencerId'] ?? null,
      jobId: json['jobId'] ?? null,
      bidId: json['bidId'] ?? null,
      reference: json['reference'] ?? null,
      status: json['status'] ?? null,
      amount: json['amount'] ?? null,
      baseAmount: json['base_amount'] ?? null,
      history: json['history'] != null ? List<dynamic>.from(json['history']) : null,
      success: json['success'] ?? false,
      allocated: json['allocated'] ?? false,
      transactionId: json['transactionId'] ?? null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] ?? null,
      bid: json['bid'] != null ? Bid.fromJson(json['bid']) : null,
      influencer: json['influencer'] != null ? Influencer.fromJson(json['influencer']) : null,
      job: json['job'] != null ? Job.fromJson(json['job']) : null,
      ids: json['id'] ?? null,
    );
  }
}

class Bid {
  final String? id;
  final String? jobId;
  final String? influencerId;
  final String? coverLetter;
  final int? price;
  final List<dynamic>? terms;
  final String? status;
  final String? bidId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  bool? paymentStatus;

  Bid({
    this.id,
    this.jobId,
    this.influencerId,
    this.coverLetter,
    this.price,
    this.terms,
    this.status,
    this.bidId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.paymentStatus,
  });

  factory Bid.fromJson(Map<String, dynamic> json) {
    return Bid(
      id: json['_id'] ?? null,
      jobId: json['jobId'] ?? null,
      influencerId: json['influencerId'] ?? null,
      coverLetter: json['coverLetter'] ?? null,
      price: json['price'] ?? null,
      terms: json['terms'] != null ? List<dynamic>.from(json['terms']) : null,
      status: json['status'] ?? null,
      bidId: json['bidId'] ?? null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] ?? 0,
      paymentStatus: json['paymentStatus'] ?? false,
    );
  }
}

class Influencer {
  String? id;
  String? userId;
  List<String>? niche;
  String? bio;
  bool? completed;
  bool? suspended;
  String? influencerId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Influencer({
    this.id,
    this.userId,
    this.niche,
    this.bio,
    this.completed,
    this.suspended,
    this.influencerId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Influencer.fromJson(Map<String, dynamic> json) {
    return Influencer(
      id: json['_id'] ?? null,
      userId: json['userId'] ?? null,
      niche: (json['niche'] as List?)?.map((i) => i as String).toList() ?? null,
      bio: json['bio'] ?? null,
      completed: json['completed'] ?? false,
      suspended: json['suspended'] ?? false,
      influencerId: json['influencerId'] ?? null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] ?? null,
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? status;

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
    this.v,
    this.status,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['_id'] ?? null,
      creatorId: json['creatorId'] ?? null,
      title: json['title'] ?? null,
      description: json['description'] ?? null,
      responsibilities: (json['responsibilities'] as List?)?.map((i) => i as String).toList() ?? [],
      category: (json['category'] as List?)?.map((i) => i as String).toList() ?? [],
      budgetFrom: json['budgetFrom'] ?? null,
      budgetTo: json['budgetTo'] ?? null,
      duration: json['duration'] ?? null,
      public: json['public'] ?? false,
      hired: json['hired'] ?? false,
      suspended: json['suspended'] ?? false,
      jobId: json['jobId'] ?? null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] ?? null,
      status: json['status'] ?? null,
    );
  }
}