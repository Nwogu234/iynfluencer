import '../creator_jobslist_page/widgets/jobposting_item_widget.dart';
import 'controller/creator_jobslist_controller.dart';
import 'models/creator_jobslist_model.dart';
import 'models/jobposting_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CreatorJobslistPage extends StatelessWidget {
  CreatorJobslistPage({Key? key}) : super(key: key);

  CreatorJobslistController controller =
  Get.put(CreatorJobslistController(CreatorJobslistModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount:
                controller.creatorJobslistModelObj.value.jobpostingItemList.value.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: getVerticalSize(20),
                  );
                },
                itemBuilder: (context, index) {
                  JobpostingItemModel model =
                  controller.creatorJobslistModelObj.value.jobpostingItemList.value[index];
                  return JobpostingItemWidget(model);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
