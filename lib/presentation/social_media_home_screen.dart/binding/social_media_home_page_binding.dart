import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';

import 'package:get/get.dart';
import 'package:iynfluencer/presentation/messages_page/controller/messages_controller.dart';
import 'package:iynfluencer/presentation/messages_page/models/messages_model.dart';

class SocialMediaHomePageBinding extends Bindings {


      
  @override
  void dependencies() {
      // Retrieve the ChatData passed as an argument
    Get.lazyPut(() => MessagesController());

  }
}