import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/influencer_job_tab_screen/controller/influencer_job_tab_controller.dart';
import 'package:iynfluencer/presentation/job_hired_screen/controller/job_hired_controller.dart';
import 'package:iynfluencer/presentation/job_influencer_details_screen.dart/model/job_arguement.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/media_file.dart';

class InfluencerJobTabScreen extends GetWidget<InfluencerJobTabController> {
  InfluencerJobTabScreen({Key? key}) : super(key: key);

  final args = Get.arguments as JobArguments;

  @override
  Widget build(BuildContext context) {
    final ChatData? chatData = args.chatData;
    final Jobz? selectedJob = args.selectedJob;

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return Scaffold(
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
      body: SafeArea(
        child: SizedBox(
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
                                            url: selectedJob
                                                ?.creator?.user?.avatar ?? "",
                                            fit: BoxFit.cover,
                                            height: getSize(30),
                                            width: getSize(30),
                                            radius: BorderRadius.circular(
                                                getSize(15.0))),
                                        Padding(
                                            padding: getPadding(
                                                left: 12, top: 7, bottom: 3),
                                            child: Text(
                                                // "${data!.influencer!.user!.firstName!.capitalize} ${data!.influencer!.user!.lastName!.capitalize}"
                                                //    .tr,
                                                "${capitalizeFirstLetter(selectedJob?.creator?.user?.firstName ?? 'Mark')} ${capitalizeFirstLetter(selectedJob?.creator?.user?.lastName ?? 'Adebayo')}",
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
                                        text: // capitalizeFirstLetter(
                                           selectedJob?.status ?? 'In Progress',
                                        margin: getMargin(top: 3),
                                        variant: selectedJob?.status ==
                                                "completed"
                                            ? ButtonVariant.FillGreenA10099
                                            : selectedJob?.status ==
                                                    "In Progress"
                                                ? ButtonVariant.FillLime100b2
                                                : ButtonVariant.FillRed10099,
                                        shape: ButtonShapes.RoundedBorder12,
                                        padding: ButtonPadding.PaddingAll4,
                                        fontStyle: selectedJob?.status ==
                                                'In Progress'
                                            ? ButtonFontStyle.SatoshiBold115Red700
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
                                      child: Text(
                                          DateFormat("yyyy-MM-dd").format(
                                              DateTime.parse(
                                                  selectedJob?.createdAt ??
                                                      '')),
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                    child: Container(
                      height: getHorizontalSize(48),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 13),
                      decoration: BoxDecoration(
                          color: ColorConstant.gray100,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Stated deliverable",
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold125Gray900a7
                                  .copyWith(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w900)),
                          InkWell(
                            onTap: () {
                              showMediaSelectionModal(context);
                            },
                            child: Row(
                              children: [
                                CustomImageView(
                                  margin: EdgeInsets.only(top: 5),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.centerLeft,
                                  svgPath: ImageConstant.imgUpload,
                                  width: getHorizontalSize(22),
                                  height: getHorizontalSize(22),
                                  color: ColorConstant.gray2E5,
                                ),
                                SizedBox(width: 4),
                                Text('Upload deliverables',
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold125Gray900a7
                                        .copyWith(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                            color: ColorConstant.gray2E5)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Selected Deliverables:",
                              style: AppStyle.txtSatoshiBold125Gray900a7
                                  .copyWith(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w900)),
                          SizedBox(height: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                controller.selectedMediaFiles.map((mediaFile) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  height: getHorizontalSize(48),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray100,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: ListTile(
                                    leading: IconButton(
                                        color: ColorConstant.gray2E5,
                                        icon: Icon(Icons.check_circle),
                                        onPressed: () {}),
                                    title: Text(mediaFile.name,
                                        style: AppStyle
                                            .txtSatoshiBold125Gray900a7
                                            .copyWith(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w500,
                                                color: ColorConstant.gray2E5)),
                                    trailing: IconButton(
                                      icon: Icon(Icons.remove_circle),
                                      color: ColorConstant.gray2E5,
                                      onPressed: () {
                                        controller
                                            .removeSelectedMediaFile(mediaFile);
                                      },
                                    ),
                                    onTap: () {
                                      Get.to((MediaFileWidget(
                                          mediaFile: mediaFile)));
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(
                        236,
                      ),
                      margin: getMargin(
                        left: 22,
                        top: 50,
                        right: 20,
                        //  bottom: 50
                      ),
                      child: Text(
                        "Upload media files of any of these formats: (png, jpg, mp3, mp4)"
                            .tr,
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                            fontSize: 15,
                            color: ColorConstant.black900,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Divider(
                      color: ColorConstant.indigo50,
                      thickness: 3,
                    ),
                  ),
                ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: getMargin(left: 20, right: 20, bottom: 20),
        //  decoration: AppDecoration.outlineIndigo507,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
         selectedJob?.review != null && selectedJob!.review!.isNotEmpty &&
          selectedJob.review!.first.influencerId == controller.user.userModelObj.value.influencerId ?
            CustomButton(
         onTap: () {
              if (selectedJob?.review != null && selectedJob!.review!.isNotEmpty) {
                controller.editReview(
                   context,
                   selectedJob!.review!.first.id,
                    selectedJob?.influencerId ?? '',
                  selectedJob?.creator?.creatorId ?? '',
                  selectedJob?.jobId ?? '',
                   selectedJob?.creator?.userId ?? '',
                   selectedJob?.title ?? '',
             );
         } else {
           Get.snackbar(
              'Error',
               'No reviews available to edit.',
                snackPosition: SnackPosition.BOTTOM,
                 );
               }
             },
                height: getVerticalSize(44),
                text: "Edit review".tr,
                margin: getMargin(top: 10),
                variant: ButtonVariant.Neutral,
                padding: ButtonPadding.PaddingAll12,
                fontStyle: ButtonFontStyle.SatoshiBold14Gray900) 
                :
            CustomButton(
                onTap: () {
                  controller.submitReview(
                      context,
                     selectedJob?.influencerId ?? '',
                      selectedJob?.creator?.creatorId ?? '',
                      selectedJob?.jobId ?? '',
                      selectedJob?.creator?.userId ?? '',
                      selectedJob?.title ?? '',
                     // isSubmitted
                      );
                },
                height: getVerticalSize(44),
                text: "Submit for review".tr,
                margin: getMargin(top: 10),
                variant: ButtonVariant.Neutral,
                padding: ButtonPadding.PaddingAll12,
                fontStyle: ButtonFontStyle.SatoshiBold14Gray900) 
          ],
        ),
      ),
    );
  }

  /// Navigates to the bidScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the bidScreen.
  onTapBid(Job selectedJob) {
    Get.toNamed(AppRoutes.bidsScreen, arguments: selectedJob);
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft16() {
    Get.back();
  }

  void showMediaSelectionModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Select Media"),
          children: [
            _buildMediaItemTile(
              context,
              Icons.photo,
              "Select Image",
              controller.handleImageSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.video_library,
              "Select Video",
              controller.handleVideoSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.insert_drive_file,
              "Select Document",
              controller.handleDocumentSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.music_note,
              "Select Mp3",
              controller.handleMP3Selection,
            ),
          ],
        );
      },
    );
  }

  ListTile _buildMediaItemTile(
      BuildContext context, IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () async {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}

 
/* import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/influencer_job_tab_screen/controller/influencer_job_tab_controller.dart';
import 'package:iynfluencer/presentation/job_hired_screen/controller/job_hired_controller.dart';
import 'package:iynfluencer/presentation/job_influencer_details_screen.dart/model/job_arguement.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/media_file.dart';

class InfluencerJobTabScreen extends StatelessWidget {
  final args = Get.arguments as JobArguments;
  final InfluencerJobTabController controller =
      Get.find<InfluencerJobTabController>();

  @override
  Widget build(BuildContext context) {
    final ChatData? chatData = args.chatData;
    final Job? selectedJob = args.selectedJob;

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
            },
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "lbl_job_details".tr,
          ),
          styleType: Style.bgOutlineIndigo50_1,
        ),
        body: SizedBox(
          width: double.infinity,
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
                            child: Text(
                              "lbl_influencer".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold125Gray900a7
                                  .copyWith(fontSize: 13.5),
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 5),
                            child: Row(
                              children: [
                                CustomImageView(
                                  url: selectedJob?.creator?.user?.avatar,
                                  fit: BoxFit.cover,
                                  height: getSize(30),
                                  width: getSize(30),
                                  radius: BorderRadius.circular(getSize(15.0)),
                                ),
                                Padding(
                                  padding:
                                      getPadding(left: 12, top: 7, bottom: 3),
                                  child: Text(
                                    "${capitalizeFirstLetter(selectedJob?.creator?.user?.firstName)} ${capitalizeFirstLetter(selectedJob?.creator?.user?.lastName)}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold14Gray900ab
                                        .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: ColorConstant.black900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: getPadding(top: 2, bottom: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_project_status".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold125Gray900a7
                                  .copyWith(fontSize: 13.5),
                            ),
                            CustomButton(
                              height: getVerticalSize(25),
                              width: getHorizontalSize(83),
                              text: capitalizeFirstLetter(selectedJob?.status),
                              margin: getMargin(top: 3),
                              variant: selectedJob?.status == 'completed'
                                  ? ButtonVariant.FillGreenA10099
                                  : selectedJob?.status == 'In Progress'
                                      ? ButtonVariant.FillLime100b2
                                      : ButtonVariant.FillRed10099,
                              shape: ButtonShapes.RoundedBorder12,
                              padding: ButtonPadding.PaddingAll4,
                              fontStyle: selectedJob?.status == 'In Progress'
                                  ? ButtonFontStyle.SatoshiBold115
                                  : selectedJob?.status == 'completed'
                                      ? ButtonFontStyle.SatoshiBold115Green700
                                      : ButtonFontStyle.SatoshiBold115Red700,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(left: 20, top: 15, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(top: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_project_cost".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold125Gray900a7
                                  .copyWith(fontSize: 13.5),
                            ),
                            Padding(
                              padding: getPadding(top: 7),
                              child: Text(
                                "\$${selectedJob?.budgetFrom}-\$${selectedJob?.budgetTo}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold125Gray900a7
                                    .copyWith(
                                  color: ColorConstant.black900,
                                  fontWeight: FontWeight.w800,
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
                            style: AppStyle.txtSatoshiBold125Gray900a7
                                .copyWith(fontSize: 13.5),
                          ),
                          Padding(
                            padding: getPadding(top: 9),
                            child: Text(
                              DateFormat("yyyy-MM-dd").format(
                                DateTime.parse(selectedJob?.createdAt ?? ''),
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                                color: ColorConstant.black900,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
                  child: Divider(
                    color: ColorConstant.indigo50,
                    thickness: 3,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  child: Container(
                    height: getHorizontalSize(48),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 13),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Stated deliverable",
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showMediaSelectionModal(context);
                          },
                          child: Row(
                            children: [
                              CustomImageView(
                                margin: EdgeInsets.only(top: 5),
                                fit: BoxFit.cover,
                                alignment: Alignment.centerLeft,
                                svgPath: ImageConstant.imgUpload,
                                width: getHorizontalSize(22),
                                height: getHorizontalSize(22),
                                color: ColorConstant.gray2E5,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Upload deliverables',
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold125Gray900a7
                                    .copyWith(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: ColorConstant.gray2E5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selected Deliverables:",
                          style: AppStyle.txtSatoshiLight13,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              controller.selectedMediaFiles.map((mediaFile) {
                            return ListTile(
                              title: Text(mediaFile.name),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () {
                                  controller.removeSelectedMediaFile(mediaFile);
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

   /// Navigates to the bidScreen when the action is triggered.

    /// When the action is triggered, this function uses the `Get` package to
    /// push the named route for the bidScreen.
    onTapBid(Job selectedJob) {
      Get.toNamed(AppRoutes.bidsScreen, arguments: selectedJob);
    }

    /// Navigates to the previous screen.
    ///
    /// When the action is triggered, this function uses the [Get] library to
    /// navigate to the previous screen in the navigation stack.
    onTapArrowleft16() {
      Get.back();
    }

  void showMediaSelectionModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Select Media"),
          children: [
            _buildMediaItemTile(
              context,
              Icons.photo,
              "Select Image",
              controller.handleImageSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.video_library,
              "Select Video",
              controller.handleVideoSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.insert_drive_file,
              "Select Document",
              controller.handleDocumentSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.music_note,
              "Select Mp3",
              controller.handleMP3Selection,
            ),
          ],
        );
      },
    );
    }

     ListTile _buildMediaItemTile(
        BuildContext context, IconData icon, String title, Function() onTap) {
      return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () async {
          Navigator.pop(context);
          onTap();
        },
      );


  }
}
 */