import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/presentation/search_results_screen/models/search_results_model.dart';
import 'package:iynfluencer/presentation/search_results_screen/widget/trending_result_item_widget.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview_2.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import 'controller/search_results_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_search_view.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';



class SearchResultsScreen extends StatefulWidget {
  final String? query;
  final String? fromDate;
  final String? toDate;
  final SelectionPopupModel? selectedNiche;
  final SelectionPopupModel? selectedCountry;

  const SearchResultsScreen({
    Key? key, 
    this.fromDate,
    this.toDate,
    this.selectedNiche,
    this.selectedCountry,
    this.query}) : super(key: key);

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}
class _SearchResultsScreenState extends State<SearchResultsScreen>
    with SingleTickerProviderStateMixin {
  SearchResultsController controller =
      Get.put(SearchResultsController(SearchResultsModel().obs));
  late AnimationController animationController;
  final ScrollController _scrollController = ScrollController();
  
  Future<void> _refresh() async {
    await controller.refreshItems();
  }
  void _onScroll() {
    if (!controller.isLoading.value &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
     // controller.loadRecommendedInfluencers();
    }
  }
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    //   controller.loadRecommendedInfluencers();
    controller.searchController.text = widget.query ?? '';
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
    String? query = widget.query;
    return RefreshIndicator(
      onRefresh: _refresh,
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstant.whiteA70002,
              appBar: CustomAppBar(
                  height: getVerticalSize(60),
                  leadingWidth: 50,
                  leading: AppbarImage(
                      height: getSize(30),
                      width: getSize(30),
                      svgPath: ImageConstant.imgArrowleftGray600,
                      margin: getMargin(left: 20, top: 15, bottom: 15),
                      onTap: () {
                        onTapArrowleft6();
                      }),
                  title: AppbarSearchview2(
                      query: query!,
                      margin: getMargin(left: 9),
                      controller: controller.searchController),
                  styleType: Style.bgOutlineIndigo500),
              body: Obx(() {
                if (controller.isLoading.value) {
                  return Stack(
                    children: [
                      CustomLoadingWidget(
                        animationController: animationController,
                      ),
                    ],
                  );
                } else if (controller.error.value.isNotEmpty) {
                  return ResponsiveErrorWidget(
                    errorMessage: controller.error.value,
                    onRetry: controller.getUser(query),
                    fullPage: true,
                  );
                } else {
                  return SingleChildScrollView(
                    controller: _scrollController,
                    child: Container(
                      height: 380.h,
                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.isRecommendedLoading.value
                                          ? 5
                                          : controller
                                              .filteredInfluencers.length,
                                           itemBuilder: (context, index) {
                            if (controller.isRecommendedLoading.value) {
                              return Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                      child: TrendinghorizonItemSkeletonWidget(),
                                          );
                                        } else {
                               return Padding(
                                        padding:
                                                EdgeInsets.only(right: 10.w),
                                        child: TrendingResultItemWidget(
                                          influencer: controller.filteredInfluencers[index]
                                                ),
                                          );
                                        }
                      
                                      }),
                    )
                    
                  );
                }
                
              }
              
              ))),
    );
  }
  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft6() {
    Get.back();
  }
}