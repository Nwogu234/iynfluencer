import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';

/// This class is used in the [listmediainflue_item_widget] screen.
class ListmediainflueItemModel {
  RxList<JobsMyBidsInfluencerModel> listmediainflueItemList =
      RxList(List.generate(4, (index) => JobsMyBidsInfluencerModel()));

  Rx<String> mediainfluencerTxt = Rx("Media Influencer");

  Rx<String> victorucheTxt = Rx("Victor Uche");
}
