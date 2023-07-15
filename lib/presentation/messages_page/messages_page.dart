import '../messages_page/widgets/messages_page_item_widget.dart';
import 'controller/messages_controller.dart';
import 'models/messages_model.dart';
import 'models/messages_page_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage_1.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview_1.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_icon_button.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({Key? key})
      : super(
          key: key,
        );

  MessagesController controller =
      Get.put(MessagesController(MessagesModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA70001,
        appBar: CustomAppBar(
          height: getVerticalSize(
            63,
          ),
          leadingWidth: 55,
          leading: AppbarCircleimage1(
            imagePath: ImageConstant.imgEllipse208,
            margin: getMargin(
              left: 20,
              top: 14,
              bottom: 14,
            ),
          ),
          title: AppbarSearchview1(
            margin: getMargin(
              left: 26,
            ),
            hintText: "lbl_search_messages".tr,
            controller: controller.searchController,
          ),
          styleType: Style.bgOutlineIndigo50,
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          height: getVerticalSize(
                            1,
                          ),
                        );
                      },
                      itemCount: controller.messagesModelObj.value
                          .messagesPageItemList.value.length,
                      itemBuilder: (context, index) {
                        MessagesPageItemModel model = controller
                            .messagesModelObj
                            .value
                            .messagesPageItemList
                            .value[index];
                        return MessagesPageItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                  CustomIconButton(
                    height: 54,
                    width: 54,
                    margin: getMargin(
                      top: 183,
                      right: 20,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgFrameWhiteA700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
