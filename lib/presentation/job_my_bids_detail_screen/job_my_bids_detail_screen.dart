import 'package:country_flags/country_flags.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/controller/chats_influencer_controller.dart';
import 'package:iynfluencer/presentation/job_my_bids_detail_screen/controller/job_my_bids_details_screen_controller.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import '../job_details_screen/widgets/job_details_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class JobMyBidsDetailsScreen extends StatefulWidget {
  JobMyBidsDetailsScreen({
    this.selectedJob,
    this.chatData,
    this.jobMyBids
  });

  final Jobz? selectedJob;
  final ChatData? chatData;
  JobsMyBidsInfluencerModel? jobMyBids;

  @override
  State<JobMyBidsDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobMyBidsDetailsScreen> {
  final UserController user = Get.find();

  final chatsData = ChatData(
      id: '',
      creatorId: '',
      creatorUserId: '',
      influencerId: '',
      influencerUserId: '',
      unreadByCreator: 0,
      unreadByInfluencer: 0,
      blockedByCreator: false,
      blockedByInfluencer: false,
      chatId: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      messages: const [],
      influencerUser: null,
      creatorUser: null);

  @override
  void initState() {
    super.initState();
    Get.put(ChatsInfluencerController(
        chatData: widget.chatData ?? chatsData,
        selectedJob: widget.selectedJob));
  }

  JobMyBidsDetailsController controller = Get.put(JobMyBidsDetailsController());

  @override
  Widget build(BuildContext context) {
    // final List<Job> jobDetailsItemList = [
    //   selectedJob,
    // ];

    final ChatsInfluencerController chatControllers =
        Get.find<ChatsInfluencerController>();
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    String countryCode = user.getCountryCode(user.capitalizeFirstLetter(
        widget.selectedJob?.creatorDetails?.country!));
    print(countryCode);

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
          title: AppbarTitle(text: "lbl_job_details".tr),
          styleType: Style.bgOutlineIndigo50_1),
      body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
              padding: getPadding(top: 25),
              child: Padding(
                  padding: getPadding(bottom: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(left: 19),
                            child: Text("${widget.selectedJob?.title}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold18)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle5069,
                            height: getVerticalSize(221),
                            width: getHorizontalSize(375),
                            margin: getMargin(top: 22)),
                        Padding(
                            padding: getPadding(left: 20, top: 27),
                            child: Text("lbl_description".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900)),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: getHorizontalSize(324),
                                margin:
                                    getMargin(left: 20, top: 9, right: 30),
                                child: Text(
                                    "${widget.selectedJob?.description}",
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtSatoshiLight13Gray900ab))),
                        Padding(
                            padding: getPadding(left: 20, top: 29),
                            child: Text("lbl_responsiblities".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900)),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: getHorizontalSize(334),
                              margin: getMargin(left: 20, top: 9, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: widget
                                    .selectedJob!.responsibilities!
                                    .map((mediaFile) {
                                  return Padding(
                                      padding: getPadding(top: 7),
                                      child: Text(
                                          mediaFile, 
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiLight13Gray900ab));
                                }).toList(),
                              ),
                            )),
                        Padding(
                            padding: getPadding(left: 20, top: 28),
                            child: Text("lbl_about_job".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900)),
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                    padding: getPadding(left: 20, top: 7),
                                    child: Text(
                                        "lbl_total_bids"
                                            .tr, //duration,budget,list of r4
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtSatoshiBold125Gray900a7)),
                                Padding(
                                    padding: getPadding(left: 20, top: 6),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "${widget.selectedJob?.bidsCount ?? 0} ",
                                              style: AppStyle
                                                  .txtSatoshiBold125Gray900a7),
                                          TextSpan(
                                              text: "lbl_bidders".tr,
                                              style: AppStyle
                                                  .txtSatoshiBold125Gray900a7)
                                        ]),
                                        textAlign: TextAlign.left)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(left: 20, top: 7),
                                  child: Text(
                                    "Duration".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(left: 20, top: 7),
                                  child: Text(
                                    "${widget.selectedJob?.duration} days",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(left: 20, top: 7),
                                  child: Text(
                                    "lbl_budget".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(left: 20, top: 7),
                                  child: Text(
                                    '\$${capitalizeFirstLetter(widget.selectedJob?.budgetFrom.toString())} - ${capitalizeFirstLetter(widget.selectedJob?.budgetTo.toString())}',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtSatoshiBold125Gray900a7,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                            padding: getPadding(left: 20, top: 30),
                            child: Text("lbl_about_client".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900)),
                        Padding(
                            padding: getPadding(left: 20, top: 13, right: 53),
                            child: Row(children: [
                              CustomImageView(
                                  fit: BoxFit.cover,
                                  url: widget.selectedJob?.creatorDetails?.avatar,
                                  height: getSize(40),
                                  width: getSize(40),
                                  radius:
                                      BorderRadius.circular(getSize(20.0))),
                              Padding(
                                  padding: getPadding(left: 16, top: 4),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${capitalizeFirstLetter(widget.selectedJob?.creatorDetails?.firstName)} ${capitalizeFirstLetter(widget.selectedJob?.creatorDetails?.lastName)}",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiBold13Gray900ab),
                                        Row(children: [
                                          Text(
                                              "${widget.selectedJob?.creatorDetails?.country}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  AppStyle.txtSatoshiLight12),
                                          Card(
                                              clipBehavior: Clip.antiAlias,
                                              elevation: 0,
                                              margin: getMargin(
                                                  left: 10, bottom: 3),
                                              color: ColorConstant.gray20001,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .circleBorder7),
                                              child: Container(
                                                  height: getSize(14),
                                                  width: getSize(14),
                                                  decoration: AppDecoration
                                                      .fillGray20001
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .circleBorder7),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Stack(children: [
                                                      CountryFlag
                                                          .fromCountryCode(
                                                        countryCode,
                                                        height: 15,
                                                        width: 13,
                                                        borderRadius: 10,
                                                      ),
                                                    ]),
                                                  )))
                                        ])
                                      ])),
                              Spacer(),
                              CustomButton(
                                  onTap: () {
                                    chatControllers.onTapChatsBid(
                                        widget.selectedJob,
                                        chatControllers.chatData,
                                        null);
                                  },
                                  height: getVerticalSize(30),
                                  width: getHorizontalSize(86),
                                  text: "lbl_message".tr,
                                  margin: getMargin(top: 5, bottom: 5),
                                  variant: ButtonVariant.FillGray200ab,
                                  padding: ButtonPadding.PaddingAll4,
                                  fontStyle: ButtonFontStyle.SatoshiBold13)
                            ])),
                        Padding(
                            padding: getPadding(left: 20, top: 19),
                            child: Row(children: [
                              Padding(
                                  padding: getPadding(top: 1),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("lbl_13_jobs_posted".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiBold125Gray900a7),
                                        Padding(
                                            padding: getPadding(top: 3),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "lbl_3_open_jobs"
                                                          .tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray600,
                                                          fontSize:
                                                              getFontSize(
                                                                  13.5),
                                                          fontFamily:
                                                              'Satoshi',
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300)),
                                                  TextSpan(
                                                      text: "lbl_view".tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .blue900,
                                                          fontSize:
                                                              getFontSize(
                                                                  13.5),
                                                          fontFamily:
                                                              'Satoshi',
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300))
                                                ]),
                                                textAlign: TextAlign.left))
                                      ])),
                              Padding(
                                  padding: getPadding(left: 70, bottom: 1),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("lbl_member_since".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiLight135Gray600),
                                        Padding(
                                            padding: getPadding(top: 3),
                                            child: Text("lbl_mar_2022".tr,
                                                overflow:
                                                    TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSatoshiBold125Gray900a7))
                                      ]))
                            ]))
                      ])))),
      bottomNavigationBar: Container(
        margin: getMargin(left: 20, right: 20, bottom: 20),
        decoration: AppDecoration.outlineIndigo507,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.jobMyBids?.status == 'pending' 
                ? CustomButton(
                    height: getVerticalSize(44),
                    text: "Edit bid".tr,
                    padding: ButtonPadding.PaddingAll12,
                    onTap: () {
                       onTapEdit(widget.selectedJob!);
                    },
                  )
                : CustomButton(
                    height: getVerticalSize(44),
                    text: "Job no longer avaliable".tr,
                     variant: ButtonVariant.Neutral,
                    padding: ButtonPadding.PaddingAll12,
                     fontStyle: ButtonFontStyle.SatoshiBold14Gray900 
                  ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the bidScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the bidScreen.
 

  onTapEdit(Jobz selectedJob) {
   // final id = widget.selectedJob?.bids?.first.influencerId ?? '';
   // final UserController user = Get.find();
  //  final users = user.userModelObj.value.influencerId;
  //  print("$id, $users");
    Get.toNamed(AppRoutes.editScreen, arguments: widget.selectedJob);
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft16() {
    Get.back();
  }
}
