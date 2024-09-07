import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:uuid/uuid.dart';
/* 
class ChatsOpenedController extends GetxController {
  final ChatData chatData;
  final Influencer? selectedInfluencer;

  ChatsOpenedController({required this.chatData, this.selectedInfluencer}) {
    messageModelObj = chatData.messages.obs;
  }

  TextEditingController messageController = TextEditingController();
  Rx<ChatsOpenedModel> chatsOpenedModelObj = ChatsOpenedModel().obs;
  var messages = <String>[].obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient _socketClient = Get.find();
  final storage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  RxList<Message> messageModelObj = <Message>[].obs;
  final message = ''.obs;
  late final RxBool isDeleted = false.obs;
  RxBool isEmojiWidgetShown = false.obs;
  RxBool isConnected = false.obs;

  void hideEmojiWidget() {
    isEmojiWidgetShown.value = !isEmojiWidgetShown.value;
  }

  void listenToNewMessages() {
    _socketClient.socket.on('onMessageCreate', (data) {
      _handleNewMessage(data);
    });
    _socketClient.socket.on('error', (errorData) {
      error.value = 'Socket Error: $errorData';
      update(); // Trigger UI update if necessary
    });
  }



  void _handleNewMessage(dynamic data) {
    print('this is working');
    print(data);

    if (data is String) {
      data = json.decode(data);
    }

    Message newMessage = Message.fromJson(data);
    print(newMessage);
    // Notify listeners for UI update
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    final String chatId = chatData.chatId;
    getUser(chatId);
  }

  Future<void> getUser(String chatId) async {
    isLoading.value = true;
    error.value = '';
    token = await storage.read(key: "token");
    try {
      // loadMessages(chatId);
      await fetchAllMessagesWithInfluencer(chatId).then((value) {
        isLoading.value = false;
      }).catchError((err) {
        isLoading.value = false;
      });
    } catch (e) {
      print('Error in getUser: $e');
      error.value = 'Failed to fetch messages';
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAllMessagesWithInfluencer(String chatId) async {
    try {
      error.value = '';

      isLoading.value = true;

      error.value = '';

      token = await storage.read(key: "token");

      print('Fetching messages for chat ID: $chatId');
      // Debug log
      final Response response = await apiClient.getAllMessages(chatId, token);

      if (response.isOk) {
        final responseData = response.body;
        final List<dynamic>? chatDataList = responseData['data']?['docs'];
        print('chatdatalist: $chatDataList');
        final List<Message> messages = [];

        if (chatDataList != null) {
          for (var chatDataJson in chatDataList) {
            final Message message = Message.fromJson(
                chatDataJson); // Assuming there's a method to parse JSON to Message
            messages.add(message);
          }

          messageModelObj.assignAll(messages);
          saveMessages(messages, chatId);
        } else {
          error('Failed to fetch messages: Data not available');
        }
      } else {
        error('Failed to fetch messages: ${response.statusText}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
      error('Failed to fetch messages');
    } finally {
      isTrendLoading.value = false;
    }
  }




  Future<void> deleteIdMessage(String deleteMessage) async {
    try {
      final token = await storage.read(key: "token");
      final chatId = chatData.chatId;
      final response =
          await apiClient.deleteMessage(chatId, deleteMessage, token!);

      if (response.isOk) {
        print('Message deleted successfully');
        isDeleted.value = true;
        // Remove the deleted message from the list
        messageModelObj
            .removeWhere((message) => message.messageId == deleteMessage);
        isDeleted.value = true;
        update();
      } else {
        if (response.statusCode == null) {
          print('Failed to delete message: Network error');
        } else {
          print(
              'Failed to delete message: ${response.statusCode}, ${response.body}');
        }
      }
    } catch (e) {
      print('Error deleting message: $e');
    }
  }

  void onTapChatCard(Influencer selectedInfluencers, ChatData chatData) async {
    if (selectedInfluencers == null) {
      print("selectedInfluencer is null");
      return;
    }

    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");

    try {
      Response existingChatResponse =
          await apiClient.getAllChatsWithInfluencers(token!);
      if (existingChatResponse.isOk && existingChatResponse.body != null) {
        //  final List<dynamic>? responseData = existingChatResponse.body;
        List<dynamic> chatListMaps = existingChatResponse.body['data']['docs'];
        List<ChatData> chatList =
            chatListMaps.map((chatMap) => ChatData.fromJson(chatMap)).toList();

        ChatData? existingChat = chatList.firstWhereOrNull(
            (chat) => chat.influencerId == selectedInfluencers.id);

        if (existingChat != null) {
          await fetchAllMessagesWithInfluencer(existingChat.chatId);
          Get.to(ChatsOpenedScreen(
            selectedInfluencer: selectedInfluencers,
            chatData: existingChat,
          ));
          return;
        } else {
          print("No existing chat found for the selected influencer");
          // No existing chat, proceed to create a new one
          final now = DateTime.now();
          final formattedTime = DateFormat('HH:mm').format(now);
          final createdAt = DateTime(
            now.year,
            now.month,
            now.day,
            int.parse(formattedTime.substring(0, 2)),
            int.parse(formattedTime.substring(3)),
            0,
          );

          String chatId = Uuid().v4();
          String creatorId = user.userModelObj.value.id;
          String creatorUserId = user.userModelObj.value.userId;

          ChatData newChat = ChatData(
            id: '',
            creatorId: creatorId,
            influencerId: selectedInfluencers.id ?? '',
            creatorUserId: creatorUserId,
            influencerUserId: selectedInfluencers.userId ?? '',
            unreadByCreator: 0,
            unreadByInfluencer: 0,
            blockedByCreator: false,
            blockedByInfluencer: false,
            chatId: chatId,
            createdAt: createdAt,
            updatedAt: createdAt,
            messages: [],
          );

          // Create the new chat
          Response createChatResponse =
              await apiClient.createChat(newChat, token);
          if (createChatResponse.isOk) {
            print('Chat created successfully');
            Map<String, dynamic> chatDataMap = createChatResponse.body;
            ChatData createdChat = ChatData.fromJson(chatDataMap);

            // Navigate to the chat screen with the new chat data
            Get.to(ChatsOpenedScreen(
              selectedInfluencer: selectedInfluencers,
              chatData: existingChat ?? createdChat,
            ));
          } else {
            print("Failed to create chat: ${createChatResponse.statusCode}");
          }
        }
      } else {
        print(
            "Failed to fetch existing chats: ${existingChatResponse.statusCode}");
      }
    } catch (e) {
      print("Error creating or fetching chat: $e");
      error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveMessages(List<Message> messages, String chatId) async {
    try {
      final List<String> serializedMessages =
          messages.map((message) => jsonEncode(message.toJson())).toList();
      final String serializedMessagesString = jsonEncode(serializedMessages);
      await storage.write(
          key: 'messages_$chatId', value: serializedMessagesString);
      print('Messages saved successfully for chat ID: $chatId');
    } catch (e) {
      print('Error saving messages: $e');
      // Handle error as needed
    }
  }

  Future<List<Message>> loadMessages(String chatId) async {
    final serializedMessagesString =
        await storage.read(key: 'messages_$chatId');

    if (serializedMessagesString != null &&
        serializedMessagesString.isNotEmpty) {
      final List<dynamic> decodedList = jsonDecode(serializedMessagesString);

      // Check if the decoded data is a list
      final List<Map<String, dynamic>> serializedMessages =
          decodedList.cast<Map<String, dynamic>>();

      // Map each Map<String, dynamic> to a Message object using Message.fromJson
      final List<Message> messages =
          serializedMessages.map((map) => Message.fromJson(map)).toList();

      return messages;
    } else {
      print('No messages found for chatId: $chatId');
      return [];
    }
  }


  
  Future<void> sendMessage(BuildContext context, String messageText) async {
    FocusScope.of(context).unfocus();
    try {
      messageText = messageText.trim();

      final now = DateTime.now();
      final formattedTime = DateFormat('HH:mm').format(now);
      final createdAt = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(formattedTime.substring(0, 2)),
        int.parse(formattedTime.substring(3)),
        0,
      );

      final messageId = Uuid().v4();

      final newMessage = Message(
        id: chatData.id,
        chatId: chatData.chatId,
        authorId: chatData.creatorId,
        text: messageText,
        authorUserId: chatData.creatorUserId,
        blockedByRecipient: chatData.blockedByInfluencer,
        messageId: messageId,
        createdAt: createdAt,
        updatedAt: createdAt,
      );

      final id = chatData.id;
      final chatId = chatData.chatId;
      final authorId = chatData.creatorId;
      final text = messageText;
      final authorUserId = chatData.creatorUserId;
      final blockedByRecipient = chatData.blockedByInfluencer;
      final messageIds = messageId;
      final createdAts = createdAt;
      final updatedAts = createdAt;

      print('id : $id');
      print('chatId : $chatId');
      print('authorId : $authorId');
      print('text : $text');
      print('authorUserId : $authorUserId');
      print('blockedByRecipient : $blockedByRecipient');
      print('messageId : $messageIds');
      print('createdAts : $createdAts');
      print('updatedAts  : $updatedAts');

      final token = await storage.read(key: "token");


      if (token == null) {
        print("Authorization token is not available");
        return;
      }

      final response = await apiClient.sendMessage(newMessage, token);

      if (response.isOk) {
        messageController.clear();
       if (!isDuplicateMessage(newMessage.messageId)) {
        UpdateList(newMessage);
      }
        print('Message sent and stored successfully');
        socketClient.sendMessage(chatData, messageText);

        // notify the recipient
        final recipientToken = await getRecipientToken(chatData.influencerUserId);
        final name =
          "${capitalizeFirstLetter(user.userModelObj().firstName)} ${capitalizeFirstLetter(user.userModelObj().lastName)}";


         if (recipientToken != null) {
        await notificationService.sendNotification(
          name,
          "just sent you a message",
          chatData.toJson(),
          recipientToken
        );

        await notificationService.saveNotificationToFirestore(
          name,
          "just sent you a message",
          chatData.toJson(),
          'Message',
        );
      }
      

      } else {
        print('Failed to send message: ${response.statusText}');
        print('Sent Message: $messageText');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  } 

  String formatDateTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    String formattedDateTime = DateFormat('h:mm a').format(dateTime);
    return formattedDateTime;
  }

  void chatJoin(String chatId) {
    _socketClient.socket.emit('onChatJoin', {'chatId': chatId});
    print('user has joined');
  }

  @override
  void onInit() {
    print(_socketClient.isConnected);
    //   _socketClient.socket.emit('onChatJoin', {'message': 'user just joined'});
    chatJoin(chatData.chatId);
    _socketClient.socket.on('error', (errorData) {
      print('this error is from chat open');
      print('Socket Error: $errorData');
    });
    listenToNewMessages();
    super.onInit();

    print('Chat data before getUser: $chatData');

    final String chatId = chatData.chatId;
    print('Chat ID: $chatId');
    getUser(chatId);
  }

  @override
  void onClose() {
    super.onClose();
    _socketClient.socket.off('newMessage');
    _socketClient.socket.off('error');
    _socketClient.disconnect();
    messageController.dispose();
    _socketClient.disconnect();
  }
}
 */


