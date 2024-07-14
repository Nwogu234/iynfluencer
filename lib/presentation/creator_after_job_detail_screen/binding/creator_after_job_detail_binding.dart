import 'package:get/get.dart';
import 'package:iynfluencer/presentation/creator_after_job_detail_screen/controller/creator_after_job_detailcontroller.dart';

/// A binding class for the JobDetailsScreen.
///
/// This class ensures that the JobDetailsController is created when the
/// JobDetailsScreen is first loaded.
class CreatorAfterJobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatorAfterJobDetailsController());
  }
}
