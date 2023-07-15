import '../controller/comments_on_community_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CommentsOnCommunityScreen.
///
/// This class ensures that the CommentsOnCommunityController is created when the
/// CommentsOnCommunityScreen is first loaded.
class CommentsOnCommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommentsOnCommunityController());
  }
}
