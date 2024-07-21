import 'package:get/get.dart';
import 'package:iynfluencer/presentation/creator_mark_job_details_screen/controller/creator_mark_job_detail_controller.dart';

/// A binding class for the JobMarkDetailsScreen.
///
/// This class ensures that the JobMarkDetailsController is created when the
/// JobDetailsScreen is first loaded.
class CreatorMarkJobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatorMarkJobDetailsController());
  }
}
