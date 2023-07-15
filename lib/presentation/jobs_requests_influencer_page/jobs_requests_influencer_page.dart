import '../jobs_requests_influencer_page/widgets/listgroup855_item_widget.dart';
import 'controller/jobs_requests_influencer_controller.dart';
import 'models/jobs_requests_influencer_model.dart';
import 'models/listgroup855_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class JobsRequestsInfluencerPage extends StatelessWidget {
  JobsRequestsInfluencerPage({Key? key})
      : super(
          key: key,
        );

  JobsRequestsInfluencerController controller = Get.put(
      JobsRequestsInfluencerController(JobsRequestsInfluencerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: getPadding(
                    left: 20,
                    top: 22,
                    right: 20,
                  ),
                  child: Obx(
                    () => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          height: getVerticalSize(
                            22,
                          ),
                        );
                      },
                      itemCount: controller.jobsRequestsInfluencerModelObj.value
                          .listgroup855ItemList.value.length,
                      itemBuilder: (context, index) {
                        Listgroup855ItemModel model = controller
                            .jobsRequestsInfluencerModelObj
                            .value
                            .listgroup855ItemList
                            .value[index];
                        return Listgroup855ItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
