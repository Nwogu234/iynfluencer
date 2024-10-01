import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';

class BidsArguments {
  final JobBids jobBid;
  final Job job;
  final ChatData? chatData;

  BidsArguments(this.jobBid, this.job, this.chatData);
}
