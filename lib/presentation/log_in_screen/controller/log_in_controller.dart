import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/presentation/log_in_screen/models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../../../data/apiClient/api_client.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

/// A controller class for the LogInScreen.
///
/// This class manages the state of the LogInScreen, including the
/// current logInModelObj
class LogInController extends GetxController {
  var storage = FlutterSecureStorage();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var passwordFocusNode = FocusNode();
  var emailFocusNode = FocusNode();
  final apiClient = ApiClient();
  final notificationClient = NotificationClient();
  String message = '';
  final LocalAuthentication auth = LocalAuthentication();

  Rx<bool> isBiometricSupported = false.obs;
  Rx<bool> isCredentialsSaved = false.obs;
  Rx<LogInModel> logInModelObj = LogInModel(email: "", password: "").obs;

  Rx<bool> isShowPassword = true.obs;
  var biometricType = ''.obs;

  Future<void> checkForStoredCredentials() async {
    try {
      String? email = await storage.read(key: 'email');
      String? password = await storage.read(key: 'password');

      if (email != null && password != null) {
        isCredentialsSaved.value = true;
        checkBiometricAvailability();
      } else {
        isCredentialsSaved.value = false;
        Get.snackbar('Failed', 'Use Manual Login');
      }
    } catch (e) {
      Get.snackbar('Error', 'Use Manual Login');
    }
  }

  Future<void> checkBiometricAvailability() async {
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      bool isBiometricAvailable = await auth.isDeviceSupported();

      if (canCheckBiometrics && isBiometricAvailable) {
        List<BiometricType> availableBiometrics =
            await auth.getAvailableBiometrics();

        print("list of biometrics : $availableBiometrics");

        if (availableBiometrics.isNotEmpty) {
          isBiometricSupported.value = true;

          if (availableBiometrics.contains(BiometricType.face)) {
            print('Face ID is available');
            biometricType.value = 'face';
            Get.snackbar('Biometrics Available',
                'Face ID is available. You can use Face ID to login.');
          }

          if (availableBiometrics.contains(BiometricType.fingerprint)) {
            print('Fingerprint is available');
            biometricType.value = 'fingerprint';
            Get.snackbar('Biometrics Available',
                'Fingerprint is available. You can use Fingerprint to login.');
          }
          promptBiometricLogin();
        } else {
          Get.snackbar('Biometrics Unavailable',
              'No biometric types available on this device.');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to check biometric availability.');
      print('Error checking biometrics: $e');
    }
  }

  Future<void> promptBiometricLogin() async {
    bool authenticated = false;
    try {
      String localizedReason = biometricType.value == 'face'
          ? 'Please authenticate using Face ID to login'
          : 'Please authenticate using Fingerprint to login';

      authenticated = await auth.authenticate(
          localizedReason: localizedReason,
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
          authMessages: <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Oops! Biometric authentication required!',
              cancelButton: 'No thanks',
            ),
        ]);
    } on PlatformException catch (e) {
      print('Error using biometrics: $e');
    }

    if (authenticated) {
      await biometricLogIn();
    } else {
      Get.snackbar('Error', 'Biometric authentication failed.');
    }
  }

  Future<void> saveLoginCredentials(String email, String password) async {
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
  }

  Future<void> biometricLogIn() async {
    // Retrieve saved login details
    String? email = await storage.read(key: 'email');
    String? password = await storage.read(key: 'password');

    await logInWithStoredCredentials(email!, password!);
    Get.snackbar(
        'Login Successful', 'Welcome, you have logged in using biometrics.');
  }

  Future<void> logInWithStoredCredentials(String email, String password) async {
    if (email != null && password != null) {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      logInModelObj.update((val) {
        val?.email = email;
        val?.password = password;
      });

      try {
        Response loginResponse = await apiClient.logIn(logInModelObj.value);
        print("This is message reposnde ${loginResponse.body["message"]}");
        message = loginResponse.body['message'].toString();

        if (loginResponse.body['status'].toString() == 'success') {
          Get.back();
          Get.snackbar('Success', 'Login successful!');

          var headers = loginResponse.headers;
          var authorization = headers?['authorization'];
          await storage.write(key: 'token', value: authorization.toString());

          var activeProfile = await storage.read(key: 'activeProfile');
          print(activeProfile);
          if (activeProfile == null) {
            Get.offNamed(AppRoutes.chooseProfile);
          } else if (activeProfile == 'Creator') {
            Get.offNamed(AppRoutes.homeCreatorContainerScreen);
          } else {
            Get.offNamed(AppRoutes.influencerTabScreen);
          }
        } else {
          print(loginResponse.statusCode);
          Get.back();
          Get.snackbar('Failure',
              'login in failed ${loginResponse.body["message"].toString()}');
        }
      } catch (e) {
        Get.back();
        print(e);
        Get.snackbar('Error', 'Sever interrupted');
      }
    }
  }

  Future<void> logIn() async {
    logInModelObj.update((val) {
      val?.email = usernameController.text;
      val?.password = passwordController.text;
    });

    final email = usernameController.text;
    final password = passwordController.text;

    Get.dialog(
      Center(
          child: CircularProgressIndicator(
        color: ColorConstant.cyan100,
      )), // showing a loading dialog
      barrierDismissible: false, // user must not close it manually
    );

    try {
      Response loginResponse = await apiClient.logIn(logInModelObj.value);
      print("This is message reposnde ${loginResponse.body["message"]}");
      message = loginResponse.body['message'].toString();

      if (loginResponse.body['status'].toString() == 'success') {
        Get.back();
        Get.snackbar('Success', 'Login successful!');
        await saveLoginCredentials(email, password);
        print("login details saved");

        var headers = loginResponse.headers;
        var authorization = headers?['authorization'];
        await storage.write(key: 'token', value: authorization.toString());

        ///the 3 commented line is code to test that the login in process is working as intended
        // await storage.write(key: 'activeProfile', value:null);
        // var test = await storage.read(key: 'test');
        // print(test);

        var activeProfile = await storage.read(key: 'activeProfile');
        print(activeProfile);
        if (activeProfile == null) {
          Get.offNamed(AppRoutes.chooseProfile);
        } else if (activeProfile == 'Creator') {
          Get.offNamed(AppRoutes.homeCreatorContainerScreen);
        } else {
          Get.offNamed(AppRoutes.influencerTabScreen);
        }
      } else {
        print(loginResponse.statusCode);
        Get.back();
        Get.snackbar('Failure',
            'login in failed ${loginResponse.body["message"].toString()}');
      }
    } catch (e) {
      Get.back();
      print(e);
      Get.snackbar('Error', 'Sever interrupted');
    }
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
