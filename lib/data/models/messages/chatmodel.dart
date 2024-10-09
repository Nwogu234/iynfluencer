import 'package:hive/hive.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';

 part 'chatmodel.g.dart';

class ChatResponse {
  final String status;
  final String message;
  final Chat data;

  ChatResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      status: json['status'],
      message: json['message'],
      data: Chat.fromJson(json['data']),
    );
  }
}

class Chat {
  final List<ChatData> chatData;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final dynamic prevPage;
  final dynamic nextPage;

  Chat({
    required this.chatData,
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.prevPage,
    required this.nextPage,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatData:
          (json['chatData'] as List).map((i) => ChatData.fromJson(i)).toList(),
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

@HiveType(typeId: 0)
class ChatData extends HiveObject {
   @HiveField(0)
  final String id;
   @HiveField(1)
  final String creatorId;
   @HiveField(2)
  final String influencerId;
    @HiveField(3)
  final String creatorUserId;
    @HiveField(4)
  final String influencerUserId;
    @HiveField(5)
   int unreadByCreator;
    @HiveField(6)
   int unreadByInfluencer;
    @HiveField(7)
  final bool blockedByCreator;
     @HiveField(8)
  final bool blockedByInfluencer;
     @HiveField(9)
  final String chatId;
     @HiveField(10)
  final DateTime createdAt;
     @HiveField(11)
  final DateTime updatedAt;
     @HiveField(12)
   List<Message> messages;
      @HiveField(13)
  final UserModel? creatorUser;
      @HiveField(14)
  final UserModel? influencerUser;
      @HiveField(15)
   String? lastMessage;
      @HiveField(16)
   DateTime? lastMessageTime;

  ChatData({
    required this.id,
    required this.creatorId,
    required this.influencerId,
    required this.creatorUserId,
    required this.influencerUserId,
    required this.unreadByCreator,
    required this.unreadByInfluencer,
    required this.blockedByCreator,
    required this.blockedByInfluencer,
    required this.chatId,
    required this.createdAt,
    required this.updatedAt,
    required this.messages,
    this.creatorUser,
    this.influencerUser,
    this.lastMessage,
    this.lastMessageTime,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
        id: json['_id'],
        creatorId: json['creatorId'],
        influencerId: json['influencerId'],
        creatorUserId: json['creatorUserId'],
        influencerUserId: json['influencerUserId'],
        unreadByCreator: json['unreadByCreator'],
        unreadByInfluencer: json['unreadByInfluencer'],
        blockedByCreator: json['blockedByCreator'],
        blockedByInfluencer: json['blockedByInfluencer'],
        chatId: json['chatId'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        messages: (json['messages'] as List)
            .map((i) => Message.fromJson(i as Map<String, dynamic>))
            .toList(),
        creatorUser: json['creatorUser'] != null
            ? new UserModel.fromJson(json['creatorUser'])
            : null,
        influencerUser: json['influencerUser'] != null
            ? new UserModel.fromJson(json['influencerUser'])
            : null,
         lastMessage: json['lastMessage'] as String?,
         lastMessageTime : json['lastMessageTime'] != null
          ? DateTime.parse(json['lastMessageTime'])  // Parse only if not null
          : null,
            );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'creatorUserId': creatorUserId,
      'influencerId': influencerId,
      'influencerUserId': influencerUserId,
      'unreadByCreator': unreadByCreator,
      'unreadByInfluencer': unreadByInfluencer,
      'blockedByCreator': blockedByCreator,
      'blockedByInfluencer': blockedByInfluencer,
      'chatId': chatId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'messages': messages.map((message) => message.toJson()).toList(),
      'creatorUser': creatorUser?.toJson(),
      'influencerUser': influencerUser?.toJson(),
       'lastMessage':  lastMessage,
       'lastMessageTime':  lastMessageTime
    };
  }
}

@HiveType(typeId: 1)
class UserModel extends HiveObject{
   @HiveField(0)
  String? id;
   @HiveField(1)
  String? firstName;
    @HiveField(2)
  String? lastName;
    @HiveField(3)
  String? email;
    @HiveField(4)
  String? password;
    @HiveField(5)
  bool? termsAndConditionsAgreement;
    @HiveField(6)
  bool? isNewUser;
    @HiveField(7)
  bool? isSocial;
    @HiveField(8)
  bool? verified;
    @HiveField(9)
  bool? verifiedEmail;
    @HiveField(10)
  int? followers;
    @HiveField(11)
  int? following;
    @HiveField(12)
  int? views;
    @HiveField(13)
  String? userId;
    @HiveField(14)
  String? createdAt;
    @HiveField(15)
  String? updatedAt;
    @HiveField(16)
  String? creatorId;
    @HiveField(17)
  String? influencerId;
    @HiveField(18)
  String? country;
    @HiveField(19)
  String? dob;
    @HiveField(20)
  String? phone;
    @HiveField(21)
  String? username;
    @HiveField(22)
  String? avatar;
    @HiveField(23)
   String? cover;
    @HiveField(24)
   int? balance;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.termsAndConditionsAgreement,
    this.isNewUser,
    this.isSocial,
    this.verified,
    this.verifiedEmail,
    this.followers,
    this.balance,
    this.following,
    this.views,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.creatorId,
    this.influencerId,
    this.country,
    this.dob,
    this.phone,
    this.username,
    this.avatar,
    this.cover,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      termsAndConditionsAgreement: json['termsAndConditionsAgreement'],
      isNewUser: json['isNewUser'],
      isSocial: json['isSocial'],
      verified: json['verified'],
      verifiedEmail: json['verifiedEmail'],
      followers: json['followers'],
      balance: json['balance'],
      following: json['following'],
      views: json['views'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      creatorId: json['creatorId'],
      influencerId: json['influencerId'],
      country: json['country'],
      dob: json['dob'],
      phone: json['phone'],
      username: json['username'],
      avatar: json['avatar'],
      cover: json['cover'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['termsAndConditionsAgreement'] = this.termsAndConditionsAgreement;
    data['isNewUser'] = this.isNewUser;
    data['isSocial'] = this.isSocial;
    data['verified'] = this.verified;
    data['verifiedEmail'] = this.verifiedEmail;
    data['followers'] = this.followers;
    data['balance'] = this.balance;
    data['following'] = this.following;
    data['views'] = this.views;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['creatorId'] = this.creatorId;
    data['influencerId'] = this.influencerId;
    data['username'] = this.username;
    data['dob'] = this.dob;
    data['userId'] = this.userId;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['avatar'] = this.avatar;
    return data;
  }
}



@HiveType(typeId: 2)
class Message extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String chatId;
  @HiveField(2)
  final String authorId;
  @HiveField(3)
  final String text;
  @HiveField(4)
  final String authorUserId;
  @HiveField(5)
  final bool blockedByRecipient;
  @HiveField(6)
  final String messageId;
  @HiveField(7)
   DateTime createdAt;
  @HiveField(8)
   DateTime updatedAt;
  @HiveField(9)
  final bool? isCompleteMessage;

 @HiveField(10)
   int? status;

  
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
    this.isCompleteMessage,
    this.status = 0, 
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
      isCompleteMessage: json['isCompleteMessage'],
      status: _messageStatusFromString(json['status']),
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chatId': chatId,
      'authorId': authorId,
      'text': text,
      'authorUserId': authorUserId,
      'blockedByRecipient': blockedByRecipient,
      'messageId': messageId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isCompleteMessage': isCompleteMessage,
      'status': _messageStatusToString(),
    };
  }

  
  String _messageStatusToString() {
    switch (status) {
      case 1:
        return 'sent';
      case 2:
        return 'failed';
      default:
        return 'sending';
    }
  }

 
  static int _messageStatusFromString(String? status) {
    switch (status) {
      case 'sent':
        return 1;
      case 'failed':
        return 2;
      default:
        return 0; 
    }
  }

  Rx<MessageStatus> get messageStatus {
    switch (status) {
       case 1:
        return MessageStatus.sent.obs;
      case 2:
       return MessageStatus.failed.obs;
     default:
      return MessageStatus.sending.obs;
    }
  }
}


