import 'dart:convert';
import 'dart:io';

class ReviewRequest {
  final String influencerId;
  final String creatorId;
  final String jobId;
  final List<String> proof;

  ReviewRequest({
    required this.influencerId,
    required this.creatorId,
    required this.jobId,
    required this.proof,
  });

  
  factory ReviewRequest.fromJson(Map<String, dynamic> json) {
    return ReviewRequest(
      influencerId: json['influencerId'] as String,
      creatorId: json['creatorId'] as String,
      jobId: json['jobId'] as String,
      proof: List<String>.from(json['proof'] as List<dynamic>),
    );
  }

  // Convert a ReviewRequest instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'influencerId': influencerId,
      'creatorId': creatorId,
      'jobId': jobId,
      'proof': proof,
    };
  }
}