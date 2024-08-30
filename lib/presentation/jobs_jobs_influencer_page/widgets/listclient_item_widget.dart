import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/presentation/job_influencer_details_screen.dart/job_influencer_detail_screen.dart';
import '../controller/jobs_jobs_influencer_controller.dart';
import '../models/listclient_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class ListclientItemWidget extends StatelessWidget {
  ListclientItemWidget(
    this.listclientItemModelObj,
    this.chatData,
    {
    Key? key,
  }) : super(
    key: key,
        );

  Jobz? listclientItemModelObj;
  ChatData? chatData;

  @override
  Widget build(BuildContext context) {
     DateTime? parsedDate =
        DateTime.tryParse(listclientItemModelObj?.createdAt ?? "lbl_mar_18_2023".tr);
    String formattedDate = parsedDate != null
        ? "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}"
        : 'Unknown Date';

  String? capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }
    return GestureDetector(
      onTap: (() {
        Get.to(JobInfluencerDetailScreen(
          selectedJob: listclientItemModelObj,
          chatData: chatData,
          
        ));
      }),
      child: Expanded(
        child: SizedBox(
            height: getVerticalSize(350),
            width: getHorizontalSize(
              336,
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                           
                          '${listclientItemModelObj?.title != null && listclientItemModelObj!.title!.length > 25 
                             ? listclientItemModelObj?.title!.substring(0, 25) 
                           : listclientItemModelObj?.title ?? ''}',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold16.copyWith(
                              fontSize: 19.sp
                            )
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: <Widget>[
                         CustomImageView(
                          svgPath: ImageConstant.imgFrame,
                          color: ColorConstant.cyan100,
                          height: getVerticalSize(54),
                          width: getHorizontalSize(58),
                          radius: BorderRadius.circular(
                            getHorizontalSize(6),
                          ),
                        ), 
                        Expanded(
                          child: Container(
                            width: getHorizontalSize(
                              240,
                            ),
                            margin: getMargin(
                              left: 25,
                              top: 6,
                              bottom: 10,
                            ),
                            child: Text(
                                truncateWithEllipsis(
                                  myString: listclientItemModelObj?.description ?? '',
                                  textLength: 90,
                                   ),
                               maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                               fontWeight: FontWeight.w700
                               ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 18
                      ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(
                                bottom: 14
                               ),
                               child: Text(
                                 "lbl_client".tr,
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: AppStyle.txtSatoshiBold14Gray900ab,
                               ),
                             ),
                             Row(
                               children: [
                                 CustomImageView(
                                  fit: BoxFit.cover,
                                 //  imagePath: ImageConstant.imgGroup85237,
                                   url: listclientItemModelObj?.creator?.user?.avatar,
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
                                        "${capitalizeFirstLetter(listclientItemModelObj?.creator?.user?.firstName)}  ${capitalizeFirstLetter(listclientItemModelObj?.creator?.user?.lastName)}",
                                     overflow: TextOverflow.ellipsis,
                                     textAlign: TextAlign.left,
                                     style:AppStyle.txtSatoshiLight135Gray600,
                                        // AppStyle.txtSatoshiBold14Gray900ab,
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         ),
                         Padding(
                           padding: getPadding(
                             left: 64,
                             top: 2,
                             bottom: 3,
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text(
                                 "lbl_project_status".tr,
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: AppStyle.txtSatoshiLight135Gray600,
                               ),
                               CustomButton(
                                 height: getVerticalSize(
                                   25,
                                 ),
                                 width: getHorizontalSize(
                                   82,
                                 ),
                                 text: '${listclientItemModelObj?.status ?? 'In Progress'}'.tr,
                                 margin: getMargin(
                                   top: 3,
                                 ),
                                 variant: listclientItemModelObj?.status == 'Completed' 
                               ? ButtonVariant.FillGreenA10099 :
                                listclientItemModelObj?.status == 'In Progress' 
                                ?  ButtonVariant.FillLime100b2 
                                : ButtonVariant.FillRed10099,
                                 shape: ButtonShapes.RoundedBorder12,
                                 padding: ButtonPadding.PaddingAll4,
                                 fontStyle: listclientItemModelObj?.status == 'In Progress' 
                              ? ButtonFontStyle.SatoshiBold115 
                              : listclientItemModelObj?.status == 'Completed' 
                              ? ButtonFontStyle.SatoshiBold115Green700
                              : ButtonFontStyle.SatoshiBold115Red700,
                                 alignment: Alignment.center,
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 16),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Padding(
                           padding: getPadding(
                             top: 1,
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text(
                                 "lbl_project_cost".tr,
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: AppStyle.txtSatoshiLight135Gray600,
                               ),
                               Padding(
                                 padding: getPadding(
                                   top: 7,
                                 ),
                                 child: Text(
                                   "\$${capitalizeFirstLetter(listclientItemModelObj?.budgetFrom.toString())}-\$${capitalizeFirstLetter(listclientItemModelObj?.budgetTo.toString())}",
                                   overflow: TextOverflow.ellipsis,
                                   textAlign: TextAlign.left,
                                   style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                                   fontWeight: FontWeight.w700
                                  ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text(
                               "lbl_deadline".tr,
                               overflow: TextOverflow.ellipsis,
                               textAlign: TextAlign.left,
                               style: AppStyle.txtSatoshiLight135Gray600,
                             ),
                             Padding(
                               padding: getPadding(
                                 top: 9,
                               ),
                               child: Text(
                                 "$formattedDate".tr,
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: AppStyle.txtSatoshiBold125Gray900a7,
                               ),
                             ),
                           ],
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
            )),
      ),
    );
  }
}
