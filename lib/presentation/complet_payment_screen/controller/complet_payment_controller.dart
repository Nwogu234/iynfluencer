import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:iynfluencer/data/apiClient/paymentApi.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/env.dart';
import 'package:iynfluencer/presentation/bids_screen/widgets/bids_arguement.dart';
import 'package:iynfluencer/presentation/complet_payment_screen/models/complet_payment_model.dart';

/// A controller class for the CompletPaymentScreen.
///
/// This class manages the state of the CompletPaymentScreen, including the
/// current completPaymentModelObj
class CompletPaymentController extends GetxController {
  Rx<CompletPaymentModel> completPaymentModelObj = CompletPaymentModel().obs;

  final paymentClient = PaymentClient();
  final storage = new FlutterSecureStorage();
  var token;
  var error = ''.obs;
  final Stripe stripe = Stripe.instance;
  final UserController user = Get.find();

  Future<void> initPaymentSheet(BidsArguments bidsArguments) async {
    try {
      final args = Get.arguments as BidsArguments;
      final JobBids? dataz = args.jobBid;
      final Job? selectedJob = args.job;
      print(dataz!.bidId!);
      print(dataz!.jobId!);
      print(dataz!.influencerId!);
      print(dataz!.price!.toString());
      print(selectedJob!.creatorId!);

      final price = dataz.price!;
      final givenPrice = calculateAmount(price);
      print(givenPrice);

      // Step 1: Create the payment
      final Response<dynamic> paymentIntentResponse =
          await paymentClient.createPayment(
        dataz.bidId!,
        dataz.jobId!,
        dataz.influencerId!,
        dataz!.price!,
        selectedJob!.creatorId!,
      );

      if (paymentIntentResponse.isOk) {
        final paymentIntent = paymentIntentResponse.body;
        final paymentData = paymentIntent['data']['reference'];
        final baseAmount = paymentIntent['data']['base_amount'];
        final amount = paymentIntent['data']['amount'];
        final status = paymentIntent['data']['status'];

        if (status == 'succeeded') {
          print('Payment already succeeded');
          Get.back();
          Get.snackbar('Job Update', 'This has been paid');
          return null;
        }

        print(paymentIntent['data']);

        final reference = paymentData;

        Stripe.publishableKey = stripePublishableKey;
        BillingDetails billingDetails = BillingDetails(
          address: Address(
            country: 'United kingdom',
            city: '',
            line1: 'addr1',
            line2: 'addr2',
            postalCode: '',
            state: '',
          ),
        );

        final verifyResponse = await paymentClient.verifyTransaction(reference);
        final verifyResponseData = verifyResponse.body;
        final verifyResponseBody = verifyResponseData['data']['data'];
        print(verifyResponseBody);

        final clientSecret = verifyResponseBody['client_secret'];

        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            //  intentConfiguration: IntentConfiguration(mode: ),
            customFlow: false,
            merchantDisplayName: 'Iynfluencer',
            paymentIntentClientSecret: clientSecret,
            allowsDelayedPaymentMethods: true,
            style: ThemeMode.light,
            billingDetails: billingDetails,
            // primaryButtonLabel: 'Pay \$$amount',
            googlePay: PaymentSheetGooglePay(
              merchantCountryCode: 'US',
              currencyCode: 'USD',
              //  amount: baseAmount.toString(),
            ),
          ),
        );
        await Stripe.instance.presentPaymentSheet().then((value) {
          Get.snackbar("Payment", "Payment successful");
          Get.toNamed(AppRoutes.paymentSuccesfulScreen, arguments: bidsArguments);
        }).onError((error, stackTrace) {
          Get.snackbar("Payment", "Payment flow has been cancelled");
          if (error is StripeException) {
             Get.snackbar("Payment", "Payment flow has been cancelled");
            print('${error.error.localizedMessage}');
          } else {
             Get.snackbar("Payment", "Payment flow has been cancelled");
          }
        });
        ;

        // await displayPaymentSheet(reference, bidsArguments, clientSecret);
      } else {
        print(
            'Failed to create with Transaction: ${paymentIntentResponse.statusCode}, ${paymentIntentResponse.body}');
        throw Exception('Failed to create Transaction');
      }
    } catch (err) {
      print('Exception: $err');
      throw Exception('Error initializing payment: $err');
    }
  }

