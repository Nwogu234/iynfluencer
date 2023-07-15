import '../controller/comments_on_community_controller.dart';
import '../models/listgroup860_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Listgroup860ItemWidget extends StatelessWidget {
  Listgroup860ItemWidget(
    this.listgroup860ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listgroup860ItemModel listgroup860ItemModelObj;

  var controller = Get.find<CommentsOnCommunityController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 2,
          top: 14,
          right: 2,
          bottom: 14,
        ),
        decoration: AppDecoration.outlineIndigo502,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(
                left: 2,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup85271,
                    height: getSize(
                      40,
                    ),
                    width: getSize(
                      40,
                    ),
                    radius: BorderRadius.circular(
                      getSize(
                        20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 13,
                      top: 12,
                      bottom: 9,
                    ),
                    child: Text(
                      "lbl_mark_adebayo".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold13Gray900ab,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrameBlueGray40018x18,
                    height: getSize(
                      18,
                    ),
                    width: getSize(
                      18,
                    ),
                    margin: getMargin(
                      top: 11,
                      bottom: 11,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: getHorizontalSize(
                303,
              ),
              margin: getMargin(
                left: 2,
                top: 10,
                right: 25,
                bottom: 1,
              ),
              child: Text(
                "msg_hello_i_m_interested".tr,
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiLight138Bluegray9009e,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
