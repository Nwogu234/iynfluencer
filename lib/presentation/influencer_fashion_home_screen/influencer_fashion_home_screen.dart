import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/influencer_fashion_home_screen/controller/influencer_fashion_controller.dart';
import 'package:iynfluencer/presentation/influencer_fashion_home_screen/model/influencer_fashion_model.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/controller/influencer_home_controller.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/widgets/influencer_home_item_widget.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/controller/messages_page_influencer_controller.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/models/messages_page_influencer_model.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

class InfluencerFashionHomePage extends StatefulWidget {
  const InfluencerFashionHomePage({Key? key}) : super(key: key);

  @override
  State<InfluencerFashionHomePage> createState() => _InfluencerFashionHomePageState();
}

class _InfluencerFashionHomePageState extends State<InfluencerFashionHomePage> 
    with SingleTickerProviderStateMixin {
    InfluencerFashionController controller =
      Get.put(InfluencerFashionController(InfluencerFashionModel().obs));
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController animationController;
   final  MessagesPageInfluencerController messagesController =
      Get.put( MessagesPageInfluencerController(MessagesPageInfluencerModel().obs));
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
   //   controller.loadRecommendedInfluencers(); // Load initial data
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
        key:_scaffoldKey,
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
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 350
          ),
          child: ResponsiveErrorWidget(
            errorMessage: controller.error.value,
            onRetry: controller.getUser,
            fullPage: true,
          ),
        );
      } else {
        return SingleChildScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          child:Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              children: <Widget>[
                 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                              "Trending Posts".tr,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: ColorConstant.black900,
                                    fontWeight: FontWeight.w600,
                                    ),
                            ),
                            Text(
                              'View All'.tr,
                               textAlign: TextAlign.right,
                               style: AppStyle.txtSatoshiBold16.copyWith(
                                color:ColorConstant.cyan100,
                             ),
                          )
                          ],
                        ),
                     Padding(
                       padding: getPadding(top: 19),
                       child: Container(
                        height: MediaQuery.of(context).size.height,
                         width: double.infinity,
                         child: Obx(
                           () => ListView.separated(
                             physics: BouncingScrollPhysics(),
                             shrinkWrap: true,
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
                                 ChatData? chatData = 
                                         index < messagesController.chatList.length
                                        ? messagesController.chatList[index]
                                        : null;
                                 return InfluencerHomeItemWidget(model,
                                     onTapJobpost: () {
                                   onTapJobpost(
                                    model,
                                    chatData
                                    );
                                 });
                               }
                             },
                           ),
                         ),
                       ),
                     )
              ]
              ),
          )
        );
      }
    })));
  }

   onTapJobpost(model, chatdata) {
    Get.to(JobDetailsScreen(
      selectedJob: model,
      chatData: chatdata,
    ));
  }
}