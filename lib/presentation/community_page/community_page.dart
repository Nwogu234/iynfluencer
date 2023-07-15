import '../community_page/widgets/body_item_widget.dart';
import 'controller/community_controller.dart';
import 'models/body_item_model.dart';
import 'models/community_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({Key? key})
      : super(
          key: key,
        );

  CommunityController controller =
      Get.put(CommunityController(CommunityModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 19,
                    right: 16,
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
                      itemCount: controller
                          .communityModelObj.value.bodyItemList.value.length,
                      itemBuilder: (context, index) {
                        BodyItemModel model = controller
                            .communityModelObj.value.bodyItemList.value[index];
                        return BodyItemWidget(
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
