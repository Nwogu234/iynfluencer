class StartChatModel {
  final String creatorId;
  final String creatorUserId;
  final String influencerId;
  final String influencerUserId;

  StartChatModel({
    required this.creatorId,
    required this.creatorUserId,
    required this.influencerId,
    required this.influencerUserId,
  });

  factory StartChatModel.fromJson(Map<String, dynamic> json) {
    return StartChatModel(
      creatorId: json['creatorId'],
      creatorUserId: json['creatorUserId'],
      influencerId: json['influencerId'],
      influencerUserId: json['influencerUserId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'creatorId': creatorId,
      'creatorUserId': creatorUserId,
      'influencerId': influencerId,
      'influencerUserId': influencerUserId,
    };
  }
}

class ChatData {
  final String status;
  final String message;
  final String startChatId;
  final String creatorId;
  final String creatorUserId;
  final String influencerId;
  final String influencerUserId;
  final int unreadByCreator;
  final int unreadByInfluencer;
  final bool blockedByCreator;
  final bool blockedByInfluencer;
  final String chatId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ChatData({
    required this.status,
    required this.message,
    required this.startChatId,
    required this.creatorId,
    required this.creatorUserId,
    required this.influencerId,
    required this.influencerUserId,
    required this.unreadByCreator,
    required this.unreadByInfluencer,
    required this.blockedByCreator,
    required this.blockedByInfluencer,
    required this.chatId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
      status: json['status'],
      message: json['message'],
      startChatId: json['data']['_id'],
      creatorId: json['data']['creatorId'],
      creatorUserId: json['data']['creatorUserId'],
      influencerId: json['data']['influencerId'],
      influencerUserId: json['data']['influencerUserId'],
      unreadByCreator: json['data']['unreadByCreator'],
      unreadByInfluencer: json['data']['unreadByInfluencer'],
      blockedByCreator: json['data']['blockedByCreator'],
      blockedByInfluencer: json['data']['blockedByInfluencer'],
      chatId: json['data']['chatId'],
      createdAt: DateTime.parse(json['data']['createdAt']),
      updatedAt: DateTime.parse(json['data']['updatedAt']),
    );
  }
}
