import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';

class BidsArguments {
  final JobBids jobBid;
  final Job job;

  BidsArguments(this.jobBid, this.job);
}