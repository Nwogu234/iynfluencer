import '../edit_profile_comm_posts_page/widgets/listpostcaption1_item_widget.dart';
import 'controller/edit_profile_comm_posts_controller.dart';
import 'models/edit_profile_comm_posts_model.dart';
import 'models/listpostcaption1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class EditProfileCommPostsPage extends StatelessWidget {
  EditProfileCommPostsPage({Key? key})
      : super(
          key: key,
        );

  EditProfileCommPostsController controller =
      Get.put(EditProfileCommPostsController(EditProfileCommPostsModel().obs));

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
                  top: 32,
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
                    itemCount: controller.editProfileCommPostsModelObj.value
                        .listpostcaption1ItemList.value.length,
                    itemBuilder: (context, index) {
                      Listpostcaption1ItemModel model = controller
                          .editProfileCommPostsModelObj
                          .value
                          .listpostcaption1ItemList
                          .value[index];
                      return Listpostcaption1ItemWidget(
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
