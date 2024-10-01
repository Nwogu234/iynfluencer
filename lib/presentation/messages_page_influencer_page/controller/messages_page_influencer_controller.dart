import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:hive/hive.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/models/messages_page_influencer_model.dart';import 'package:flutter/material.dart';import 'package:flutter/material.dart';/// A controller class for the MessagesPageInfluencerPage.

/// This class manages the state of the MessagesPageInfluencerPage, including the
/// current messagesPageInfluencerModelObj
/* 
class MessagesPageInfluencerController extends GetxController {

MessagesPageInfluencerController(this.messagesPageInfluencerModelObj);

TextEditingController searchController = TextEditingController();

Rx<MessagesPageInfluencerModel> messagesPageInfluencerModelObj;

var messages = <String>[].obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;
  final storage = new FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  List<ChatData> chatList = <ChatData>[].obs;
  late RxList<ChatData> chatModelObj = <ChatData>[].obs;
  Rx<ChatData?> lastMessage = Rx<ChatData?>(null);
  RxInt unreadInfluencer = 0.obs;

  

  @override
  void onInit() {
    super.onInit();

    socketClient.connect();

    socketClient.socket.on('connected', (data) {
      messages.add(data.toString());
      update();
    });

    socketClient.socket.on('error', (errorData) {
      print('Socket Error: $errorData');
    });

    getUser();
  }

  
  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
  }

  
  void setUnreadInfluencer(int value) {
    unreadInfluencer.value = value;
  }

    
  getUser() async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        getCreatorsChat().then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }


  
  Future<void> getCreatorsChat() async {
    try {
      error('');
      isTrendLoading.value = true;
      token = await storage.read(key: "token");
      final Response response =
          await apiClient.getAllChatsWithCreators(token);
      List<dynamic> chatJsonList = response.body['data']['docs'];
      chatList.clear();
      print(chatJsonList.length);
      print(chatJsonList);
      if (chatJsonList.length > 0) {
        chatJsonList.forEach((e) {
          chatList.add(ChatData.fromJson(e));
        });
      }
      if (chatList.isEmpty) {
        error( 'You don\'s have Creators in your chats');
        empty = true;
        print('No chat data available.');
      } else {
        chatModelObj.value = chatList;
        error('');
        isTrendLoading.value = false;
      }
      isTrendLoading.value = false;
    } catch (e) {
      print('Error fetching influencers chat: $e');
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }


 @override 
 void onClose() { 
  socketClient.disconnect();
  searchController.dispose();
  super.onClose(); 
  } 
 }
 */

class MessagesPageInfluencerController extends GetxController {

MessagesPageInfluencerController(this.messagesPageInfluencerModelObj);

TextEditingController searchController = TextEditingController();

Rx<MessagesPageInfluencerModel> messagesPageInfluencerModelObj;

var messages = <String>[].obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;
  final storage = new FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  List<ChatData> chatList = <ChatData>[].obs;
  late RxList<ChatData> chatModelObj = <ChatData>[].obs;
  Rx<ChatData?> lastMessage = Rx<ChatData?>(null);
  RxInt unreadInfluencer = 0.obs;
  List<ChatData> uniqueList = <ChatData>[].obs;

  

