import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'sliderarrowleft_item_model.dart';

/// This class defines the variables used in the [onboarding_screen_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingScreenTwoModel {
  Rx<List<SliderarrowleftItemModel>> sliderarrowleftItemList = Rx([]);



  OnboardingScreenTwoModel(List<Map<String, dynamic>> data) {
    List<SliderarrowleftItemModel> models = data.map((item) {
      return SliderarrowleftItemModel(
        svgPath: item['svg'],
        text: item['text'],
      );
    }).toList();

    sliderarrowleftItemList.value = models;
  }
  // Rx<List<SliderarrowleftItemModel>> sliderarrowleftItemList =
  //     Rx(List.generate(2, (index) => SliderarrowleftItemModel()));
}