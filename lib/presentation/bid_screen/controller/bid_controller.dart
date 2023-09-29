import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/presentation/bid_screen/models/bid_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the BidScreen.
///
/// This class manages the state of the BidScreen, including the
/// current bidModelObj
class BidController extends GetxController with SingleGetTickerProviderMixin {
  BidController(this.postPageModelObj);
  Rx<BidModel> postPageModelObj = BidModel().obs;
  var storage = FlutterSecureStorage();

  final formKey = GlobalKey<FormState>();
  Rx<String> errorText = "".obs;
  var termsAndConditions = <String>[].obs;
  TextEditingController frametwelveController = TextEditingController();
  late AnimationController animationController;
  TextEditingController priceController = TextEditingController();
  final apiClient = ApiClient();
  Rx<BidModel> bidModelObj = BidModel().obs;
  Rx<bool> isAddingTermsOfContract = false.obs;

  startAddingTermsOfContract() {
    isAddingTermsOfContract.value = true;
  }

  addTermsAndCondition(String responsibility) {
    termsAndConditions.add(responsibility);
    // print(isAddingTermsOfContract);
    isAddingTermsOfContract.value = false;
  }

  handleDelete(String account) {
    termsAndConditions.remove(account);
    update();
  }

  void submitForm(BuildContext context, String jobId) async {
    var token = await storage.read(key: 'token');
    if (formKey.currentState!.validate()) {
      final bidData = BidModel(
          coverLetter: frametwelveController.text,
          jobId: jobId,
          price: int.tryParse(priceController.text));
      try {
        Response res = await apiClient.bidAJob(bidData, token);
        if (res.isOk) {
          Get.snackbar('Success', 'Bid Posted Successfully');
          // Navigator.of(Get.nestedKey(1)!.currentState!.context).pushReplacementNamed(AppRoutes.creatorHireslistTabContainerPage);
        } else if (res.statusCode == 400) {
          // Handles bad request errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(res.body?.message ?? res.statusText),
            ),
          );
        } else if (res.statusCode == 401) {
          // Handle unauthorized errors (e.g., user not authenticated)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Unauthorized. Please log in.'),
            ),
          );
        } else {
          // Handle other status codes
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('An error occurred while submitting the form.'),
            ),
          );
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred while submitting the form.'),
          ),
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize animation controller
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animationController.forward();

    // Define fade-in animation
    // fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(parent: animationController!, curve: Curves.easeIn),
    // );
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
    frametwelveController.dispose();
    priceController.dispose();
  }
}
