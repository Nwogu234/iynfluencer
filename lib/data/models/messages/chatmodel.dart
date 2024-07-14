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

class ChatData {
  final String id;
  final String creatorId;
  final String influencerId;
  final String creatorUserId;
  final String influencerUserId;
  final int unreadByCreator;
  final int unreadByInfluencer;
  final bool blockedByCreator;
  final bool blockedByInfluencer;
  final String chatId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Message> messages;
  final UserModel? creatorUser;
  final UserModel? influencerUser;

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
            : null);
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
  final bool? isCompleteMessage;

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
      'isCompleteMessage': isCompleteMessage
    };
  }
}

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool? termsAndConditionsAgreement;
  bool? isNewUser;
  bool? isSocial;
  bool? verified;
  bool? verifiedEmail;
  int? followers;
  int? following;
  int? views;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? creatorId;
  String? influencerId;
  String? country;
  String? dob;
  String? phone;
  String? username;
  String? avatar;
  String? cover;

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
