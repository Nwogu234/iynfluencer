import '../creator_profile_comm_posts_page/widgets/listpostcaption2_item_widget.dart';
import 'controller/creator_profile_comm_posts_controller.dart';
import 'models/creator_profile_comm_posts_model.dart';
import 'models/listpostcaption2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CreatorProfileCommPostsPage extends StatelessWidget {
  CreatorProfileCommPostsPage({Key? key})
      : super(
          key: key,
        );

  CreatorProfileCommPostsController controller = Get.put(
      CreatorProfileCommPostsController(CreatorProfileCommPostsModel().obs));

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
                  top: 29,
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
                    itemCount: controller.creatorProfileCommPostsModelObj.value
                        .listpostcaption2ItemList.value.length,
                    itemBuilder: (context, index) {
                      Listpostcaption2ItemModel model = controller
                          .creatorProfileCommPostsModelObj
                          .value
                          .listpostcaption2ItemList
                          .value[index];
                      return Listpostcaption2ItemWidget(
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
