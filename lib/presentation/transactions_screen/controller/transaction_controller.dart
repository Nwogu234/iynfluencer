import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/paymentApi.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/payments/payment_model.dart';

class TransactionController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  var error = ''.obs;
  var token;
  final storage = FlutterSecureStorage();
  final UserController user = Get.find();
  final PaymentClient paymentClient = PaymentClient();
  RxList<Payment> payments = <Payment>[].obs;
  RxList<Payment> paymentList = <Payment>[].obs;

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
        getAllTransactions().then((value) {
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


Future<void> getAllTransactions() async {
  try {
    error.value = '';
    isLoading.value = true;
    token = await storage.read(key: "token");
    if (token == null) {
      error('Invalid token');
      return;
    }

    final Response response = await paymentClient.fetchTransaction(token);
    if (response.isOk) {
      final responseData = response.body;
      final List<dynamic>? transactionList = responseData['data']?['docs'];
      print(transactionList?.length);
      
      if (transactionList != null) {
      
        final userId = user.userModelObj.value.userId;

        payments.value = transactionList
            .map((trans) => Payment.fromJson(trans))
            .where((payment) => payment.creator?.userId == userId)
            .toList();

        print('Filtered transaction list: $payments');
        
        if (payments.isEmpty) {
          error('No Transactions found');
        }
      } else {
        payments.clear();
        print('No transactions found');
      }
    } else {
      print('Failed to fetch transactions: ${response.statusText}');
    }
  } catch (e) {
    print('Error fetching transactions: $e');
  } finally {
    isLoading.value = false;
  }
}

  String formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays < 1) {
      return DateFormat.jm('en_US').format(dateTime);
    } else if (difference.inDays == 1) {
      return 'YESTERDAY';
    } else if (difference.inDays < 365) {
      return DateFormat('MMM d').format(dateTime);
    } else {
      return DateFormat('MMM d, yyyy').format(dateTime);
    }
  }
}
