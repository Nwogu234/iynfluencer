import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/messages_page/controller/messages_controller.dart';
import 'package:iynfluencer/presentation/splash_screen/models/splash_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:async';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  var progress = 0.0.obs;
  final storage = FlutterSecureStorage();
  final ApiClients apiClient = ApiClients();

  void updateProgress(double value) {
    progress.value = value;
  }

  Future<void> _delayedProgressUpdate(
      int milliseconds, double increment) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    progress.value += increment;
  }

/* 
  @override
  void onReady() async {
    String? token = await storage.read(key: "token");
    //  token=null;
    //   await storage.write(key: 'activeProfile', value: null);

    await _delayedProgressUpdate(2000, 0.2);

    if (token == null) {
      await _delayedProgressUpdate(2000, 0.8);
      Get.offNamed(AppRoutes.onboardingScreenTwoScreen);
      return;
    } else {
      bool hasExpired = JwtDecoder.isExpired(token);
      print('Token Expired: $hasExpired');
      //   await _delayedProgressUpdate(1000, 0.8);
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      int exp = decodedToken['exp'];
      int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      print('Token Expiration Time: $exp');
      print('Current Time: $now');

      if (exp < now) {
        print('Token has expired');
        // Navigate to login screen
      } else {
        print('Token is still valid');
      }

      if (hasExpired) {
        await storage.write(key: 'activeProfile', value: null);
        Get.offNamed(AppRoutes.logInScreen);
        return;
      } else {
        String? activeProfile = await storage.read(key: "activeProfile");
        if (activeProfile == "Creator") {
          Get.offNamed(AppRoutes.homeCreatorContainerScreen);
        } else if (activeProfile == "Influencer") {
          Get.offNamed(AppRoutes.influencerTabScreen);
        } else {
          Get.offNamed(AppRoutes.chooseProfile);
        }
      }
    }
  } */

  void onReady() async {
    String? token = await storage.read(key: "token");
    token = null;
    await storage.write(key: 'activeProfile', value: null);
    String? activeProfile = await storage.read(key: "activeProfile");

    await _delayedProgressUpdate(2000, 0.2);

    if (token == null) {
      await _delayedProgressUpdate(1000, 0.8);
      Get.offNamed(AppRoutes.onboardingScreenTwoScreen);
    } else {
      bool hasExpired = JwtDecoder.isExpired(token);

      await _delayedProgressUpdate(1000, 0.8);

      if (hasExpired == true) {
        print(hasExpired);
        Get.offNamed(AppRoutes.logInScreen);
      } else if (activeProfile == "Creator") {
        Get.offNamed(AppRoutes.homeCreatorContainerScreen);
      } else if (activeProfile == null || activeProfile.isEmpty) {
        Get.offNamed(AppRoutes.chooseProfile);
      } else {
        print(activeProfile);
        Get.offNamed(AppRoutes.influencerTabScreen);
      }
    }
  }

   void syncInfluencerChats() async {
    String? token = await storage.read(key: "token");
    final Response response =
        await apiClient.getAllChatsWithInfluencers(token!);
    if (response.isOk && response.body != null) {
      List<dynamic> chatJsonList = response.body['data']['docs'];

      await updateHiveWithChats(chatJsonList);
    } else {
      print('Error occured when syncing chats');
    }
  }

  void syncCreatorChats() async {
    String? token = await storage.read(key: "token");
    final Response response = await apiClient.getAllChatsWithCreators(token!);
    if (response.isOk && response.body != null) {
      List<dynamic> chatJsonList = response.body['data']['docs'];

      await updateHiveWithChats(chatJsonList);
    } else {
      print('Error occured when syncing chats');
    }
  }


Future<void> updateHiveWithChats(List<dynamic> fetchedChats) async {
  try {
    final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chat_data');

    for (var chat in fetchedChats) {
      ChatData chatData = ChatData.fromJson(chat);

      if (chatBox.containsKey(chatData.chatId)) {
        ChatData? existingChat = chatBox.get(chatData.chatId);

        if (existingChat != null && existingChat != chatData) {
          await chatBox.put(chatData.chatId, chatData);
          print("Updated chat with ID: ${chatData.chatId}");
        } else {
          print("No changes detected for chat with ID: ${chatData.chatId}, skipping update.");
        }
      } else {
        await chatBox.put(chatData.chatId, chatData);
        print("Inserted new chat with ID: ${chatData.chatId}");
      }
    }

    print("Hive successfully updated with server data");
  } catch (e) {
    print("Error updating Hive with server data: $e");
  }
}
}
