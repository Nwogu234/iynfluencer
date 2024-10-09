import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';

class JobBidsArguments {
  final Jobz? selectedJob;
  final ChatData? chatData;
  final JobBids? jobBids;

  JobBidsArguments(this.selectedJob,this.chatData,this.jobBids);
}
