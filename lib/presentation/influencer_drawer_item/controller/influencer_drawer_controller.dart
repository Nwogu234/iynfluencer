import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import '../models/influencer_drawer_model.dart';

/// A controller class for the CreatorProfileDraweritem.
///
/// This class manages the state of the CreatorProfileDraweritem, including the
/// current creatorProfileModelObj
class InfluencerDrawerController extends GetxController {
  Rx<InfluencerDrawerModel> influencerProfileModelObj =
      InfluencerDrawerModel().obs;

  final UserController user = Get.find();

  // getUser() async {
  //   try {
  //     await user.getUser();
  //     if (user.userModelObj.value.avatar) {
  //       // error('Something went wrong');
  //       // isLoading.value = false;
  //     } else {
  //       //
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void onInit() {
    // getUser();

    super.onInit();
  }
}
