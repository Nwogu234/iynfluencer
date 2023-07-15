import 'package:get/get.dart';import 'job_details_item_model.dart';/// This class defines the variables used in the [job_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class JobDetailsModel {Rx<List<JobDetailsItemModel>> jobDetailsItemList = Rx(List.generate(2,(index) => JobDetailsItemModel()));

 }
