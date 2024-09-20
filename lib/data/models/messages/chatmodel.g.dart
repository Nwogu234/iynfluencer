// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatDataAdapter extends TypeAdapter<ChatData> {
  @override
  final int typeId = 0;

  @override
  ChatData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatData(
      id: fields[0] as String,
      creatorId: fields[1] as String,
      influencerId: fields[2] as String,
      creatorUserId: fields[3] as String,
      influencerUserId: fields[4] as String,
      unreadByCreator: fields[5] as int,
      unreadByInfluencer: fields[6] as int,
      blockedByCreator: fields[7] as bool,
      blockedByInfluencer: fields[8] as bool,
      chatId: fields[9] as String,
      createdAt: fields[10] as DateTime,
      updatedAt: fields[11] as DateTime,
      messages: (fields[12] as List).cast<Message>(),
      creatorUser: fields[13] as UserModel?,
      influencerUser: fields[14] as UserModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ChatData obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creatorId)
      ..writeByte(2)
      ..write(obj.influencerId)
      ..writeByte(3)
      ..write(obj.creatorUserId)
      ..writeByte(4)
      ..write(obj.influencerUserId)
      ..writeByte(5)
      ..write(obj.unreadByCreator)
      ..writeByte(6)
      ..write(obj.unreadByInfluencer)
      ..writeByte(7)
      ..write(obj.blockedByCreator)
      ..writeByte(8)
      ..write(obj.blockedByInfluencer)
      ..writeByte(9)
      ..write(obj.chatId)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.messages)
      ..writeByte(13)
      ..write(obj.creatorUser)
      ..writeByte(14)
      ..write(obj.influencerUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      email: fields[3] as String?,
      password: fields[4] as String?,
      termsAndConditionsAgreement: fields[5] as bool?,
      isNewUser: fields[6] as bool?,
      isSocial: fields[7] as bool?,
      verified: fields[8] as bool?,
      verifiedEmail: fields[9] as bool?,
      followers: fields[10] as int?,
      following: fields[11] as int?,
      views: fields[12] as int?,
      userId: fields[13] as String?,
      createdAt: fields[14] as String?,
      updatedAt: fields[15] as String?,
      creatorId: fields[16] as String?,
      influencerId: fields[17] as String?,
      country: fields[18] as String?,
      dob: fields[19] as String?,
      phone: fields[20] as String?,
      username: fields[21] as String?,
      avatar: fields[22] as String?,
      cover: fields[23] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.termsAndConditionsAgreement)
      ..writeByte(6)
      ..write(obj.isNewUser)
      ..writeByte(7)
      ..write(obj.isSocial)
      ..writeByte(8)
      ..write(obj.verified)
      ..writeByte(9)
      ..write(obj.verifiedEmail)
      ..writeByte(10)
      ..write(obj.followers)
      ..writeByte(11)
      ..write(obj.following)
      ..writeByte(12)
      ..write(obj.views)
      ..writeByte(13)
      ..write(obj.userId)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt)
      ..writeByte(16)
      ..write(obj.creatorId)
      ..writeByte(17)
      ..write(obj.influencerId)
      ..writeByte(18)
      ..write(obj.country)
      ..writeByte(19)
      ..write(obj.dob)
      ..writeByte(20)
      ..write(obj.phone)
      ..writeByte(21)
      ..write(obj.username)
      ..writeByte(22)
      ..write(obj.avatar)
      ..writeByte(23)
      ..write(obj.cover);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final int typeId = 2;

  @override
  Message read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Message(
      id: fields[0] as String,
      chatId: fields[1] as String,
      authorId: fields[2] as String,
      text: fields[3] as String,
      authorUserId: fields[4] as String,
      blockedByRecipient: fields[5] as bool,
      messageId: fields[6] as String,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
      isCompleteMessage: fields[9] as bool?,
      status: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chatId)
      ..writeByte(2)
      ..write(obj.authorId)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.authorUserId)
      ..writeByte(5)
      ..write(obj.blockedByRecipient)
      ..writeByte(6)
      ..write(obj.messageId)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.isCompleteMessage)
      ..writeByte(10)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
