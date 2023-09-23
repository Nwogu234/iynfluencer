import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';

/// This class is used in the [listmediainflue_item_widget] screen.
class ListmediainflueItemModel {
  RxList<JobsMyBidsInfluencerModel> listmediainflueItemList =
      RxList(List.generate(4, (index) => JobsMyBidsInfluencerModel()));

  Rx<String> mediainfluencerTxt = Rx("Media Influencer");

  Rx<String> victorucheTxt = Rx("Victor Uche");

// Rx<String>? id = Rx("");
}

// class Job {
//   String? sId;
//   String? creatorId;
//   String? title;
//   String? description;
//   List<String>? responsibilities;
//   List<String>? category;
//   int? budgetFrom;
//   int? budgetTo;
//   int? duration;
//   bool? public;
//   bool? hired;
//   bool? suspended;
//   String? jobId;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   Job(
//       {this.sId,
//       this.creatorId,
//       this.title,
//       this.description,
//       this.responsibilities,
//       this.category,
//       this.budgetFrom,
//       this.budgetTo,
//       this.duration,
//       this.public,
//       this.hired,
//       this.suspended,
//       this.jobId,
//       this.createdAt,
//       this.updatedAt,
//       this.iV});

//   Job.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     creatorId = json['creatorId'];
//     title = json['title'];
//     description = json['description'];
//     responsibilities = json['responsibilities'].cast<String>();
//     category = json['category'].cast<String>();
//     budgetFrom = json['budgetFrom'];
//     budgetTo = json['budgetTo'];
//     duration = json['duration'];
//     public = json['public'];
//     hired = json['hired'];
//     suspended = json['suspended'];
//     jobId = json['jobId'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['creatorId'] = this.creatorId;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['responsibilities'] = this.responsibilities;
//     data['category'] = this.category;
//     data['budgetFrom'] = this.budgetFrom;
//     data['budgetTo'] = this.budgetTo;
//     data['duration'] = this.duration;
//     data['public'] = this.public;
//     data['hired'] = this.hired;
//     data['suspended'] = this.suspended;
//     data['jobId'] = this.jobId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
