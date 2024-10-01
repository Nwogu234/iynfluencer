import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/chats_influencer_screen.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/model/chat_influencer_model.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:async';
import 'package:uuid/uuid.dart';

/* class ChatsInfluencerController extends GetxController {
  final ChatData chatData;
  final Job? selectedJob;

  ChatsInfluencerController({required this.chatData, this.selectedJob}) {
    messageModelObjs = chatData.messages.obs;
  }

  TextEditingController messageController = TextEditingController();
  Rx<ChatsInfluencerModel> chatsinfluencerModelObj = ChatsInfluencerModel().obs;
  var messages = <String>[].obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;
  final storage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  RxList<Message> messageModelObjs = <Message>[].obs;
  final message = ''.obs;
  late final RxBool isDeleted = false.obs;

  @override
  void onInit() {
    super.onInit();

    socketClient.connect();

    socketClient.socket.on('receive_message', (data) {
      messages.add(data.toString());
      update();
    });

    socketClient.socket.on('error', (errorData) {
      print('Socket Error: $errorData');
    });

    final String chatId = chatData.chatId;
    getUser(chatId);
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
        loadMessages(chatId);
        fetchAllMessagesWithCreators(chatId).then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
        //  onTapChatCard(selectedInfluencer, chatData);
      }
    } catch (e) {
      print('Error in getUser: $e');
      error.value = 'Failed to fetch messages';
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAllMessagesWithCreators(String chatId) async {
    try {
      error.value = '';
      isLoading.value = true;
      error.value = '';
      token = await storage.read(key: "token");
      final Response response = await apiClient.getAllMessages(chatId, token);
      if (response.isOk) {
        final responseData = response.body;
        final List<dynamic>? chatDataList = responseData['data']?['docs'];
        print('chatdatalist: $chatDataList');
        final List<Message> messages = [];

        if (chatDataList != null) {
          for (var chatDataJson in chatDataList) {
            final Message message = Message.fromJson(chatDataJson);
            messages.add(message);
          }
          messageModelObjs.assignAll(messages);
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
        messageModelObjs
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
      // Handle any exceptions that occur during the deletion process
      print('Error deleting message: $e');
    }
  }

  void onTapChatCard(Job? selectedJob, ChatData chatData) async {
    if (selectedJob == null) {
      print("selectedJob is null");
      return;
    }

    isLoading.value = true;
    error('');

    try {
      isLoading.value = true;
      error('');
      token = await storage.read(key: "token");

      if (token == null) {
        print("token is null");
        return;
      }

      Response existingsChatResponse =
          await apiClient.getAllChatsWithCreators(token!);
      if (existingsChatResponse.isOk && existingsChatResponse.body != null) {
        //  final List<dynamic>? responseData = existingChatResponse.body;
        List<dynamic> chatListMaps = existingsChatResponse.body['data']['docs'];
        List<ChatData> chatList =
            chatListMaps.map((chatMap) => ChatData.fromJson(chatMap)).toList();

        ChatData? existingsChat = chatList
            .firstWhereOrNull((chat) => chat.influencerId == selectedJob.id);

        if (existingsChat != null) {
          await fetchAllMessagesWithCreators(existingsChat.chatId);
          Get.to(ChatsInfluencerScreen(
            selectedJob: selectedJob,
            chatData: existingsChat,
          ));
          return;
        } else {
          print("No existing chat found for the selected creator");
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
          String influencerId = user.userModelObj.value.id;
          String influencerUserId = user.userModelObj.value.userId;
          print('non-null: $influencerId + $influencerUserId');

          ChatData newsChat = ChatData(
            id: '',
            creatorId: selectedJob.creator?.id ?? '',
            influencerId: influencerId,
            creatorUserId: selectedJob.creator?.userId ?? '',
            influencerUserId: influencerUserId,
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
              await apiClient.createChat(newsChat, token);
          if (createChatResponse.isOk) {
            print('Chat created successfully');
            Map<String, dynamic> chatDataMap = createChatResponse.body;
            ChatData createdChat = ChatData.fromJson(chatDataMap);

            // Navigate to the chat screen with the new chat data
            Get.to(ChatsInfluencerScreen(
              selectedJob: selectedJob,
              chatData: createdChat,
            ));
          } else {
            print("Failed to create chat: ${createChatResponse.statusCode}");
          }
        }
      } else {
        print(
            "Failed to fetch existing chats: ${existingsChatResponse.statusCode}");
      }
    } catch (e) {
      print("Error creating or fetching chat: $e");
      error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

/* 
void saveMessages(List<Message> messages) async {
  final List<String> serializedMessages = messages.map((message) => jsonEncode(message.toJson())).toList();
  final String serializedMessagesString = jsonEncode(serializedMessages);
  await storage.write(key: 'messages_${chatData.chatId}', value: serializedMessagesString);
}
 */
