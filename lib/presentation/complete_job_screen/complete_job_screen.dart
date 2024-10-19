import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/chats_influencer_screen.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/controller/chats_influencer_controller.dart';
import 'package:iynfluencer/presentation/complete_job_screen/controller/complete_job_controller.dart';
import 'package:iynfluencer/presentation/job_influencer_details_screen.dart/model/job_arguement.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';
import 'package:iynfluencer/theme/app_decoration.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class CompleteJobScreen extends StatefulWidget {
  CompleteJobScreen({Key? key}) : super(key: key);

  @override
  State<CompleteJobScreen> createState() => _CompleteJobScreenState();
}

class _CompleteJobScreenState extends State<CompleteJobScreen> {
  final args = Get.arguments as JobArguments;

  final CompleteJobController controller = Get.put(CompleteJobController());

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
    final ChatData? chatData = args.chatData;
    final Jobz? selectedJob = args.selectedJob;
    Get.put(ChatsInfluencerController(
        chatData: chatData ?? chatsData, selectedJob: selectedJob));
  }

  @override
  Widget build(BuildContext context) {
    final ChatData? chatData = args.chatData;
    final Jobz? selectedJob = args.selectedJob;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
                onTapArrowleft17();
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Complete Job".tr),
          styleType: Style.bgOutlineIndigo50_1),
      body: Container(
        width: double.maxFinite,
        padding: getPadding(all: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Milestones completed".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiBold18.copyWith(fontSize: 15.sp),
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                autofocus: false,
                controller: controller.frametwelveController,
                hintText: "Explain briefly what milestones were completed".tr,
                margin: getMargin(top: 10),
                padding: TextFormFieldPadding.PaddingT47,
              ),
              Padding(
                padding: getPadding(top: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Project link (Optional)".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:
                          AppStyle.txtSatoshiBold18.copyWith(fontSize: 15.sp),
                    ),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: false,
                      controller: controller.projectController,
                      hintText: "www.examplejob.com".tr,
                      margin: getMargin(top: 10),
                      textInputAction: TextInputAction.done,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: getMargin(left: 20, right: 20, bottom: 20),
          decoration: AppDecoration.outlineIndigo507,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => CustomButton(
                  margin: getMargin(bottom: 5),
                  height: getVerticalSize(44),
                  text: "Submit".tr,
                  padding: ButtonPadding.PaddingAll12,
                  loading: controller.isLoading.value,
                  fontStyle: ButtonFontStyle.SatoshiBold13White700,
                  onTap: () {
                    onSubmit(selectedJob!, chatsData);
                  },
                ),
              ),
              Obx(
                () => CustomButton(
                  height: getVerticalSize(44),
                  text: "Dispute".tr,
                  padding: ButtonPadding.PaddingAll12,
                  loading: controller.isLoading.value,
                  fontStyle: ButtonFontStyle.SatoshiBold13White700,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  onTapArrowleft17() {
    Get.back();
  }

  void onSubmit(Jobz selectedJob, ChatData chatData) {
    final ChatsInfluencerController chatControllers =
        Get.find<ChatsInfluencerController>();
    if (controller.formKey.currentState?.validate() ?? false) {
      final String combinedMessage =
          '${controller.frametwelveController.text}\n\n${controller.projectController.text}';
      chatControllers.onTapChatsCard(selectedJob, chatData, combinedMessage);
    }
  }
}
