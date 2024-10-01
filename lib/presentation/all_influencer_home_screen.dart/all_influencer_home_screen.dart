import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/bids_screen/controller/bids_controller.dart';
import 'package:iynfluencer/presentation/bids_screen/models/bids_model.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/controller/influencer_home_controller.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/widgets/influencer_home_item_widget.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/controller/messages_page_influencer_controller.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/models/messages_page_influencer_model.dart';
import 'package:iynfluencer/routes/app_routes.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

class AllInfluencerHomePage extends StatefulWidget {
  const AllInfluencerHomePage({Key? key}) : super(key: key);

  @override
  State<AllInfluencerHomePage> createState() => _AllInfluencerHomePageState();
}

class _AllInfluencerHomePageState extends State<AllInfluencerHomePage>
    with SingleTickerProviderStateMixin {
  final MessagesPageInfluencerController messagesController = Get.put(
      MessagesPageInfluencerController(MessagesPageInfluencerModel().obs));
  InfluencerHomeController controller =
      Get.put(InfluencerHomeController(InfluencerHomeModel().obs));
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController animationController;
  final UserController user = Get.find();
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    if (!controller.isLoading.value &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      //  controller.loadRecommendedInfluencers();
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    //  controller.loadRecommendedInfluencers(); // Load initial data
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            body: Obx(() {
              if (controller.isLoading.value) {
                return Stack(
                  children: [
                    PositionedDirectional(
                      top: 150,
                      start: 150,
                      child: CustomLoadingWidget(
                        animationController: animationController,
                      ),
                    ),
                  ],
                );
              } else if (controller.error.value.isNotEmpty) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 350),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 120,
                      ),
                      child: ResponsiveErrorWidget(
                        errorMessage: controller.error.value,
                        onRetry: controller.getUser,
                        fullPage: true,
                      ),
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 20.w),
                      child: Column(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trending Posts".tr,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16.copyWith(
                                fontSize: 16.sp,
                                color: ColorConstant.black900,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'View All'.tr,
                              textAlign: TextAlign.right,
                              style: AppStyle.txtSatoshiBold16.copyWith(
                                color: ColorConstant.cyan100,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: getPadding(top: 19),
                          child: Container(
                            height: getVerticalSize(500),
                            width: double.infinity,
                            child: Obx(
                              () => ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(bottom: 100),
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: getVerticalSize(16));
                                },
                                itemCount: controller.isJobsLoading.value
                                    ? 5
                                    : controller.infJobsList.length,
                                itemBuilder: (context, index) {
                                  if (controller.isJobsLoading.value) {
                                    return InfluencerHomeItemSkeletonWidget();
                                  } else {
                                    Jobz model = controller.infJobsList[index];
                                    ChatData? chatData = index <
                                            messagesController.chatList.length
                                        ? messagesController.chatList[index]
                                        : null;
                                    return Animate(
                                      effects: [
                                        MoveEffect(
                                            duration: Duration(seconds: 1)),
                                        FadeEffect(
                                            duration: Duration(seconds: 1))
                                      ],
                                      child: InfluencerHomeItemWidget(
                                        model,
                                        onTapJobpost: () {
                                          onTapJobpost(
                                            model,
                                            chatData,
                                          );
                                        },
                                        onTapBidpost: () {
                                          onTapBid(model);
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        )
                      ]),
                    ));
              }
            })));
  }

  onTapJobpost(model, chatData) {
    Get.to(
        JobDetailsScreen(
          selectedJob: model,
          chatData: chatData,
        ),
        transition: Transition.zoom,
        duration: Duration(seconds: 1));
  }

  onTapBid(Jobz selectedJob) {
     selectedJob?.bids != null &&
    selectedJob!.bids!.isNotEmpty &&
    selectedJob?.bids?.first.influencerId ==
    user.userModelObj.value.influencerId ?
    Get.toNamed(AppRoutes.editScreen, arguments: selectedJob) :
    Get.toNamed(AppRoutes.bidScreen, arguments: selectedJob);
  }
}
