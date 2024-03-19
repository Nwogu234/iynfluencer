import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/controller/influencer_home_controller.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';

class AllInfluencerHomePage extends StatefulWidget {
  const AllInfluencerHomePage({Key? key}) : super(key: key);

  @override
  State<AllInfluencerHomePage> createState() => _AllInfluencerHomePageState();
}

class _AllInfluencerHomePageState extends State<AllInfluencerHomePage>
    with SingleTickerProviderStateMixin {
  InfluencerHomeController controller =
      Get.put(InfluencerHomeController(InfluencerHomeModel().obs));
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController animationController;
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
    return SafeArea(child: Scaffold(body: Obx(() {
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
        return PositionedDirectional(
          top: 150,
          start: 150,
          child: ResponsiveErrorWidget(
            errorMessage: controller.error.value,
            onRetry: controller.getUser,
            fullPage: true,
          ),
        );
      } else {
        return SingleChildScrollView();
      }
    })));
  }
}
