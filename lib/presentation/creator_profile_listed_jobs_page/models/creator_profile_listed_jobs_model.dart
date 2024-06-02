import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';

/// This class defines the variables used in the [creator_profile_listed_jobs_page],
/// and is typically used to hold data that is passed between different parts of the application.


class CreatorProfileListedJobsModel {
  RxList<Job> jobpostingItemList = RxList(List.generate(
      4,
      (index) => Job(
            id: 'placeholder_id',
            creatorId: 'placeholder_creator_id',
            title: 'New Job Title',
            description: 'No description available.',
            responsibilities: ['No responsibilities specified'],
            category: ['Uncategorized'],
            budgetFrom: 0,
            budgetTo: 0,
            duration: 0,
            public: true,
            hired: false,
            suspended: false,
            jobId: 'placeholder_job_id',
            createdAt: '2023-08-17T00:00:00.000Z',
            updatedAt: '2023-08-17T00:00:00.000Z',
            version: 1,
            // creator: [],
            bidsCount: 0,
          )));
}

