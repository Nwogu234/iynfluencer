import '../creator_hireslist_page/widgets/hires_item_widget.dart';
import 'controller/creator_hireslist_controller.dart';
import 'models/creator_hireslist_model.dart';
import 'models/hires_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_drop_down.dart';

// ignore_for_file: must_be_immutable
class CreatorHireslistPage extends StatelessWidget {
  CreatorHireslistPage({Key? key}) : super(key: key);

  CreatorHireslistController controller =
      Get.put(CreatorHireslistController(CreatorHireslistModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: size.width,
                child: Padding(
                    padding: getPadding(left: 20, top: 14, right: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding:
                                        getPadding(top: 8, bottom: 7),
                                    child: Text("lbl_all_hires".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSatoshiBold14Gray900)),
                                CustomDropDown(
                                    width: getHorizontalSize(120),
                                    icon: SizedBox.shrink(),
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    hintText: "lbl_filter".tr,
                                    variant:
                                        DropDownVariant.OutlineIndigo50,
                                    padding: DropDownPadding.PaddingT8,
                                    fontStyle:
                                        DropDownFontStyle.SatoshiBold135,
                                    items: controller
                                        .creatorHireslistModelObj
                                        .value
                                        .dropdownItemList
                                        .value,
                                    prefix: Container(
                                        margin: getMargin(
                                            left: 13, top: 5, bottom: 5),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgSignalBlack900)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(35)),
                                    onChanged: (value) {
                                      controller.onSelected(value);
                                    })
                              ]),
                          Expanded(
                              child: Padding(
                                  padding: getPadding(top: 15),
                                  child: Obx(() => ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(1));
                                      },
                                      itemCount: controller
                                          .creatorHireslistModelObj
                                          .value
                                          .hiresItemList
                                          .value
                                          .length,
                                      itemBuilder: (context, index) {
                                        HiresItemModel model = controller
                                            .creatorHireslistModelObj
                                            .value
                                            .hiresItemList
                                            .value[index];
                                        return HiresItemWidget(model,
                                            onTapBidcard: () {
                                          onTapBidcard();
                                        });
                                      }))))
                        ])))));
  }

  /// Navigates to the jobClientScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the jobClientScreen.
  onTapBidcard() {
    Get.toNamed(
      AppRoutes.jobClientScreen,
    );
  }
}