/* 
Future<List<Message>> loadMessages() async {
  final String? serializedMessagesString = await storage.read(key: 'messages_${widget.chatData.chatId}');
  if (serializedMessagesString != null) {
    final List<dynamic> serializedMessages = jsonDecode(serializedMessagesString);
    return serializedMessages.map((json) => Message.fromJson(json)).toList();
  } else {
    return [];
  }
} */

  String formatDateTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    String formattedDateTime = DateFormat('h:mm a').format(dateTime);
    return formattedDateTime;
  }

  @override
  void onClose() {
    super.onClose();
    messageController.dispose();
    socketClient.disconnect();
  }
}
 */

class ChatsInfluencerController extends GetxController {
  final ChatData chatData;
  final Jobz? selectedJob;
  final String? query;

  ChatsInfluencerController(
      {required this.chatData, this.selectedJob, this.query}) {
    // messageModelObjs = chatData.messages.obs;
  }

  TextEditingController messageController = TextEditingController();
  // late  TextEditingController queryController;
  Rx<ChatsInfluencerModel> chatsinfluencerModelObj = ChatsInfluencerModel().obs;
  var messages = <String>[].obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;
  final NotificationService notificationService = Get.find();
  final SocketClient _socketClient = Get.find();
  final storage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  RxBool isEmojiWidgetShown = false.obs;
  RxBool isConnected = false.obs;
  RxList<Message> messageModelObjs = <Message>[].obs;
  RxList<Message> pendingMessages = <Message>[].obs;
  final message = ''.obs;
  late final RxBool isDeleted = false.obs;
  Timer? keepAliveTimer;
  Set<String> processedMessageIds = {};
  final notificationClient = NotificationClient();
  RxBool isLoadingMore = true.obs;
  int pageSize = 10;
  ScrollController _scrollController = ScrollController();
  final RxBool isReverse = false.obs;
  final RxBool isSent = true.obs;
  int currentPage = 0;

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    final String chatId = chatData.chatId;
    getUser(chatId);
  }

  bool isDuplicateMessage(String messageId) {
    return messageModelObjs.any((message) => message.messageId == messageId);
  }

  void listenToNewMessages() {
    _socketClient.socket.on('onMessageCreate', (data) {
      handleNewMessage(data);
    });
    _socketClient.socket.on('error', (errorData) {
      error.value = 'Socket Error: $errorData';
      update();
    });
  }

  Future<void> storeFcmToken(String userId, String? fcmTokenUserId) async {
    await storage.write(key: 'fcm_Token_$userId', value: fcmTokenUserId);
  }

  Future<String?> getRecipientToken(String userId) async {
    return await storage.read(key: 'fcm_Token_$userId');
  }

  String? capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  void handleNewMessage(dynamic data) async {
    print('this is working');
    print('Received data: $data');
    try {
      final messageMap = data as Map<String, dynamic>;
      final Message newMessage = Message.fromJson(messageMap);

      if (!SocketClient.to.isConnected.value) {
        print('Storing message while offline: ${newMessage.messageId}');
        updatePendingMessage(newMessage);
        return;
      }

      if (isDuplicateMessage(newMessage.messageId)) {
        print('Duplicate message detected: ${newMessage.messageId}');
        return;
      }
      UpdateMessage(newMessage);
      final chatId = newMessage.chatId;
      final messageId = newMessage.messageId;

      try {
        final boxName = 'messages_$chatId';
        Box<Message>? messageBox;
        messageBox = Hive.isBoxOpen(boxName)
            ? Hive.box<Message>(boxName)
            : await Hive.openBox<Message>(boxName);
        await messageBox.put(messageId, newMessage);
      } catch (e) {
        print('Error opening or accessing Hive box: $e');
      }
      final token = await storage.read(key: "token");
      if (token == null) {
        print("Authorization token is not available");
        return;
      }
      updateHiveChatDataBox(newMessage);
      increaseUnreadCreator(chatId);
    } catch (e) {
      print('Error parsing message data: $e');
    }
  }

  Future<void> increaseUnreadCreator(String chatId) async {
    final String chatDataBoxName = 'chat_data';
    Box<ChatData>? chatDataBox;

    chatDataBox = Hive.isBoxOpen(chatDataBoxName)
        ? Hive.box<ChatData>(chatDataBoxName)
        : await Hive.openBox<ChatData>(chatDataBoxName);

    final chatsData = chatDataBox.get(chatId);

    if (chatsData != null) {
      chatsData.unreadByCreator = chatsData.unreadByCreator + 1;

      await chatDataBox.put(chatId, chatsData);

      print('Unread count for creator reset to 0 in Hive');
    } else {
      print('Chat data not found in Hive for chat ID: $chatId');
    }
  }

  void updatePendingMessage(Message message) {
    pendingMessages.insert(0, message);
    update();
  }

  void UpdateMessage(Message message) {
    messageModelObjs.insert(0, message);
    update();
  }

  void hideEmojiWidget() {
    isEmojiWidgetShown.value = !isEmojiWidgetShown.value;
  }

  void processPendingMessages() async {
    if (pendingMessages.isNotEmpty) {
      print('Processing pending messages...');

      for (final message in pendingMessages) {
        handleNewMessage(message.toJson());
      }

      pendingMessages.clear();
    }
  }

  Future<void> getUser(String chatId) async {
    // isLoading.value = true;
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
        loadMessagesOrFetch(chatId).then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
        final userId = user.userModelObj().userId;
        final fcmToken = await FirebaseMessaging.instance.getToken();
        await storeFcmToken(userId, fcmToken);
      }
    } catch (e) {
      print('Error in getUser: $e');
      error.value = 'Failed to fetch messages';
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMessagesOrFetch(String chatId) async {
    isLoading.value = false;
    try {
      final Box<Message> messageBox =
          await Hive.openBox<Message>('messages_$chatId');
      final List<Message> storedMessages = messageBox.values.toList();

      if (storedMessages.isNotEmpty) {
        storedMessages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        int batchSize = 10;
        for (var i = 0; i < storedMessages.length; i += batchSize) {
          List<Message> batch = storedMessages.skip(i).take(batchSize).toList();
          messageModelObjs.addAll(batch);
          await Future.delayed(Duration(milliseconds: 50));
        }
        print('Messages loaded successfully from Hive for chat ID: $chatId');
        resetUnreadCreator(chatId);

      } else {
        isLoading.value = true;
        await fetchAllMessagesWithCreators(chatId);
      }

      final userId = user.userModelObj().userId;
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print('fcmToken: $fcmToken');
      await storeFcmToken(userId, fcmToken);
      print('Stored FCM Token for $userId: $fcmToken');
    } catch (e) {
      print('Error loading or fetching messages: $e');
      error.value = 'Failed to load messages';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetUnreadCreator(String chatId) async {
    final String chatDataBoxName = 'chat_data';
    Box<ChatData>? chatDataBox;

    chatDataBox = Hive.isBoxOpen(chatDataBoxName)
        ? Hive.box<ChatData>(chatDataBoxName)
        : await Hive.openBox<ChatData>(chatDataBoxName);

    final ChatData? chatsData = chatDataBox.get(chatId);

    if (chatsData != null) {
      chatsData.unreadByCreator = 0;
       await chatsData.save();

      await chatDataBox.put(chatId, chatsData);

      print('Unread count for influencer reset to 0 in Hive');
    } else {
      print('Chat data not found in Hive for chat ID: $chatId');
    }
  }

  Future<void> fetchAllMessagesWithCreators(String chatId) async {
    try {
      error.value = '';
      isLoading.value = true;
      error.value = '';
      token = await storage.read(key: "token");
      final Response response = await apiClient.getAllMessages(chatId, token);
      if (response.isOk) {
        final responseData = response.body;
        final List<dynamic>? chatDataList = responseData['data']?['docs'];
        print('chatdatalist: $chatDataList');
        final List<Message> messages = [];

        if (chatDataList != null) {
          for (var chatDataJson in chatDataList) {
            final Message message = Message.fromJson(chatDataJson);
            messages.add(message);
          }
          messageModelObjs.assignAll(messages);
          await saveMessages(messages, chatId);
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

        final Box<Message> messageBox =
            await Hive.openBox<Message>('messages_$chatId');
        await messageBox.delete(deleteMessage);
        // Remove the deleted message from the list
        messageModelObjs
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
      // Handle any exceptions that occur during the deletion process
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

  void onTapChatsCard(
      Jobz? selectedJob, ChatData? chatData, String? query) async {
    if (selectedJob == null) {
      print("selectedJob is null");
      return;
    }

    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");

    try {

    final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chat_data');
   ChatData? existingChatInHive = chatBox.values.firstWhere(
     (chat) => chat.creatorId == selectedJob.creator?.id,
      orElse: () => ChatData(
      id: '',
      creatorId: '',
      influencerId: '',
      creatorUserId: '',
      influencerUserId: '',
      unreadByCreator: 0,
       unreadByInfluencer: 0,
      blockedByCreator: false,
      blockedByInfluencer: false,
      chatId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      messages: [],
     ),
     );

      if (existingChatInHive != null) {
      print("Chat with creator found in Hive, no need to save again.");
      await fetchAllMessagesWithCreators(existingChatInHive.chatId);
        Get.to(ChatsInfluencerScreen(
              selectedJob: selectedJob,
              chatData: existingChatInHive,
              query: query != null ? query : ''));
      return; 
    }


      //  await Future.delayed(Duration(seconds: 10));
      Response existingsChatResponse =
          await apiClient.getAllChatsWithCreators(token!);
      if (existingsChatResponse.isOk && existingsChatResponse.body != null) {
        //  final List<dynamic>? responseData = existingChatResponse.body;
        List<dynamic> chatListMaps = existingsChatResponse.body['data']['docs'];
        List<ChatData> chatList =
            chatListMaps.map((chatMap) => ChatData.fromJson(chatMap)).toList();

        ChatData? existingsChat = chatList.firstWhereOrNull(
            (chat) => chat.creatorId == selectedJob.creator?.id);

        if (existingsChat != null) {
          isLoading.value = true;
          await fetchAllMessagesWithCreators(existingsChat.chatId);
          Get.to(ChatsInfluencerScreen(
              selectedJob: selectedJob,
              chatData: existingsChat,
              query: query != null ? query : ''));
          return;
        } else {
          print("No existing chat found for the selected creator");
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
          String influencerId = user.userModelObj.value.id;
          String influencerUserId = user.userModelObj.value.userId;
          print('non-null: $influencerId + $influencerUserId');

          ChatData newsChat = ChatData(
            id: '',
            creatorId: selectedJob.creator?.id ?? '',
            influencerId: influencerId,
            creatorUserId: selectedJob.creator?.userId ?? '',
            influencerUserId: influencerUserId,
            unreadByCreator: 0,
            unreadByInfluencer: 0,
            blockedByCreator: false,
            blockedByInfluencer: false,
            chatId: chatId,
            createdAt: createdAt,
            updatedAt: createdAt,
            messages: [],
          );

          final creatorId = selectedJob.creator?.id ?? '';
          final creatorUserId = selectedJob.creator?.userId ?? '';

          print('creatorId : $creatorId');
          print('creatorUserId : $creatorUserId');
          print('influencerId : $influencerId');
          print('influencerUserId : $influencerUserId');

          // Create the new chat
          Response createChatResponse =
              await apiClient.createChat(newsChat, token);
          if (createChatResponse.isOk) {
            print('Chat created successfully');
            Map<String, dynamic> chatDataMap = createChatResponse.body;
          //  ChatData createdChat = ChatData.fromJson(chatDataMap);

            // Navigate to the chat screen with the new chat data

             if (chatDataMap.containsKey('_id') && chatDataMap['_id'] is String) {
              ChatData createdChat = ChatData.fromJson(chatDataMap);

             Get.to(ChatsInfluencerScreen(
                selectedJob: selectedJob,
                chatData: createdChat,
                query: query != null ? query : ''));
    
              await saveChatToHive(createdChat);
            } else {
              print("Chat data does not contain expected fields: $chatDataMap");
              error('Chat creation response is missing required fields');
            }

          //  Get.to(ChatsInfluencerScreen(
           //     selectedJob: selectedJob,
           //     chatData: createdChat,
            //    query: query != null ? query : ''));
            //saveChatToHive(createdChat);
          } else {
            print("Failed to create chat: ${createChatResponse.statusCode}");
          }
        }
      } else {
        print(
            "Failed to fetch existing chats: ${existingsChatResponse.statusCode}");
      }
    } catch (e) {
      print("Error creating or fetching chat: $e");
      error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void onTapChatsBid(
      Jobz? selectedJob, ChatData chatData, String? query) async {
    if (selectedJob == null) {
      print("selectedJob is null");
      return;
    }

    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");

    try {
      //  await Future.delayed(Duration(seconds: 10));
      
    final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chat_data');
   ChatData? existingChatInHive = chatBox.values.firstWhere(
     (chat) => chat.creatorId == selectedJob.creator?.id,
      orElse: () => ChatData(
      id: '',
      creatorId: '',
      influencerId: '',
      creatorUserId: '',
      influencerUserId: '',
      unreadByCreator: 0,
       unreadByInfluencer: 0,
      blockedByCreator: false,
      blockedByInfluencer: false,
      chatId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      messages: [],
     ),
     );

      if (existingChatInHive != null) {
      print("Chat with creator found in Hive, no need to save again.");
      await fetchAllMessagesWithCreators(existingChatInHive.chatId);
        Get.to(ChatsInfluencerScreen(
              selectedJob: selectedJob,
              chatData: existingChatInHive,
              query: query != null ? query : ''));
      return; 
    }


      Response existingsChatResponse =
          await apiClient.getAllChatsWithCreators(token!);
      if (existingsChatResponse.isOk && existingsChatResponse.body != null) {
        //  final List<dynamic>? responseData = existingChatResponse.body;
        List<dynamic> chatListMaps = existingsChatResponse.body['data']['docs'];
        List<ChatData> chatList =
            chatListMaps.map((chatMap) => ChatData.fromJson(chatMap)).toList();

        ChatData? existingsChat = chatList.firstWhereOrNull(
            (chat) => chat.creatorId == selectedJob.creator?.id);

        if (existingsChat != null) {
            isLoading.value = true;
          await fetchAllMessagesWithCreators(existingsChat.chatId);
          Get.to(ChatsInfluencerScreen(
              selectedJob: selectedJob,
              chatData: existingsChat,
              query: query != null ? query : ''));
          return;
        } else {
          print("No existing chat found for the selected creator");
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
          String influencerId = user.userModelObj.value.id;
          String influencerUserId = user.userModelObj.value.userId;
          print('non-null: $influencerId + $influencerUserId');

          ChatData newsChat = ChatData(
            id: '',
            creatorId: selectedJob.creatorDetails?.id ?? '',
            influencerId: influencerId,
            creatorUserId: selectedJob.creatorDetails?.userId ?? '',
            influencerUserId: influencerUserId,
            unreadByCreator: 0,
            unreadByInfluencer: 0,
            blockedByCreator: false,
            blockedByInfluencer: false,
            chatId: chatId,
            createdAt: createdAt,
            updatedAt: createdAt,
            messages: [],
          );

          final creatorId =
              selectedJob.creator?.id ?? selectedJob.creatorDetails?.id ?? '';
          final creatorUserId = selectedJob.creator?.userId ??
              selectedJob.creatorDetails?.userId ??
              '';

          print('creatorId : $creatorId');
          print('creatorUserId : $creatorUserId');
          print('influencerId : $influencerId');
          print('influencerUserId : $influencerUserId');

          // Create the new chat
          Response createChatResponse =
              await apiClient.createChat(newsChat, token);
          if (createChatResponse.isOk) {
            print('Chat created successfully');
            Map<String, dynamic> chatDataMap = createChatResponse.body;
         //   ChatData createdChat = ChatData.fromJson(chatDataMap);

            // Navigate to the chat screen with the new chat data
              if (chatDataMap.containsKey('_id') && chatDataMap['_id'] is String) {
              ChatData createdChat = ChatData.fromJson(chatDataMap);

             Get.to(ChatsInfluencerScreen(
                selectedJob: selectedJob,
                chatData: createdChat,
                query: query != null ? query : ''));
    
              await saveChatToHive(createdChat);
            } else {
              print("Chat data does not contain expected fields: $chatDataMap");
              error('Chat creation response is missing required fields');
            }
            
           // Get.to(ChatsInfluencerScreen(
            //    selectedJob: selectedJob,
            //    chatData: createdChat,
             //   query: query != null ? query : ''));
           //  await saveChatToHive(createdChat);
          } else {
            print("Failed to create chat: ${createChatResponse.statusCode}");
          }
        }
      } else {
        print(
            "Failed to fetch existing chats: ${existingsChatResponse.statusCode}");
      }
    } catch (e) {
      print("Error creating or fetching chat: $e");
      error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveChatToHive(ChatData chat) async {
    final String chatDataBoxName = 'chat_data';
    Box<ChatData>? chatDataBox;

    chatDataBox = Hive.isBoxOpen(chatDataBoxName)
        ? Hive.box<ChatData>(chatDataBoxName)
        : await Hive.openBox<ChatData>(chatDataBoxName);

    // Store the chat in Hive
    await chatDataBox.put(chat.chatId, chat); // Use chatId as the key

    print('Chat saved to Hive: ${chat.chatId}');
  }

  void updateHiveChatDataBox(Message newMessage) async {
    final String chatDataBoxName = 'chat_data';
    Box<ChatData>? chatDataBox;

    try {
      chatDataBox = Hive.isBoxOpen(chatDataBoxName)
          ? Hive.box<ChatData>(chatDataBoxName)
          : await Hive.openBox<ChatData>(chatDataBoxName);

      if (chatDataBox != null) {
        final ChatData? hiveChatData = chatDataBox.get(newMessage.chatId);

        if (chatData != null) {
          chatData.lastMessage = newMessage.text;
          chatData.lastMessageTime = DateTime.now();

          await chatDataBox.put(newMessage.chatId, hiveChatData!);
          print('Chat data updated successfully');
        } else {
          print('Chat data for chatId ${newMessage.chatId} not found');
        }
      }
    } catch (e) {
      print('Error opening or accessing Hive box: $e');
    }
  }

  Future<void> saveMessages(List<Message> messages, String chatId) async {
    try {
      final Box<Message> messageBox =
          await Hive.openBox<Message>('messages_$chatId');
      await messageBox.clear();

      for (var message in messages) {
        await messageBox.put(message.messageId, message);
      }
      print('Messages saved successfully for chat ID: $chatId');
    } catch (e) {
      print('Error saving messages: $e');
    }
  }

  Future<void> loadMessages(String chatId) async {
    try {
      final Box<Message> messageBox =
          await Hive.openBox<Message>('messages_$chatId');
      final List<Message> storedMessages = messageBox.values.toList();

      if (storedMessages.isNotEmpty) {
        // Sort messages by createdAt in ascending order (latest at the bottom)
        storedMessages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        messageModelObjs.assignAll(storedMessages);
        print(
            'Messages loaded and sorted successfully from Hive for chat ID: $chatId');
      } else {
        print('No messages found in Hive for chat ID: $chatId');
      }
    } catch (e) {
      print('Error loading messages from Hive: $e');
    }
  }

  Future<void> sendMessage(
      BuildContext context, String messageText, bool isCompleteMessage) async {
    FocusScope.of(context).unfocus();

    if (messageText.isEmpty) {
      return;
    }

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
        authorId: chatData.influencerId,
        text: messageText,
        authorUserId: chatData.influencerUserId,
        blockedByRecipient: chatData.blockedByCreator,
        messageId: messageId,
        createdAt: createdAt,
        updatedAt: createdAt,
        isCompleteMessage: isCompleteMessage);

    final id = chatData.id;
    final chatId = chatData.chatId;
    final authorId = chatData.influencerId;
    final text = messageText;
    final authorUserId = chatData.influencerUserId;
    final blockedByRecipient = chatData.blockedByInfluencer;
    final messageIds = messageId;
    final createdAts = createdAt;
    final updatedAts = createdAt;
    final isCompletesMessage = isCompleteMessage;

    print('id : $id');
    print('chatId : $chatId');
    print('authorId : $authorId');
    print('text : $text');
    print('authorUserId : $authorUserId');
    print('blockedByRecipient : $blockedByRecipient');
    print('messageId : $messageIds');
    print('createdAts : $createdAts');
    print('updatedAts  : $updatedAts');
    print('isCompleteMessage  : $isCompletesMessage');

    messageController.clear();
    isReverse.value = true;

    if (!isDuplicateMessage(newMessage.messageId)) {
      UpdateList(newMessage);
    }

    final boxName = 'messages_$chatId';
    Box<Message>? messageBox;

    try {
      messageBox = Hive.isBoxOpen(boxName)
          ? Hive.box<Message>(boxName)
          : await Hive.openBox<Message>(boxName);
      await messageBox.put(messageId, newMessage);
    } catch (e) {
      print('Error opening or accessing Hive box: $e');
    }
    final token = await storage.read(key: "token");
    if (token == null) {
      print("Authorization token is not available");
      return;
    }

    var connectivityResult = await Connectivity().checkConnectivity();
    bool isConnected = connectivityResult != ConnectivityResult.none;

    if (isConnected) {
      try {
        final response = await apiClient.sendMessage(newMessage, token);

        if (response.isOk) {
          isSent.value = true;
          print('Message sent and stored successfully');
          updateHiveChatDataBox(newMessage);
          socketClient.sendMessage(chatData, messageText);
          final name =
              "${capitalizeFirstLetter(user.userModelObj().firstName)} ${capitalizeFirstLetter(user.userModelObj().lastName)}";
          await OneSignal.login(chatData.influencerUserId);
          final avatar = user.userModelObj.value.avatar;
          if (name != null) {
            try {
              print('Sending notification to recipient');
              await notificationClient.sendNotification(
                  name, messageText, chatData.influencerUserId, avatar);

              await notificationService.createNotification(
                  name, messageText, 'Message', avatar);
              print('Notification sent and saved to database');
            } catch (e) {
              print('Error sending notification: $e');
            }
          } else {
            print('name is null');
          }
        } else {
          print('Failed to send message: ${response.statusText}');
          scheduleRetry(newMessage, messageBox, token, messageText);
        }
      } catch (e) {
        print('Error sending message: $e');
        scheduleRetry(newMessage, messageBox, token, messageText);
      }
    } else {
      print("No internet connection. Message will be retried automatically.");
      scheduleRetry(newMessage, messageBox, token, messageText);
    }
  }

  void UpdateList(Message message) {
    messageModelObjs.insert(0, message);
    scrollToBottom();
    update();
  }

  void scheduleRetry(Message message, Box<Message>? messageBox, String token,
      String messageText) {
    const retryInterval = Duration(seconds: 10);
    const retryDuration = Duration(minutes: 2);
    final endTime = DateTime.now().add(retryDuration);

    Timer.periodic(retryInterval, (Timer timer) async {
      var connectivityResult = await Connectivity().checkConnectivity();
      bool isConnected = connectivityResult != ConnectivityResult.none;

      if (isConnected) {
        try {
          final retryResponse = await apiClient.sendMessage(message, token);
          if (retryResponse.isOk) {
            isSent.value = true;
            socketClient.sendMessage(chatData, message.text);
            final name =
                "${capitalizeFirstLetter(user.userModelObj().firstName)} ${capitalizeFirstLetter(user.userModelObj().lastName)}";
            await OneSignal.login(chatData.influencerUserId);
            final avatar = user.userModelObj.value.avatar;
            if (name != null) {
              try {
                print('Sending notification to recipient');
                await notificationClient.sendNotification(
                    name, messageText, chatData.influencerUserId, avatar);

                await notificationService.createNotification(
                    name, messageText, 'Message', avatar);
                print('Notification sent and saved to database');
              } catch (e) {
                print('Error sending notification: $e');
              }
            } else {
              print('name is null');
            }
            timer.cancel();
          } else {
            print('Retry failed: ${retryResponse.statusText}');
          }
        } catch (e) {
          print('Retry error: $e');
        }
      }

      if (DateTime.now().isAfter(endTime)) {
        message.status = MessageStatus.failed.index;
        isSent.value = false;
        await messageBox?.delete(message.messageId);
        timer.cancel();
      }
    });
  }

  String formatDateTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    String formattedDateTime = DateFormat('h:mm a').format(dateTime);
    return formattedDateTime;
  }

  @override
  void onInit() {
    super.onInit();
    _socketClient.connect();
    print(_socketClient.isConnected);
    //   _socketClient.socket.emit('onChatJoin', {'message': 'user just joined'});
    _socketClient.socket.on('connect', (_) {
      print('Socket connected successfully');

      chatJoin(chatData.chatId);

      processPendingMessages();
    });
    _socketClient.socket.on('error', (errorData) {
      print('this error is from chat open');
      print('Socket Error: $errorData');
    });
    if (_socketClient.isConnected.value) {
      processPendingMessages();
    }
    listenToNewMessages();

    print('Chat data before getUser: $chatData');

    final String chatId = chatData.chatId;
    print('Chat ID: $chatId');
    getUser(chatId);
    // queryController = TextEditingController(text: query ?? '');
  }

  void chatJoin(String chatId) {
    _socketClient.socket.emit('onChatJoin', {'chatId': chatId});
    print('user has joined');
  }

  @override
  void onClose() {
    super.onClose();
    _socketClient.socket.off('newMessage');
    _socketClient.socket.off('error');
    messageController.dispose();
    _scrollController.dispose();
    //  _socketClient.disconnect();
  }
}

// fix the querycontroller later on