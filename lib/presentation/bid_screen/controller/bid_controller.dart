import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/presentation/bid_screen/models/bid_model.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

/// A controller class for the BidScreen.
///
/// This class manages the state of the BidScreen, including the
/// current bidModelObj
class BidController extends GetxController
    with GetSingleTickerProviderStateMixin {
  BidController(this.postPageModelObj);
  Rx<BidModel> postPageModelObj = BidModel().obs;
  var storage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  Rx<String> errorText = "".obs;
  var termsAndConditions = <String>[].obs;
  TextEditingController frametwelveController = TextEditingController();
  late AnimationController animationController;
  TextEditingController priceController = TextEditingController();
  final apiClient = ApiClient();
  Rx<BidModel> bidModelObj = BidModel().obs;
  final NotificationService notificationService = Get.find();
  final notificationClient = NotificationClient();
  TextEditingController termsAndConditionController = TextEditingController();
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

  void submitForm(
      BuildContext context, String jobId, String userId, String title) async {
    var token = await storage.read(key: 'token');
    if (formKey.currentState!.validate()) {
      if (frametwelveController.text.length <= 20) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cover Letter Must be Greater than 20 characters'),
          ),
        );
      } else {
        isLoading.value = true;
        final bidData = BidModel(
          coverLetter: frametwelveController.text,
          jobId: jobId,
          price: (int.tryParse(priceController.text) ?? 0) * 100,
          terms: termsAndConditionController.text
              .split(',')
              .map((term) => term.trim())
              .toList(),
        );

        try {
          Response res = await apiClient.bidAJob(bidData, token);
          final price = int.tryParse(priceController.text);
          final bidPrice = (int.tryParse(priceController.text) ?? 0) * 100;
          final terms = termsAndConditionController.text
              .split(',')
              .map((term) => term.trim())
              .toList();
          print(price);
          print(bidPrice);
          print(jobId);
          print(terms);
          print(userId);

          // print(res.statusCode);
          // print('----- statuscode---');
          // print(res.body['message']);

          if (res.isOk) {
            Get.snackbar('Success', 'Bid Posted Successfully');
            Get.toNamed(AppRoutes.bidAcceptedScreen,
                parameters: {'jobId': jobId});

            await OneSignal.login(userId);
            if (userId != null) {
              try {
                print('Sending notification to recipient');
                await notificationClient.sendNotification(
                  title,
                  'An influencer has submitted a bid',
                  userId,
                  null,
                );

                await notificationService.createNotification(
                  title,
                  'An influencer has submitted a bid',
                  'Bid',
                  ImageConstant.logo
                );

                print('Notification sent and saved to Firestore');
              } catch (e) {
                print('Error sending notification: $e');
              }
            }
          } else if (res.statusCode == 400) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(res.body['message'] ?? res.statusText),
              ),
            );
          } else if (res.statusCode == 401) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Unauthorized. Please log in.'),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('An error occurred while submitting the form.'),
              ),
            );
          }
        } catch (e) {
          print('-----error');
          print(e);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('An error occurred while submitting the form.'),
            ),
          );
        } finally {
          isLoading.value = false;
        }
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
