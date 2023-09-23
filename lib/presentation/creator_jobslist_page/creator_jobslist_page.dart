import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/job_details_screen/controller/job_details_controller.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import '../creator_jobslist_page/widgets/jobposting_item_widget.dart';
import 'controller/creator_jobslist_controller.dart';
import 'models/creator_jobslist_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import '../../widgets/skeletons.dart';

class CreatorJobslistPage extends StatefulWidget {
  CreatorJobslistPage({Key? key}) : super(key: key);

  @override
  State<CreatorJobslistPage> createState() => _CreatorJobslistPageState();
}

class _CreatorJobslistPageState extends State<CreatorJobslistPage>
    with SingleTickerProviderStateMixin {
  late CreatorJobslistController controller;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Initialize creatorJobslistModelObj here
  final creatorJobslistModelObj = CreatorJobslistModel();

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    // Create the controller using jobpostingItemList from creatorJobslistModelObj
    // Create the controller using jobpostingItemList from creatorJobslistModelObj
    controller = Get.put(CreatorJobslistController(
      creatorJobslistModelObj.jobpostingItemList,
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  onTapDetailcard(Job selectedJob) {
    final jobDetailsController = Get.put(JobDetailsController());
    jobDetailsController.setSelectedJob(selectedJob);

    Get.to(
      JobDetailsScreen(selectedJob: selectedJob),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Obx(() {
        if (controller.isLoading.value) {
          return CustomLoadingWidget(
            animationController: animationController,
          ); // Your custom loading widget
        } else if (controller.error.value.isNotEmpty) {
          return ResponsiveErrorWidget(
            errorMessage: controller.error.value,
            onRetry: () {
              final newJob = Job(
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
                creator: [],
                bidsCount: 0,
              );
              controller.getJobs();
              controller.getNewJob(newJob);
            },
            fullPage: true,
          ); // Your error widget
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Obx(
                () => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.isTrendLoading.value
                      ? 5 // Adjust the number of skeleton items as needed
                      : controller.creatorJobslistModelObj.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: getVerticalSize(20),
                    );
                  },
                  itemBuilder: (context, index) {
                    if (controller.isTrendLoading.value) {
                      return TrendinghorizonItemSkeletonWidget(); // Skeleton widget
                    } else {
                      Job model = controller.creatorJobslistModelObj[index];
                      return JobpostingItemWidget(
                          creatorJobslistModelObj: model,
                          index: index,
                          onTapDetailcard: () {
                            onTapDetailcard(model);
                          });
                    }
                  },
                ),
              ))
            ],
          );
        }
      }),
    ));
  }
}