class ChatsOpenedController extends GetxController {
  final ChatData chatData;
  final Influencer? selectedInfluencer;

  ChatsOpenedController({required this.chatData, this.selectedInfluencer}) {
    //  messageModelObj = chatData.messages.obs;
  }

  TextEditingController messageController = TextEditingController();
  Rx<ChatsOpenedModel> chatsOpenedModelObj = ChatsOpenedModel().obs;
  var messages = <String>[].obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;
  final SocketClient _socketClient = Get.find();
  final NotificationService notificationService = Get.find();
  final storage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  RxList<Message> messageModelObj = <Message>[].obs;
  final message = ''.obs;
  late final RxBool isDeleted = false.obs;
  RxBool isEmojiWidgetShown = false.obs;
  RxBool isConnected = false.obs;
  Timer? keepAliveTimer;
  final notificationClient = NotificationClient();
  // List<String> sentMessagesCache = [];
  Set<String> processedMessageIds = {};

  bool isDuplicateMessage(String messageId) {
    return messageModelObj.any((message) => message.messageId == messageId);
  }

  void listenToNewMessage() {
    _socketClient.socket.on('onMessageCreate', (data) {
      handleNewMessage(data);
    });
    _socketClient.socket.on('error', (errorData) {
      error.value = 'Socket Error: $errorData';
      update();
    });
  }

