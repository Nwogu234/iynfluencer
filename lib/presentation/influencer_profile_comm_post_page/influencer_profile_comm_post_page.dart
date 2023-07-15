import '../influencer_profile_comm_post_page/widgets/listpostcaption_item_widget.dart';
import 'controller/influencer_profile_comm_post_controller.dart';
import 'models/influencer_profile_comm_post_model.dart';
import 'models/listpostcaption_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class InfluencerProfileCommPostPage extends StatelessWidget {
  InfluencerProfileCommPostPage({Key? key})
      : super(
          key: key,
        );

  InfluencerProfileCommPostController controller = Get.put(
      InfluencerProfileCommPostController(
          InfluencerProfileCommPostModel().obs));

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
              Padding(
                padding: getPadding(
                  left: 20,
                  top: 25,
                  right: 20,
                ),
                child: Obx(
                  () => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        height: getVerticalSize(
                          18,
                        ),
                      );
                    },
                    itemCount: controller.influencerProfileCommPostModelObj
                        .value.listpostcaptionItemList.value.length,
                    itemBuilder: (context, index) {
                      ListpostcaptionItemModel model = controller
                          .influencerProfileCommPostModelObj
                          .value
                          .listpostcaptionItemList
                          .value[index];
                      return ListpostcaptionItemWidget(
                        model,
                      );
                    },
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
