import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/controller/home_creator_container_controller.dart';
import 'package:iynfluencer/presentation/payment_succesful_screen/models/payment_succesful_model.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';

/// A controller class for the PaymentSuccesfulScreen.
///
/// This class manages the state of the PaymentSuccesfulScreen, including the
/// current paymentSuccesfulModelObj
class PaymentSuccesfulController extends GetxController {
  Rx<PaymentSuccesfulModel> paymentSuccesfulModelObj =
      PaymentSuccesfulModel().obs;

  late BottomBarController bumcont =
      Get.find<BottomBarController>();
  late HomeCreatorContainerController infTabcont = Get.put(HomeCreatorContainerController());

   
  @override
  void dispose() {
  bumcont.dispose();
  infTabcont.dispose();
    super.dispose();
  }
}
