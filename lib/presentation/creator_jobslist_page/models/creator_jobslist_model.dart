import 'package:get/get.dart';import 'jobposting_item_model.dart';/// This class defines the variables used in the [creator_jobslist_page],
/// and is typically used to hold data that is passed between different parts of the application.
class CreatorJobslistModel {Rx<List<JobpostingItemModel>> jobpostingItemList = Rx(List.generate(4,(index) => JobpostingItemModel()));

 }
