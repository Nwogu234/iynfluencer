import 'dart:convert';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/env.dart';
import 'package:iynfluencer/presentation/payment_card_screen/models/card_detail.dart';

class PaymentClient extends GetConnect {
  // Configure the base URL
  PaymentClient() {
    httpClient.defaultContentType = "application/json";
    httpClient.baseUrl =
        'https://iynf-kong-akbf9.ondigitalocean.app/api/v1/payments/transactions';
  }

  dynamic errorHandler(Response response) {
    print(response.toString());
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 202:
        return response;
      case 500:
        throw "Server Error pls retry later";
      case 401:
        return Get.offAllNamed(
          AppRoutes.logInScreen,
        );
      case 403:
        throw 'Error occurred pls check internet and retry.';
      case 500:
      default:
        throw 'Error occurred retry';
    }
  }

  // Method to create a payment transaction
  Future<Response<dynamic>> createPayment(String bidId, String jobId,
      String influencerId, int price, String creatorId) async {
    try {
      final requestData = {
        'bidId': bidId,
        'jobId': jobId,
        'influencerId': influencerId,
        'amount': price,
        'creatorId': creatorId,
      };

      final response = await post(
        '/create',
        jsonEncode(requestData),
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/json',
        },
      );

      if (response.isOk) {
        print('Transaction created successfully.');
        return response;
      } else {
        print(response);
        print(
            'Failed to create with Transaction: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to create Transaction');
      }
    } catch (e) {
      print('$e from creating Transaction');
      print(e);
      throw Exception('Server error');
    }
  }

  Future<Response<dynamic>> verifyTransaction(String reference) async {
    try {
      final response = await get(
        '/p-verify?reference=$reference',
        query: {'reference': reference},
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/json',
        },
      );
      if (response.isOk) {
        // Map<String, dynamic> responseData = json.decode(response.body);
        final responseData = response.body;
        String paymentIntentId = responseData['data']['data']['id'];
        print('Transaction verified. Payment Intent ID: $paymentIntentId');
        return response;
      } else {
        print(
            'Failed to verify transaction: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to verify transaction');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Error verifying transaction: $e');
    }
  }

  Future<Response<dynamic>> verifyPayment(String reference) async {
    try {
      final response = await get(
        '/verify?reference=$reference',
        query: {'reference': reference},
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/json',
        },
      );

      if (response.isOk) {
        final responseData = response.body;
        print('Payment verified: ${responseData['message']}');
        return response;
      } else {
        print(
            'Failed to verify payment: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to verify payment');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Error verifying payment: $e');
    }
  }

  int calculateAmount(int price) {
    final calculatedAmount = (price) * 100;
    return calculatedAmount;
  }
}