  @override
  void onInit() {
    super.onInit();

    socketClient.connect();

    socketClient.socket.on('connected', (data) {
      messages.add(data.toString());
      update();
    });


    getUser();
  }

  
  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
  }

  
  void setUnreadInfluencer(int value) {
    unreadInfluencer.value = value;
  }

    
  getUser() async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        loadChatsFromHive().then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }


  
  
  void infcSearch(String query) {
    searchController.text = query;

    final lowerQuery = query.toLowerCase();
    print('This is the search query: $query');

    Future.delayed(Duration(milliseconds: 500), () {
      if (lowerQuery.isEmpty) {
        chatModelObj.value = chatList;
      } else {
        chatModelObj.value = chatList.where((chat) {
          final firstName = chat.creatorUser?.firstName?.toLowerCase() ?? '';
          final lastName = chat.creatorUser?.lastName?.toLowerCase() ?? '';
          final lastMessageText = chat.messages.isNotEmpty
              ? chat.messages.last.text.toLowerCase()
              : '';

          return firstName.contains(lowerQuery) ||
              lastName.contains(lowerQuery) ||
              lastMessageText.contains(lowerQuery);
        }).toList();
      }

      if (chatModelObj.isEmpty) {
        error('No Results Found');
        Get.snackbar(
          'No Results Found',
          'No chats match your search query.',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        );
      }
      searchController.clear();
    });
  }


  
  Future<void> getCreatorsChat() async {
  try {
    isTrendLoading.value = true;
    token = await storage.read(key: "token");
    final Response response = await apiClient.getAllChatsWithCreators(token);
    List<dynamic> chatJsonList = response.body['data']['docs'];
    chatList.clear();
    print(chatJsonList.length);
    print(chatJsonList);
    if (chatJsonList.isNotEmpty) {
      chatList.addAll(chatJsonList.map((e) => ChatData.fromJson(e)).toList());
      chatList.sort((a, b) {
        final aLastMessageTime =
              a.messages.isNotEmpty ? a.messages.last.createdAt : a.updatedAt;
          final bLastMessageTime =
              b.messages.isNotEmpty ? b.messages.last.createdAt : b.updatedAt;
          return bLastMessageTime.compareTo(aLastMessageTime);
      });
      chatModelObj.value = chatList;
      error('');
    } if (chatList.isEmpty) {
        error('You dont\'s have Influencers in your chats');
        empty = true;
        print('No chat data available.');
      } 
    isTrendLoading.value = false;
  } catch (e) {
    print('Error fetching influencers chat: $e');
    error('Something went wrong');
    isTrendLoading.value = false;
  }
}

 Future<void> saveChats(List<ChatData> chats) async {
    try {
      final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chat_data');
      await chatBox.clear();
      await chatBox.addAll(chats);

      print('chats saved sucessfully');
    } catch (e) {
      print('Error saving messages: $e');
    }
  }

Future<void> loadChatsFromHive() async {
  isLoading.value = false; 
  try {
    final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chat_data');
    final List<ChatData> storedChats = chatBox.values
        .where((chat) => chat.influencerUserId == user.userModelObj.value.userId)
        .toList();

    if (storedChats.isNotEmpty) {
      final Set<String> uniqueCreatorUserIds = {};
      uniqueList.clear(); 
      
      for (var chat in storedChats) {
        if (chat is ChatData) {
          final String creatorUserId = chat.creatorUserId;

          // Check if the creator user ID is already in the set
          if (!uniqueCreatorUserIds.contains(creatorUserId)) {
            uniqueCreatorUserIds.add(creatorUserId);
            uniqueList.add(chat); // Add unique chat to the list
          } else {
            print('Duplicate chat detected for creatorUserId: $creatorUserId');
          }
        } else {
          print('Warning: Expected ChatData instance but got ${chat.runtimeType}');
        }
      }

      // Sort unique chats based on last message time or updated time
      uniqueList.sort((a, b) {
        final DateTime? aLastMessageTime = a.lastMessageTime ?? a.updatedAt;
        final DateTime? bLastMessageTime = b.lastMessageTime ?? b.updatedAt;

        return (bLastMessageTime ?? DateTime.now())
            .compareTo(aLastMessageTime ?? DateTime.now());
      });

      chatList.clear();
      chatList.addAll(uniqueList); // Update chatList with unique chats
      chatModelObj.value = chatList;

      error(''); // Clear any previous errors
      print('Loaded chats from Hive');
    } else {
      print('No chats found in Hive. Fetching from API...');
      await fetchAndDisplayChats(); // Fetch from API if no chats found
    }
  } catch (e) {
    print('Error loading chats from Hive: $e');
    error('Failed to load chats from local storage.');
  } finally {
    isLoading.value = false; // Set loading to false at the end
  }
}

  
Future<void> fetchAndDisplayChats() async {
  isLoading.value = true;
  try {
    await getCreatorsChat(); 
    print('Fetched chat list: $chatList');
    final Set<String> uniqueCreatorUserIds = {};
    uniqueList.clear();


    for (var chat in chatList) {
      if (chat is ChatData) {
        final String creatorUserId = chat.creatorUserId;

        if (!uniqueCreatorUserIds.contains(creatorUserId)) {
          uniqueCreatorUserIds.add(creatorUserId);
          
        uniqueList.add(chat);
        }
      } else {
        print('Warning: Expected ChatData instance but got ${chat.runtimeType}'); 
      }
    }

    chatModelObj.value = uniqueList; 

    await saveChats(uniqueList); 

    print('Chat model object: ${chatModelObj.value.toString()}');

    if (chatModelObj.isEmpty) {
      error('You don\'t have Influencers in your chats');
      empty = true;
    }
  } catch (e) {
    print('Error in fetchAndDisplayChats: $e');
    error('Something went wrong');
  } finally {
    isLoading.value = false;
  }
}



 @override 
 void onClose() { 
 // socketClient.disconnect();
  searchController.dispose();
  super.onClose(); 
  } 
 }
