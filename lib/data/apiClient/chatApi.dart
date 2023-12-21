import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
class ApiClient extends GetConnect {
  // Configure the base URL
  ApiClient() {
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl =
    'https://bv9pfcsd5b.execute-api.us-east-1.amazonaws.com/api/v1/';
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
  Future<Response> createChat(StartChatModel chat, String token) {
    return post(
      'chats/find/create',
      chat.toJson(), // replace with your specific endpoint path
      headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      },

    );
  }

  ///THIS IS FOR GETTING CHATS FOR CREATORS
  Future<Response> getAllChatsWithInfluencers(String token) {
    return get(
      'chats/influencers', // replace with your specific endpoint path
      headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      },

    );
  }

 /// THIS IS FOR GETTING CHATS FOR INFLUENCERS
  Future<Response> getAllChatsWithCreators(String token) {
    return get(
      'chats/creators', // replace with your specific endpoint path
      headers: {
        "Content-Type": "application/json",
        'Authorization': token,
      },

    );
  }


}