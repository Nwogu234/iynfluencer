  import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/payments/payment_model.dart';

class TransactionOneController extends GetxController{
   Rx<Payment?> paymentModelObj = Rx<Payment?>(null);

  void setSelectedPayment(Payment payment) {
    paymentModelObj.value = payment;
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