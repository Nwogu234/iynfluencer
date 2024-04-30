import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/influencer_profile_about_page/models/influencer_profile_about_model.dart';
import 'package:uuid/uuid.dart';

/// A controller class for the InfluencerProfileAboutPage.
///
/// This class manages the state of the InfluencerProfileAboutPage, including the
/// current influencerProfileAboutModelObj
class InfluencerProfileAboutController extends GetxController {
  
  InfluencerProfileAboutController(this.influencerProfileAboutModelObj);

  Rx<InfluencerProfileAboutModel> influencerProfileAboutModelObj;
  }