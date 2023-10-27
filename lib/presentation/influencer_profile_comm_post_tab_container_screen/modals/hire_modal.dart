import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/controller/influencer_profile_comm_post_hire_modal_controller.dart';
import 'package:iynfluencer/presentation/jobs_jobs_influencer_page/models/jobs_jobs_influencer_model.dart';
import 'package:iynfluencer/presentation/post_page_screen/post_page_screen.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/skeletons.dart';
import 'package:timeago/timeago.dart' as timeago;

class HireModal extends StatelessWidget {
  Influencer influencer;
  HireModal({Key? key, required this.influencer}) : super(key: key);
  final InfluencerProfileCommHireModalContainerController _controller =
      Get.put(InfluencerProfileCommHireModalContainerController());

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: getPadding(top: 12, bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: getPadding(top: 5, bottom: 10),
            decoration: AppDecoration.outlineIndigo501,
            child: Center(
              child: Text(
                'Posted Jobs',
                style: TextStyle(
                  fontSize: getFontSize(17),
                  fontFamily: 'Satoshi',
                  color: ColorConstant.black900,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (_controller.isLoading.value) {
                  // return CustomLoadingWidget(
                  //   animationController: animationController,
                  // ); // Your custom loading widget
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: false,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        height: getVerticalSize(
                          10,
                        ),
                      );
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InfluencerHireJobSkeletonWidget(); // Skeleton widget
                    },
                  );
                } else {
                  if (_controller.jobsForHire.isEmpty) {
                    return Container(
                      child: Center(
                        child: Text(
                          'No Jobs Available',
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              17,
                            ),
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      physics:  BouncingScrollPhysics(),
                      itemCount: _controller.jobsForHire.length,
                      itemBuilder: (context, index) => SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding: getPadding(left: 12, right: 12),
                          child: Obx(
                            () => InkWell(
                              onTap: () {
                                if (_controller.selectedJob.value ==
                                    _controller
                                        .jobsForHire[index].jobId!) {
                                  _controller.selectedJob.value = '';
                                } else {
                                  _controller.selectedJob.value = _controller
                                      .jobsForHire[index].jobId!;
                                }
                                print (_controller.selectedJob);
                              },
                              child: Container(
                                margin: getMargin(
                                  top: 17,
                                ),
                                padding: getPadding(
                                  left: 12,
                                  top: 7,
                                  right: 12,
                                  bottom: 7,
                                ),
                                decoration: AppDecoration.outlineIndigo508
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder7,
                                        border: Border.all(
                                          color:
                                              _controller.selectedJob.value ==
                                                      _controller.jobsForHire
                                                          [index].jobId!
                                                  ? ColorConstant.blue900
                                                  : ColorConstant.indigo50,
                                          width: getHorizontalSize(
                                            1,
                                          ),
                                        )),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 2,
                                      ),
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGroup85233,
                                            height: getSize(
                                              30,
                                            ),
                                            width: getSize(
                                              30,
                                            ),
                                            radius: BorderRadius.circular(
                                              getSize(
                                                15.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: getPadding(
                                              left: 12,
                                              top: 5,
                                              bottom: 5,
                                            ),
                                            child: Text(
                                              _controller.jobsForHire
                                                  [index].title!,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSatoshiBold14Gray900ab,
                                            ),
                                          ),
                                          Flexible(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.4,
                                              child: Padding(
                                                padding: getPadding(
                                                  left: 13,
                                                  top: 9,
                                                  bottom: 3,
                                                ),
                                                child: Text(
                                                  timeago.format(
                                                      DateTime.parse(
                                                          _controller
                                                              .jobsForHire
                                                              [index]
                                                              .updatedAt!)),
                                                  // "lbl_1_week_ago".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight125,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getHorizontalSize(
                                        310,
                                      ),
                                      margin: getMargin(
                                        top: 11,
                                      ),
                                      child: Text(
                                        _controller.jobsForHire[index]
                                            .description!,
                                        // "msg_looking_for_a_game3".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSatoshiLight14Gray900ab,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ),
          Container(
            padding: getPadding(left: 12, right: 12),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Obx(
                  () => CustomButton(
                    height: getVerticalSize(40),
                    width: double.maxFinite,
                    text: "lbl_use_job".tr,
                    padding: ButtonPadding.PaddingT4,
                    onTap: () {
                      _controller.selectedJob.value == ''
                          ? null
                          : _controller.sendJobRequest(
                              _controller.selectedJob.value,
                              influencer.influencerId!);
                    },
                    variant: _controller.selectedJob.value == '' ||
                            _controller.isRequestLoading.value == true
                        ? ButtonVariant.FillCyan30066
                        : ButtonVariant.FillCyan300,
                    fontStyle: ButtonFontStyle.SatoshiBold15,
                    loading: _controller.isRequestLoading.value ? true : false,
                    // prefixWidget: Container(
                    //   margin: getMargin(right: 6),
                    //   child: CustomImageView(
                    //       svgPath: ImageConstant.imgFrameWhiteA70018x18),
                    // ),
                  ),
                ),
                CustomButton(
                  height: getVerticalSize(40),
                  width: double.maxFinite,
                  text: "lbl_post_job".tr,
                  variant: ButtonVariant.FillGray200ab,
                  padding: ButtonPadding.PaddingAll4,
                  fontStyle: ButtonFontStyle.SatoshiBold15Gray900,
                  onTap: () {
                    Get.to(PostPageScreen(
                      fromHire: true,
                      fromHireInfluencerId: influencer.influencerId!,
                    ));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class ModalWithPageView extends StatelessWidget {
//   const ModalWithPageView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         appBar:
//             AppBar(leading: Container(), title: Text('Modal With Page View')),
//         body: SafeArea(
//           bottom: false,
//           child: PageView(
//             children: List.generate(
//                 2,
//                 (index) => ListView(
//                       shrinkWrap: true,
//                       controller: ModalScrollController.of(context),
//                       children: ListTile.divideTiles(
//                         context: context,
//                         tiles: List.generate(
//                             3,
//                             (index) => ListTile(
//                                   title: Text('Item'),
//                                 )),
//                       ).toList(),
//                     )),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SimpleModal extends StatelessWidget {
//   const SimpleModal({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         child: CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//           leading: Container(), middle: Text('Modal Page')),
//       child: Center(),
//     ));
//   }
// }
