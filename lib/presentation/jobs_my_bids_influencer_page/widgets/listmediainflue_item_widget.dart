import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/presentation/job_my_bids_detail_screen/job_my_bids_detail_screen.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controller/jobs_my_bids_influencer_controller.dart';
import '../models/listmediainflue_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class ListmediainflueItemWidget extends StatelessWidget {
  ListmediainflueItemWidget(
    this.listmediainflueItemModelObj, 
     this.chatData,{
    Key? key,
  }) : super(
          key: key,
        );

  JobsMyBidsInfluencerModel? listmediainflueItemModelObj;
   ChatData? chatData;

  // JobsMyBidsInfluencerController controller =
  //     Get.put<JobsMyBidsInfluencerController>();

  @override
  Widget build(BuildContext context) {
    
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return GestureDetector(
        onTap: (() {
          Get.to(
            JobMyBidsDetailsScreen(
              selectedJob: listmediainflueItemModelObj?.job!,
              jobMyBids: listmediainflueItemModelObj,
              chatData: chatData,
            ),
          );
        }),
        child: SizedBox(
          width: double.maxFinite,
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listmediainflueItemModelObj?.job?.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold16,
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgVector,
                      height: getVerticalSize(
                        13,
                      ),
                      width: getHorizontalSize(
                        13,
                      ),
                      margin: getMargin(
                        top: 11,
                        bottom: 9,
                        right: 5                     
                         ),
                      color: ColorConstant.black900,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
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
                    decoration: AppDecoration.outlineIndigo508.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder7,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 2,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                fit: BoxFit.cover,
                                url: listmediainflueItemModelObj?.job?.creatorDetails?.avatar ??  ImageConstant.imgGroup85233,
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
                              Padding(
                                padding: getPadding(
                                  left: 12,
                                  top: 5,
                                  bottom: 5,
                                ),
                                child: Text(
                                  "",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold14Gray900ab,
                                ),
                              ),
                         Text(
                              "${capitalizeFirstLetter(listmediainflueItemModelObj?.job?.creatorDetails?.firstName ?? 'Mark')} ${capitalizeFirstLetter(listmediainflueItemModelObj?.job?.creatorDetails?.lastName ?? 'Adebayo')}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                               fontWeight: FontWeight.w600,
                               fontSize: 14.sp
                               ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left:10,
                                  bottom: 10
                                ),
                                child: Text(
                                  '.',
                                  style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                                 fontWeight: FontWeight.w700,
                                 fontSize: 20.sp
                                 ),
                                  ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 8,
                                  top:2
                                ),
                                child: Text(
                                  timeago.format(DateTime.parse(
                                      listmediainflueItemModelObj?.job?.createdAt ?? '')),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight125.copyWith(
                                    color: ColorConstant.black900,
                                    fontWeight: FontWeight.normal
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
                            truncateWithEllipsis(
                              myString:
                                  listmediainflueItemModelObj?.job?.description?.tr ?? '',
                            ),
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold125Gray900a7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 4,
                    top: 15,
                    right: 78,
                    bottom: 19,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:4),
                            child: Text(
                              "lbl_status".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight135Gray600,
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              15,
                            ),
                            width: getHorizontalSize(
                              94,
                            ),
                            text:  capitalizeFirstLetter(listmediainflueItemModelObj?.status!),
                            // text: "lbl_accepted".tr,
                            margin: getMargin(
                              top: 5,
                            ),
                            variant:
                                listmediainflueItemModelObj?.status == 'pending'
                                    ? ButtonVariant.FillRed10099
                                    : ButtonVariant.FillGreenA10099,
                            shape: ButtonShapes.RoundedBorder12,
                            padding: ButtonPadding.PaddingT4,
                            fontStyle:  listmediainflueItemModelObj?.status == 'pending' ?
                             ButtonFontStyle.SatoshiBold115Red700 :
                            ButtonFontStyle.SatoshiBold115Green700,
                            prefixWidget: Container(
                              margin: getMargin(
                                right: 4,
                              ),
                              child: CustomImageView(
                                svgPath:  listmediainflueItemModelObj?.status == 'pending' ? 
                                ImageConstant.imgClock :
                                ImageConstant.imgSearchGreen700, 
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: getPadding(
                          left:15
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 15
                              ),
                              child: Text(
                                "lbl_your_bid_price".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight135Gray600,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                bottom: 20
                              ),
                              child: Text(
                                '\$${((listmediainflueItemModelObj?.price ?? 0) / 100).toString()}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold125Gray900a7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    thickness: 1.2,
                  ))        
              ],
            ),
          ),
        ));
  }
}
