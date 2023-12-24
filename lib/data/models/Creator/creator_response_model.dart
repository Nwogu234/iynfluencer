class CreatorProfile {
  final String status;
  final String message;
  final CreatorData data;

  CreatorProfile ({required this.status, required this.message, required this.data});

  factory CreatorProfile .fromJson(Map<String, dynamic> json) {
    return CreatorProfile (
      status: json['status'],
      message: json['message'],
      data: CreatorData.fromJson(json['data']),
    );
  }
}

class CreatorData {
  final String id;
  final String userId;
  final List<String> niche;
  final String bio;
  final bool completed;
  final bool suspended;
  final String creatorId;
  final String createdAt;
  final String updatedAt;

  CreatorData({
    required this.id,
    required this.userId,
    required this.niche,
    required this.bio,
    required this.completed,
    required this.suspended,
    required this.creatorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreatorData.fromJson(Map<String, dynamic> json) {
    return CreatorData(
      id: json['_id'],
      userId: json['userId'],
      niche: List<String>.from(json['niche']),
      bio: json['bio'],
      completed: json['completed'],
      suspended: json['suspended'],
      creatorId: json['creatorId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
