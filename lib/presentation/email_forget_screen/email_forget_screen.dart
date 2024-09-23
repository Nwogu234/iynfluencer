import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/email_code/email_code_controller/email_code_controller.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailForgetScreen extends GetWidget<EmailCodeController> {
  EmailForgetScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA70001,
        body: SafeArea(
          child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 20, top: 12, right: 20, bottom: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgArrowleftGray600,
                        height: getSize(30),
                        width: getSize(30),
                        onTap: () {
                          onTapImgArrowleft();
                        }),
                    Padding(
                        padding: getPadding(left: 5, top: 22),
                        child: Text("Confirm your email address",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH1)),
                    Container(
                        width: getHorizontalSize(259),
                        margin: getMargin(left: 6, top: 4, right: 69),
                        child: Text(
                            "Enter the code sent to ${controller.email}",
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH2Gray600)),
                    Obx(() {
                      if (controller.sendingOtp.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Form(
                          key: _formKey,
                          child: Padding(
                              padding:
                                  getPadding(left: 22, top: 32, right: 22),
                              child: Obx(() => PinCodeTextField(
                                  appContext: context,
                                  controller: controller.otpController.value,
                                  length: 4,
                                  obscureText: false,
                                  obscuringCharacter: '*',
                                  keyboardType: TextInputType.number,
                                  autoDismissKeyboard: true,
                                  enableActiveFill: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) {},
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a pin code.";
                                    } else if (value.length != 4) {
                                      return "The pin code must have exactly 4 digits.";
                                    }
                                    return null; // return null if validation is passed
                                  },
                                  pinTheme: PinTheme(
                                      fieldHeight: getHorizontalSize(54),
                                      fieldWidth: getHorizontalSize(54),
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(8)),
                                      selectedFillColor:
                                          ColorConstant.gray200,
                                      activeFillColor: ColorConstant.gray200,
                                      inactiveFillColor:
                                          ColorConstant.gray200,
                                      inactiveColor:
                                          ColorConstant.fromHex("#1212121D"),
                                      selectedColor:
                                          ColorConstant.fromHex("#1212121D"),
                                      activeColor: ColorConstant.fromHex(
                                          "#1212121D"))))),
                        );
                      }
                    }),
                    Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            controller.sendOtp(controller.email);
                          },
                          child: Padding(
                              padding: getPadding(top: 28, bottom: 5),
                              child: Text("lbl_resend_code".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold14)),
                        ))
                  ])),
        ),
        bottomNavigationBar: CustomButton(
            height: getVerticalSize(50),
            text: "Continue".tr,
            margin: getMargin(left: 20, right: 20, bottom: 43),
            padding: ButtonPadding.PaddingAll15,
            onTap: () {
              onTapDone();
            }));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
    Get.back();
  }

  /// Navigates to the completeProfileCreatorScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the completeProfileCreatorScreen.
  onTapDone() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else if (await controller.myauth
            .verifyOTP(otp: controller.otpController.value.text) ==
        true) {
       print(controller.otpController.value.text);
      Get.snackbar('Verified', 'Your email was verified successfully');
      Get.toNamed(
        AppRoutes.resetPasswordScreen
      );
    } else {
      print(await controller.myauth
              .verifyOTP(otp: controller.otpController.value.text) ==
          false);
      print(controller.otpController.value.text);
      Get.snackbar('Wrong code', 'try again');
    }
  }
}
