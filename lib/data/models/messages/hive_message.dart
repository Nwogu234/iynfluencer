import 'package:hive/hive.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chatbubble.dart';

import '../../../core/app_export.dart';

part 'hive_message.g.dart';



@HiveType(typeId: 0)
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
  final DateTime createdAt;
  @HiveField(8)
  final DateTime updatedAt;
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