  Future<void> storeFcmToken(String userId, String? fcmTokenId) async {
    await storage.write(key: 'fcm_Token_$userId', value: fcmTokenId);
  }

  Future<String?> getRecipientToken(String userId) async {
    final token = await storage.read(key: 'fcmToken_$userId');
    print('Retrieved FCM Token for $userId: $token');
    return token;
  }

  String? capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  void handleNewMessage(dynamic data) {
    print('this is working');
    print('Received data: $data');
    try {
      final messageMap = data as Map<String, dynamic>;

      final Message newMessage = Message.fromJson(messageMap);

      if (isDuplicateMessage(newMessage.messageId)) {
        print('Duplicate message detected: ${newMessage.messageId}');
        return;
      }
      UpdateMessage(newMessage);
    } catch (e) {
      print('Error parsing message data: $e');
    }
  }

  void UpdateMessage(Message message) {
    messageModelObj.insert(0, message);
    update();
  }

  void hideEmojiWidget() {
    isEmojiWidgetShown.value = !isEmojiWidgetShown.value;
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    final String chatId = chatData.chatId;
    getUser(chatId);
  }

  Future<void> getUser(String chatId) async {
    isLoading.value = true;
    error.value = '';
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      print('User data: ${user.userModelObj.value}');
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        // loadMessages(chatId);
        await fetchAllMessagesWithInfluencer(chatId).then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
        final userId = user.userModelObj().userId;
        final fcmToken = await FirebaseMessaging.instance.getToken();
        print('fcmToken: $fcmToken');
        await storeFcmToken(userId, fcmToken);
        print('Stored FCM Token for $userId: $fcmToken');
      }
    } catch (e) {
      print('Error in getUser: $e');
      error.value = 'Failed to fetch messages';
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> fetchAllMessagesWithInfluencer(String chatId) async {
    try {
      error.value = '';
      isLoading.value = true;
      error.value = '';
      token = await storage.read(key: "token");
      print('Fetching messages for chat ID: $chatId'); // Debug log
      final Response response = await apiClient.getAllMessages(chatId, token);
      if (response.isOk) {
        final responseData = response.body;
        final List<dynamic>? chatDataList = responseData['data']?['docs'];
        print('chatdatalist: $chatDataList');
        final List<Message> messages = [];

        if (chatDataList != null) {
          for (var chatDataJson in chatDataList) {
            final Message message = Message.fromJson(
                chatDataJson); 
            messages.add(message);
          }

          messageModelObj.assignAll(messages);

          saveMessages(messages, chatId);
        } else {
          error('Failed to fetch messages: Data not available');
        }
      } else {
        error('Failed to fetch messages: ${response.statusText}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
      error('Failed to fetch messages');
    } finally {
      isTrendLoading.value = false;
    }
  }

  Future<void> deleteIdMessage(String deleteMessage) async {
    try {
      final token = await storage.read(key: "token");
      final chatId = chatData.chatId;
      final response =
          await apiClient.deleteMessage(chatId, deleteMessage, token!);

      if (response.isOk) {
        print('Message deleted successfully');
        isDeleted.value = true;
        // Remove the deleted message from the list
        messageModelObj
            .removeWhere((message) => message.messageId == deleteMessage);
        isDeleted.value = true;
        update();
      } else {
        if (response.statusCode == null) {
          print('Failed to delete message: Network error');
        } else {
          print(
              'Failed to delete message: ${response.statusCode}, ${response.body}');
        }
      }
    } catch (e) {
      print('Error deleting message: $e');
    }
  }

  Map<String, List<Message>> groupMessagesByDate(List<Message> messages) {
    Map<String, List<Message>> groupedMessages = {};
    for (var message in messages) {
      String date = DateFormat('yyyy-MM-dd').format(message.createdAt);
      if (groupedMessages.containsKey(date)) {
        groupedMessages[date]!.add(message);
      } else {
        groupedMessages[date] = [message];
      }
    }
    return groupedMessages;
  }

  void onTapChatCard(Influencer? selectedInfluencer, ChatData chatData) async {
    if (selectedInfluencer == null) {
      print("selectedInfluencer is null");
      return;
    }

    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");

    try {
      // await Future.delayed(Duration(seconds: 10));
      Response existingChatResponse =
          await apiClient.getAllChatsWithInfluencers(token!);
      if (existingChatResponse.isOk && existingChatResponse.body != null) {
        //  final List<dynamic>? responseData = existingChatResponse.body;
        List<dynamic> chatListMaps = existingChatResponse.body['data']['docs'];
        List<ChatData> chatList =
            chatListMaps.map((chatMap) => ChatData.fromJson(chatMap)).toList();

        ChatData? existingChat = chatList.firstWhereOrNull(
            (chat) => chat.influencerId == selectedInfluencer.id);

        if (existingChat != null) {
          await fetchAllMessagesWithInfluencer(existingChat.chatId);
          Get.to(ChatsOpenedScreen(
            selectedInfluencer: selectedInfluencer,
            chatData: existingChat,
          ));
          return;
        } else {
          print("No existing chat found for the selected influencer");
          // No existing chat, proceed to create a new one
          final now = DateTime.now();
          final formattedTime = DateFormat('HH:mm').format(now);
          final createdAt = DateTime(
            now.year,
            now.month,
            now.day,
            int.parse(formattedTime.substring(0, 2)),
            int.parse(formattedTime.substring(3)),
            0,
          );

          String chatId = Uuid().v4();
          String creatorId = user.userModelObj.value.id;
          String creatorUserId = user.userModelObj.value.userId;

          ChatData newChat = ChatData(
            id: '',
            creatorId: creatorId,
            influencerId: selectedInfluencer.id ?? '',
            creatorUserId: creatorUserId,
            influencerUserId: selectedInfluencer.userId ?? '',
            unreadByCreator: 0,
            unreadByInfluencer: 0,
            blockedByCreator: false,
            blockedByInfluencer: false,
            chatId: chatId,
            createdAt: createdAt,
            updatedAt: createdAt,
            messages: [],
          );

          // Create the new chat
          Response createChatResponse =
              await apiClient.createChat(newChat, token);
          if (createChatResponse.isOk) {
            print('Chat created successfully');
            Map<String, dynamic> chatDataMap = createChatResponse.body;
            ChatData createdChat = ChatData.fromJson(chatDataMap);

            // Navigate to the chat screen with the new chat data
            Get.to(ChatsOpenedScreen(
              selectedInfluencer: selectedInfluencer,
              chatData: createdChat,
            ));
          } else {
            print("Failed to create chat: ${createChatResponse.statusCode}");
          }
        }
      } else {
        print(
            "Failed to fetch existing chats: ${existingChatResponse.statusCode}");
      }
    } catch (e) {
      print("Error creating or fetching chat: $e");
      error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveMessages(List<Message> messages, String chatId) async {
    try {
      final List<String> serializedMessages =
          messages.map((message) => jsonEncode(message.toJson())).toList();
      final String serializedMessagesString = jsonEncode(serializedMessages);
      await storage.write(
          key: 'messages_$chatId', value: serializedMessagesString);
      print('Messages saved successfully for chat ID: $chatId');
    } catch (e) {
      print('Error saving messages: $e');
      // Handle error as needed
    }
  }

  Future<List<Message>> loadMessages(String chatId) async {
    final serializedMessagesString =
        await storage.read(key: 'messages_$chatId');

    if (serializedMessagesString != null &&
        serializedMessagesString.isNotEmpty) {
      final List<dynamic> decodedList = jsonDecode(serializedMessagesString);

      // Check if the decoded data is a list
      if (decodedList is List) {
        final List<Map<String, dynamic>> serializedMessages =
            decodedList.cast<Map<String, dynamic>>();

        // Map each Map<String, dynamic> to a Message object using Message.fromJson
        final List<Message> messages =
            serializedMessages.map((map) => Message.fromJson(map)).toList();

        return messages;
      } else {
        print('Invalid JSON format: $serializedMessagesString');
        return [];
      }
    } else {
      print('No messages found for chatId: $chatId');
      return [];
    }
  }

  void chatJoin(String chatId) {
    _socketClient.socket.emit('onChatJoin', {'chatId': chatId});
    print('user has joined');
  }

  Future<void> sendMessage(BuildContext context, String messageText) async {
    FocusScope.of(context).unfocus();
    try {
      messageText = messageText.trim();

      final now = DateTime.now();
      final formattedTime = DateFormat('HH:mm').format(now);
      final createdAt = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(formattedTime.substring(0, 2)),
        int.parse(formattedTime.substring(3)),
        0,
      );

      final messageId = Uuid().v4();

      final newMessage = Message(
          id: chatData.id,
          chatId: chatData.chatId,
          authorId: chatData.creatorId,
          text: messageText,
          authorUserId: chatData.creatorUserId,
          blockedByRecipient: chatData.blockedByInfluencer,
          messageId: messageId,
          createdAt: createdAt,
          updatedAt: createdAt,
          isCompleteMessage: false);

      final id = chatData.id;
      final chatId = chatData.chatId;
      final authorId = chatData.creatorId;
      final text = messageText;
      final authorUserId = chatData.creatorUserId;
      final blockedByRecipient = chatData.blockedByInfluencer;
      final messageIds = messageId;
      final createdAts = createdAt;
      final updatedAts = createdAt;
      final isCompleteMessage = false;

      print('id : $id');
      print('chatId : $chatId');
      print('authorId : $authorId');
      print('text : $text');
      print('authorUserId : $authorUserId');
      print('blockedByRecipient : $blockedByRecipient');
      print('messageId : $messageIds');
      print('createdAts : $createdAts');
      print('updatedAts  : $updatedAts');
      print('isCompleteMessage  : $isCompleteMessage');

      final token = await storage.read(key: "token");

      if (token == null) {
        print("Authorization token is not available");
        return;
      }

      final response = await apiClient.sendMessage(newMessage, token);

      if (response.isOk) {
        messageController.clear();
        if (!isDuplicateMessage(newMessage.messageId)) {
          UpdateList(newMessage);
        }
        print('Message sent and stored successfully');
        socketClient.sendMessage(chatData, messageText);
        final name =
            "${capitalizeFirstLetter(user.userModelObj().firstName)} ${capitalizeFirstLetter(user.userModelObj().lastName)}";
          await OneSignal.login(chatData.influencerUserId);
        final avatar = user.userModelObj.value.avatar;
        if (name != null) {
          try {
             print('Sending notification to recipient');
            await notificationClient.sendNotification(
              name,
              messageText,
              chatData.influencerUserId,
              avatar
            ); 

            await notificationService.createNotification(
              name,
              messageText,
              'Message',
               avatar
            );
            print('Notification sent and saved to database');
          } catch (e) {
            print('Error sending notification: $e');
          }
        } else {
          print('name is null');
        }
      } else {
        print('Failed to send message: ${response.statusText}');
        print('Sent Message: $messageText');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }


  void UpdateList(Message message) {
    messageModelObj.insert(0, message);
    update();
  }

  String formatDateTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    String formattedDateTime = DateFormat('h:mm a').format(dateTime);
    return formattedDateTime;
  }

  @override
  void onInit() {
    _socketClient.connect();
    print(_socketClient.isConnected);
    // _socketClient.socket.emit('onChatJoin', {'message': 'user just joined'});
    chatJoin(chatData.chatId);
    _socketClient.socket.on('error', (errorData) {
      print('this error is from chat open');
      print('Socket Error: $errorData');
    });
    listenToNewMessage();
    // startKeepAliveTimer();
    super.onInit();

    print('Chat data before getUser: $chatData');

    final String chatId = chatData.chatId;
    print('Chat ID: $chatId');
    getUser(chatId);
  }

  @override
  void onClose() {
    super.onClose();
    _socketClient.socket.off('newMessage');
    _socketClient.socket.off('error');
    _socketClient.connect();
    messageController.dispose();
    // _socketClient.disconnect();
  }
}
