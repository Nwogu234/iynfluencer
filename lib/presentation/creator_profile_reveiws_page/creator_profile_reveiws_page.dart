import '../creator_profile_reveiws_page/widgets/listellipse207_item_widget.dart';
import 'controller/creator_profile_reveiws_controller.dart';
import 'models/creator_profile_reveiws_model.dart';
import 'models/listellipse207_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CreatorProfileReveiwsPage extends StatelessWidget {
  CreatorProfileReveiwsPage({Key? key})
      : super(
          key: key,
        );

  CreatorProfileReveiwsController controller = Get.put(
      CreatorProfileReveiwsController(CreatorProfileReveiwsModel().obs));

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
                  top: 42,
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
                          38,
                        ),
                      );
                    },
                    itemCount: controller.creatorProfileReveiwsModelObj.value
                        .listellipse207ItemList.value.length,
                    itemBuilder: (context, index) {
                      Listellipse207ItemModel model = controller
                          .creatorProfileReveiwsModelObj
                          .value
                          .listellipse207ItemList
                          .value[index];
                      return Listellipse207ItemWidget(
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
