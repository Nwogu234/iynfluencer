import '../controller/home_creator_controller.dart';
import '../models/trendinghorizon_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class TrendinghorizonItemWidget extends StatelessWidget {
  TrendinghorizonItemWidget(
    this.trendinghorizonItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TrendinghorizonItemModel trendinghorizonItemModelObj;

  var controller = Get.find<HomeCreatorController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: getPadding(
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle5055,
                height: getSize(
                  90,
                ),
                width: getSize(
                  90,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    45,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: getMargin(
                        top: 1,
                        bottom: 1,
                      ),
                      color: ColorConstant.gray20001,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusStyle.circleBorder7,
                      ),
                      child: Container(
                        height: getSize(
                          14,
                        ),
                        width: getSize(
                          14,
                        ),
                        decoration: AppDecoration.fillGray20001.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder7,
                        ),
                        child: Stack(
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgClose,
                              height: getVerticalSize(
                                12,
                              ),
                              width: getHorizontalSize(
                                14,
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 6,
                      ),
                      child: Text(
                        "lbl_nkiru_james".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold125,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
