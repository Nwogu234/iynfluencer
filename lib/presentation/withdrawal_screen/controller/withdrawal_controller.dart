import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/withdrawal/withdraw.dart';
import 'package:iynfluencer/presentation/withdrawal_screen/models/withdrawal_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the WithdrawalScreen.
///
/// This class manages the state of the WithdrawalScreen, including the
/// current withdrawalModelObj
class WithdrawalController extends GetxController {
  TextEditingController bankNameController = TextEditingController();

  TextEditingController accNumberController = TextEditingController();

  TextEditingController accNameController = TextEditingController();

  Rx<WithdrawalModel> withdrawalModelObj = WithdrawalModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  final UserController user = Get.find();
  var storage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  final apiClient = ApiClient();
  final notificationClient = NotificationClient();
  final NotificationService notificationService = Get.find();

  void submitWithdrawal(BuildContext context, int amount, String userId) async {
    var token = await storage.read(key: 'token');
    isLoading.value = true;

    if (amount <= 100) {
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Insufficient balance'),
        ),
      );
      return;
    }

    try {
      final withdraw = WithdrawModel(
        userId: userId,
        accountNumber: accNumberController.text,
        bankName: bankNameController.text,
        accountName: accNameController.text,
        amount: amount,
      );

      final stringAmount = ((user.userModelObj.value.balance) / 100).toString();

      final response = await apiClient.createWithdrawal(withdraw, token);
      if (response.isOk) {
        accNameController.clear();
        bankNameController.clear();
        accNumberController.clear();
        print('Withdraw Submitted Successfully');
        Get.snackbar('Success', 'Withdraw Submitted Successfully');
        Get.toNamed(AppRoutes.withdrawalSuccessfulScreen,
            parameters: {
              'amount': stringAmount});
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.body['message'] ?? response.statusText),
          ),
        );
        Get.toNamed(AppRoutes.withdrawlFailedScreen,
            parameters: {
              'amount': stringAmount,
              'userId': userId
              });
      } else if (response.statusCode == 401) {
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
        Get.toNamed(AppRoutes.withdrawlFailedScreen,
            parameters: {
              'amount': stringAmount,
              'userId': userId
              });
      }
    } catch (e) {
      print('Error during submission: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
        ),
      );
      final stringAmount = ((user.userModelObj.value.balance) / 100).toString();
      Get.toNamed(AppRoutes.withdrawlFailedScreen,
       parameters: {
              'amount': stringAmount,
              'userId': userId
              });
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    bankNameController.dispose();
    accNumberController.dispose();
    accNameController.dispose();
  }
}
