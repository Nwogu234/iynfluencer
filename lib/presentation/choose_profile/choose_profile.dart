import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../onboarding_screen_two_screen/models/sliderarrowleft_item_model.dart';

import 'choose_profile_controller/choose_profile_controller.dart';

// Create separate widget for the profile card
// ProfileCard widget
class ProfileCard extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final String description;

  const ProfileCard({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 140.w,
      height: 140.h,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.all(5.0.w),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff5DC8E0) : Colors.grey[200],
        borderRadius: BorderRadius.circular(15.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3.w,
            blurRadius: 5.w,
            offset: Offset(0.w, 3.w),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24.sp, color: isSelected ? Colors.white : Colors.black,),
              SizedBox(height: 10.h),
              Text(title, style: TextStyle(fontSize: 12.sp, color: isSelected ? Colors.white : Colors.black), textAlign: TextAlign.center,),
              SizedBox(height: 10.h),
              Text(description, style: TextStyle(fontSize: 10.sp, color: isSelected ? Colors.white : Colors.black), textAlign: TextAlign.center, maxLines: 3, overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ),
    );
  }
}

// SliderarrowleftItemWidget
class SliderarrowleftItemWidget extends StatelessWidget {
  SliderarrowleftItemWidget(
      this.sliderarrowleftItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  final ChooseProfileController _controller = Get.put(ChooseProfileController());
  SliderarrowleftItemModel sliderarrowleftItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          svgPath: sliderarrowleftItemModelObj.svgPath,
          height: 130.h,
          width: 116.w,
        ),
        Padding(
          padding: EdgeInsets.only(top: 17.h),
          child: Text(
            sliderarrowleftItemModelObj.text,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyle.txtH2Gray600,
          ),
        ),
      ],
    );
  }
}

// ChooseProfile screen
class ChooseProfile extends StatelessWidget {
  final ChooseProfileController _controller = Get.put(ChooseProfileController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.05;
    double cardWidth = 140;
    double spaceBetween = (screenWidth - 2 * padding - 2 * cardWidth) / 2;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff5DC8E0)),
            onPressed: () => Get.back(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.w, top: 2.h),
                child: Text("Choose a profile", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtH1),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Obx(
                          () => InkWell(
                        onTap: () {
                          _controller.selectedCard.value = 0;
                        },
                        child: ProfileCard(
                          isSelected: _controller.selectedCard.value == 0,
                          icon: Icons.person_outline,
                          title: "Creator",
                          description: "Reach out to influencers to promote your product, brand or content.",
                        ),
                      ),
                    ),
                    SizedBox(width: spaceBetween),
                    Obx(
                          () => InkWell(
                        onTap: () {
                          _controller.selectedCard.value = 1;
                        },
                        child: ProfileCard(
                          isSelected: _controller.selectedCard.value == 1,
                          icon: Icons.star_border,
                          title: "Influencer",
                          description: "Connect to people that will pay for your audience. Browse gigs and earn.",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Obx(
                      () => CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 200.h,
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        _controller.sliderIndex.value = index;
                      },
                    ),
                    itemCount: _controller.onboardingScreenTwoModelObj.value.sliderarrowleftItemList.value.length,
                    itemBuilder: (context, index, realIndex) {
                      SliderarrowleftItemModel model = _controller.onboardingScreenTwoModelObj.value.sliderarrowleftItemList.value[index];
                      return SliderarrowleftItemWidget(model);
                    },
                  ),
                ),
              ),
              Obx(
                    () => Container(
                  height: 10.h,
                  margin: getMargin(top: 19),
                  child: AnimatedSmoothIndicator(
                    activeIndex: _controller.sliderIndex.value,
                    count: _controller.onboardingScreenTwoModelObj.value.sliderarrowleftItemList.value.length,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      spacing: 9.w,
                      activeDotColor: ColorConstant.whiteA700,
                      dotColor: ColorConstant.blueGray1007f,
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                    ),
                  ),
                ),
              ),
              CustomButton(
                height: 50.h,
                text: "Continue",
                margin: getMargin(top: 34),
                padding: ButtonPadding.PaddingAll15,
                onTap: () {
                  onTapSignupasa();
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  onTapSignupasa() {
    _controller.onTapSignupasa();
  }
}