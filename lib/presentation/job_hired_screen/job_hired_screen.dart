import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/job_hired_screen/controller/job_hired_controller.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/deliver_media.dart';
import 'package:iynfluencer/widgets/media_file.dart';

class JobHiredScreen extends StatelessWidget {
  JobHiredScreen({this.selectedJob});

  final Job? selectedJob;

  final JobHiredController controller = Get.put(JobHiredController());

  @override
  Widget build(BuildContext context) {
    DateTime? parsedDate =
        DateTime.tryParse(selectedJob?.createdAt ?? "lbl_mar_18_2023".tr);
    String formattedDate = parsedDate != null
        ? "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}"
        : 'Unknown Date';

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
            height: getVerticalSize(48),
            leadingWidth: 50,
            leading: AppbarImage(
                height: getSize(30),
                width: getSize(30),
                svgPath: ImageConstant.imgArrowleftGray600,
                margin: getMargin(left: 20, top: 9, bottom: 9),
                onTap: () {
                  onTapArrowleft16();
                }),
            centerTitle: true,
            title: AppbarTitle(
              text: "lbl_job_details".tr,
            ),
            styleType: Style.bgOutlineIndigo50_1),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
                    child: Text(
                      '${selectedJob?.title}'.tr,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold16.copyWith(
                        fontSize: 18.sp,
                        color: ColorConstant.black900,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                      padding: getPadding(left: 20, top: 20, right: 44),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text("lbl_influencer".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSatoshiBold125Gray900a7
                                            .copyWith(fontSize: 13.5)),
                                  ),
                                  Padding(
                                      padding: getPadding(top: 5),
                                      child: Row(children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGroup85235x35,
                                            fit: BoxFit.cover,
                                            height: getSize(30),
                                            width: getSize(30),
                                            radius: BorderRadius.circular(
                                                getSize(15.0))),
                                        Padding(
                                            padding: getPadding(
                                                left: 12, top: 7, bottom: 3),
                                            child: Text(
                                                // "${selectedJob!.influencer!.user!.firstName!.capitalize} ${data!.influencer!.user!.lastName!.capitalize}"
                                                //     .tr,
                                                "Mark Adebayo",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSatoshiBold14Gray900ab
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: ColorConstant
                                                            .black900)))
                                      ]))
                                ]),
                            Padding(
                                padding: getPadding(top: 2, bottom: 3),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_project_status".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiBold125Gray900a7
                                              .copyWith(fontSize: 13.5)),
                                      CustomButton(
                                        height: getVerticalSize(25),
                                        width: getHorizontalSize(83),
                                        text: capitalizeFirstLetter(
                                            selectedJob?.status ?? ''),
                                        margin: getMargin(top: 3),
                                        variant: selectedJob?.status ==
                                                'completed'
                                            ? ButtonVariant.FillGreenA10099
                                            : selectedJob?.status ==
                                                    'In Progress'
                                                ? ButtonVariant.FillLime100b2
                                                : ButtonVariant.FillRed10099,
                                        shape: ButtonShapes.RoundedBorder12,
                                        padding: ButtonPadding.PaddingAll4,
                                        fontStyle: selectedJob?.status ==
                                                'In Progress'
                                            ? ButtonFontStyle.SatoshiBold115
                                            : selectedJob?.status == 'completed'
                                                ? ButtonFontStyle
                                                    .SatoshiBold115Green700
                                                : ButtonFontStyle
                                                    .SatoshiBold115Red700,
                                      )
                                    ]))
                          ])),
                  Padding(
                      padding: getPadding(left: 20, top: 15, right: 50),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: getPadding(top: 1),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_project_cost".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiBold125Gray900a7
                                              .copyWith(fontSize: 13.5)),
                                      Padding(
                                          padding: getPadding(top: 7),
                                          child: Text(
                                              "\$${capitalizeFirstLetter(selectedJob?.budgetFrom.toString())}-\$${capitalizeFirstLetter(selectedJob?.budgetTo.toString())}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSatoshiBold125Gray900a7
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .black900,
                                                      fontWeight:
                                                          FontWeight.w800)))
                                    ])),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("lbl_deadline".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold125Gray900a7
                                          .copyWith(fontSize: 13.5)),
                                  Padding(
                                      padding: getPadding(top: 9),
                                      child: Text("$formattedDate",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiBold125Gray900a7
                                              .copyWith(
                                                  color: ColorConstant.black900,
                                                  fontWeight: FontWeight.w800)))
                                ])
                          ])),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 20),
                    child: Divider(
                      color: ColorConstant.indigo50,
                      thickness: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 22),
                    child: Text(
                      "Deliverables".tr,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold16.copyWith(
                        fontSize: 14.sp,
                        color: ColorConstant.black900,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Column(
                    children: selectedJob?.review?.first.proof.map((mediaFile) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 5),
                            child: Container(
                              height: getHorizontalSize(48),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 13),
                              decoration: BoxDecoration(
                                color: ColorConstant.gray100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Stated deliverable",
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold125Gray900a7
                                        .copyWith(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to((DeliverableMedia(
                                              mediaFile: mediaFile)));
                                        },
                                        child: Text(
                                          'View',
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiBold125Gray900a7
                                              .copyWith(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                            color: ColorConstant.gray2E5,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      CustomImageView(
                                        margin: EdgeInsets.only(top: 5),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.centerRight,
                                        svgPath: ImageConstant.imgChevronRight,
                                        width: getHorizontalSize(20),
                                        height: getHorizontalSize(20),
                                        color: ColorConstant.gray2E5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList() ??
                        [], // Convert to List<Widget> and handle null
                  )
                ]),
          ),
        ),
        bottomNavigationBar: Container(
          margin: getMargin(left: 20, right: 20, bottom: 20),
          decoration: AppDecoration.outlineIndigo507,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButton(
                  height: getVerticalSize(44),
                  text: "Mark complete".tr,
                  padding: ButtonPadding.PaddingAll12,
                  onTap: () async {
                    await controller.completeJobFunc(
                        context, selectedJob?.jobId ?? '', selectedJob);
                    Get.back();
                  }),
              CustomButton(
                  height: getVerticalSize(44),
                  text: "Dispute".tr,
                  margin: getMargin(top: 10),
                  variant: ButtonVariant.Neutral,
                  padding: ButtonPadding.PaddingAll12,
                  fontStyle: ButtonFontStyle.SatoshiBold14Gray900)
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft16() {
    Get.back();
  }
}