/* 
  Future<String?> initPaymentSheet(BidsArguments bidsArguments) async {
    try {
      final JobBids? dataz = bidsArguments.jobBid;
      final Job? selectedJob = bidsArguments.job;
      print(dataz!.bidId!);
      print(dataz!.jobId!);
      print(dataz!.influencerId!);
      print(dataz!.price!.toString());
      print(selectedJob!.creatorId!);

      final price = dataz.price!;
      final givenPrice = calculateAmount(price);
      print(givenPrice);

      final Response<dynamic> paymentIntentResponse =
          await paymentClient.createPayment(
        dataz.bidId!,
        dataz.jobId!,
        dataz.influencerId!,
        dataz!.price!,
        selectedJob!.creatorId!,
      );

      if (paymentIntentResponse.isOk) {
        final paymentIntent = paymentIntentResponse.body;
        final paymentData = paymentIntent['data']['reference'];
        final baseAmount = paymentIntent['data']['base_amount'];
        final amount = paymentIntent['data']['amount'];
        final status = paymentIntent['data']['status'];

        if (status == 'succeeded') {
          print('Payment already succeeded');
           Get.back();
           Get.snackbar('Job Update', 'This has been paid');
          return null;
        }

        print(paymentIntent['data']);

        final reference = paymentData;

        Stripe.publishableKey = stripePublishableKey;
        BillingDetails billingDetails = BillingDetails(
          address: Address(
            country: 'United kingdom',
            city: '',
            line1: 'addr1',
            line2: 'addr2',
            postalCode: '',
            state: '',
          ),
        );

        final verifyResponse = await paymentClient.verifyTransaction(reference);
        final verifyResponseData = verifyResponse.body;
        final verifyResponseBody = verifyResponseData['data']['data'];
        print(verifyResponseBody);

        final clientSecret = verifyResponseBody['client_secret'];

        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            customFlow: false,
            merchantDisplayName: 'Iynfluencer',
            paymentIntentClientSecret: clientSecret,
            allowsDelayedPaymentMethods: true,
            style: ThemeMode.light,
            billingDetails: billingDetails,
            // primaryButtonLabel: 'Pay \$$amount',
            googlePay: PaymentSheetGooglePay(
              merchantCountryCode: 'US',
              currencyCode: 'USD',
            ),
          ),
        );
        await Stripe.instance.presentPaymentSheet();

        return status;
      } else {
        print(
            'Failed to create with Transaction: ${paymentIntentResponse.statusCode}, ${paymentIntentResponse.body}');
        throw Exception('Failed to create Transaction');
      }
    } catch (err) {
      print('Exception: $err');
      throw Exception('Error initializing payment: $err');
    }
  }

  void displaySheet(BidsArguments bidsArguments) async {
    try {
      final referenceId = await initPaymentSheet(bidsArguments);

      if (referenceId != null) {
        await displayPaymentSheet(referenceId, bidsArguments);
      } else {
        throw Exception('Failed to obtain payment reference');
      }
    } catch (error) {
      print('Error during payment process: $error');
    }
  } */

  Future<void> displayPaymentSheet(
      String referenceId, BidsArguments bidsArguments) async {
    try {
      final verifyResponse = await paymentClient.verifyPayment(referenceId);

      if (verifyResponse.body['status'] == true) {
        print('Payment verified: ${verifyResponse.body['message']}');
        Get.toNamed(AppRoutes.paymentSuccesfulScreen, arguments: bidsArguments);
      } else {
        print('Payment not verified: ${verifyResponse.body['message']}');
        Get.toNamed(AppRoutes.paymentFailedScreen);
      }
    } catch (error) {
      if (error is StripeException) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('${error.error.localizedMessage}')),
        );
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Stripe Error: $error')),
        );
      }
    }
  }

  int calculateAmount(int price) {
    final calculatedAmount = price * 100;
    return calculatedAmount;
  }
}
