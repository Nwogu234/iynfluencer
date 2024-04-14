import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

class ChatResponse{
 final String status;
  final String message;
  final ChatData chatData;

  ChatResponse({required this.status, required this.message, required this.chatData});

   factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      status: json['status'],
      message: json['message'],
      chatData: ChatData.fromJson(json['chatData']),
    );
  }
}



class ChatData {
  final String id;
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
  final List<Message> messages;
  final Influencer? influencer;

  ChatData({
    required this.id,
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
    required this.messages,
    this.influencer
  });

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
      id: json['_id'],
      creatorId: json['creatorId'],
      creatorUserId: json['creatorUserId'],
      influencerId: json['influencerId'],
      influencerUserId: json['influencerUserId'],
      unreadByCreator: json['unreadByCreator'],
      unreadByInfluencer: json['unreadByInfluencer'],
      blockedByCreator: json['blockedByCreator'],
      blockedByInfluencer: json['blockedByInfluencer'],
      chatId: json['chatId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      messages: List<Message>.from(json['messages'].map((x) => Message.fromJson(x))),
      influencer: json['influencer'] != null ? new Influencer.fromJson(json['influencer']) : null,
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'creatorUserId': creatorUserId,
      'influencerId': influencerId,
      'infleuncerUserId': influencerUserId,
      'unreadByCreator': unreadByCreator,
      'unreadByInfluencer': unreadByInfluencer,
      'blockedByCreator': blockedByCreator,
      'blockedByInfluencer': blockedByInfluencer,
      'chatId': chatId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'messages': messages
    };
  }
}



class Message {
  final String id;
  final String chatId;
  final String authorId;
  final String text;
  final String authorUserId;
  final bool blockedByRecipient;
  final String messageId;
  final DateTime createdAt;
  final DateTime updatedAt;
  //final User? user;


  Message({
    required this.id,
    required this.chatId,
    required this.authorId,
    required this.text,
    required this.authorUserId,
    required this.blockedByRecipient,
    required this.messageId,
    required this.createdAt,
    required this.updatedAt,
   // this.user
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      chatId: json['chatId'],
      authorId: json['authorId'],
      text: json['text'],
      authorUserId: json['authorUserId'],
      blockedByRecipient: json['blockedByRecipient'],
      messageId: json['messageId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    //  user: json['user'] != null ? new User.fromJson(json['user']) : null,

    );
  }
}

