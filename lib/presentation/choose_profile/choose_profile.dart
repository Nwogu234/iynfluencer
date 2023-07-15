import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
      width: 145,  // reduced size
      height: 145, // reduced size
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.all(5.0),  // reduced margin
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff5DC8E0) : Colors.grey[200],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24, color: isSelected ? Colors.white : Colors.black,),
              SizedBox(height: 10), // more space
              Text(title, style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.black), textAlign: TextAlign.center,),
              SizedBox(height: 10), // more space
              Text(description, style: TextStyle(fontSize: 10, color: isSelected ? Colors.white : Colors.black), textAlign: TextAlign.center, maxLines: 3, overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ),
    );
  }
}






// ignore: must_be_immutable
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
          height: getVerticalSize(
            130,
          ),
          width: getHorizontalSize(
            116,
          ),
        ),
        Padding(
          padding: getPadding(
            top: 17,
          ),
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


class ChooseProfile extends StatelessWidget {
  final ChooseProfileController _controller = Get.put(ChooseProfileController());

  @override
  Widget build(BuildContext context) {
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
                  padding: getPadding(left: 5, top: 2),
                  child: Text("Choose a profile",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtH1)),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
                padding: const EdgeInsets.all(10.0),
                child: Obx(() => CarouselSlider.builder(
                    options: CarouselOptions(
                        height: getVerticalSize(200),
                        initialPage: 0,
                        autoPlay: true,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          _controller.sliderIndex.value = index;
                        }),
                    itemCount: _controller.onboardingScreenTwoModelObj
                        .value.sliderarrowleftItemList.value.length,
                    itemBuilder: (context, index, realIndex) {
                      SliderarrowleftItemModel model = _controller
                          .onboardingScreenTwoModelObj
                          .value
                          .sliderarrowleftItemList
                          .value[index];
                      return SliderarrowleftItemWidget(model);
                    })),
              ),
              Obx(() => Container(
                  height: getVerticalSize(10),
                  margin: getMargin(top: 19),
                  child: AnimatedSmoothIndicator(
                      activeIndex: _controller.sliderIndex.value,
                      count: _controller.onboardingScreenTwoModelObj
                          .value.sliderarrowleftItemList.value.length,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                          spacing: 9,
                          activeDotColor: ColorConstant.whiteA700,
                          dotColor: ColorConstant.blueGray1007f,
                          dotHeight: getVerticalSize(10),
                          dotWidth: getHorizontalSize(10))))),

        CustomButton(
              height: getVerticalSize(50),
              text: "Continue",
              margin: getMargin(top: 34),
              padding: ButtonPadding.PaddingAll15,
              fontStyle: ButtonFontStyle.SatoshiBold14,
              onTap: () {
                onTapSignupasa();
              }),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
  onTapSignupasa() {
    final storage = new FlutterSecureStorage();
    if(_controller.selectedCard.value==0){
      storage.write(key: 'activeProfile', value: 'Creator');
      Get.toNamed(
        AppRoutes.completeProfileCreatorScreen,
      );
    }
    else{
      storage.write(key: 'activeProfile', value: 'Influencer');
      Get.toNamed(
        AppRoutes.completeProfileInfluencerScreen,
      );
    }
  }
}