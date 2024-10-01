import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/withdrawal/withdraw_transaction.dart';

class WithdrawTransactionController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  var error = ''.obs;
  var token;
  final storage = FlutterSecureStorage();
  final ApiClient apiClient = ApiClient();
  final UserController user = Get.find();
  RxList<TransactionDoc> withTransaction = <TransactionDoc>[].obs;

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  getUser() async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
       final userId =  user.userModelObj.value.userId;
        fetchAllWithdrawal(userId).then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  Future<void> fetchAllWithdrawal(String userId) async {
    try {
      error.value = '';
      isLoading.value = true;
      token = await storage.read(key: "token");

      final Response response = await apiClient.fetchWithdrawal(token, userId);
      if (response.isOk) {
        final responseData = response.body;
        final List<dynamic>? withdrawList = responseData['docs'];

        if (withdrawList != null) {
          withTransaction.value = withdrawList
              .map((withdraw) => TransactionDoc.fromJson(withdraw))
              .toList();
          print('Notification list: $withTransaction');
        } else {
          withTransaction.clear();
          print('No withdrawals found');
        }
      } else {
        print('Failed to fetch messages: ${response.statusText}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
