import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';

class JobArguments {
  final Job selectedJob;
  final ChatData chatData;

  JobArguments(this.selectedJob, this.chatData);
}
