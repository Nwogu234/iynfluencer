import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';

class ApiClients extends GetConnect {
  // Configure the base URL
  ApiClients() {
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl =
    'https://iynf-kong.onrender.com/api/v1/';
  }
  dynamic errorHandler(Response response) {
    print(response.toString());
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 202:
        return response;
      case 500:
        throw "Server Error pls retry later";
      case 401:
        return Get.offAllNamed(
          AppRoutes.logInScreen,
        );
      case 403:
        throw 'Error occurred pls check internet and retry.';
      case 500:
      default:
        throw 'Error occurred retry';
    }
  }

  ///THIS IS FOR STARTING CHATS
  Future<Response> createChat(ChatData chat, String token) async{

    Response response = Response();
    try {
        response = await post(
        'chats/find/create',
        chat.toJson(),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      ); if (response.isOk) {
         print('Chats with influencer created successfully');
        return response;
      } else {
        print(response);
        print('Failed to create with influencer: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to create chat with influencer');
      }
    } catch (e) {
      print('$e from creating  chat with influencer');
      print(e);
      throw Exception('Server error');
    }
   

  }

  ///THIS IS FOR GETTING CHATS FOR CREATORS
  Future<Response> getAllChatsWithInfluencers(String token) async {
    Response response;
    try {
      response = await get(
        'chats/influencers',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        return response;
      } else {
        print(response);
        print(response.body);
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e from getting list of chats of influencers');
      print(e);
      throw Exception('Server error');
    }

  }

 /// THIS IS FOR GETTING CHATS FOR CREATORS
  Future<Response> getAllChatsWithCreators(String token) async {
    Response response;
    try {
      response = await get(
        'chats/creators',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        return response;
      } else {
        print(response);
        print('Failed to send message: ${response.statusCode}, ${response.body}');
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e from getting list of chats of creators');
      print(e);
      throw Exception('Server error');
    }
  }
  /// THIS IS FOR GETTING MESSAGES WITH INFLUENCERs CREATORS
  Future<Response> getAllMessages(
      String chatId, String token) async {
    Response response = Response();
    try {
      response = await get(
        'chats/$chatId/messages',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        return response;
      } else {
        throw Exception('Failed to fetch messages with influencer');
      }
    } catch (e) {
      print('Error fetching messages with influencer: $e');
      throw Exception('Server error');
    }
  }
  /// THIS IS FOR SENDING A MESSAGE
  Future<Response<dynamic>> sendMessage(Message message, String token) async {
  try {
    final response = await post(
      'chats/message/send', 
      message.toJson(), 
      headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      },
    );
    if (response.isOk) {
      print('Message sent and stored successfully');
      return response;
    } else {
      print('Failed to send message: ${response.statusCode}, ${response.body}');
      throw Exception('Failed to send message');
    }
  } catch (e) {
    print('Error sending message: $e');
    throw Exception('Server error');
  }
}
 /// THIS IS FOR DELETING A MESSAGE
  Future<Response> deleteMessage(String chatId, String messageId, String token) async {
    Response response;
    try {
      response = await delete(
        'chats/$chatId/message/$messageId/delete',
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      if (response.isOk) {
        return response;
      } else {
         print('Failed to delete message: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to delete message');
      }
    } catch (e) {
      print('Error deleting message: $e');
      throw Exception('Server error');
    }
  }
}