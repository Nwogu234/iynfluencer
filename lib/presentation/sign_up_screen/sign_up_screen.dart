import 'package:iynfluencer/widgets/country_flag.dart';
import 'package:iynfluencer/widgets/getdropdown_button_form_field.dart';
import 'controller/sign_up_controller.dart';
import 'package:iynfluencer/data/models/country/country_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_checkbox.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:country_flags/country_flags.dart';

import 'models/sign_up_model.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Country> filteredCountries = [];

  /*  void onTextChanged(String query) {
    controller.countryFilter(query);

    });
  } */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorConstant.whiteA70001,
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          getPadding(left: 20, top: 12, right: 20, bottom: 12),
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
                                padding: getPadding(left: 5, top: 19),
                                child: Text("msg_create_an_account".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH1)),
                            Container(
                                width: getHorizontalSize(262),
                                margin: getMargin(left: 6, top: 7, right: 66),
                                child: Text("msg_enter_your_details".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray600)),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.firstnameController,
                                hintText: "lbl_first_name".tr,
                                margin: getMargin(top: 34),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle:
                                    TextFormFieldFontStyle.SatoshiLight14,
                                validator: (value) {
                                  if (value == null ||
                                      !isText(value, isRequired: true)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                }),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.lastnameController,
                                hintText: "lbl_last_name".tr,
                                margin: getMargin(top: 20),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle:
                                    TextFormFieldFontStyle.SatoshiLight14,
                                validator: (value) {
                                  if (value == null ||
                                      !isText(value, isRequired: true)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                }),
                            /*       CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.countryController,
                                hintText: "Country",
                                onTextChanged: onTextChanged,
                                margin: getMargin(top: 6)),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredCountries.length,
                              itemBuilder: (context, index) {
                                final country = filteredCountries[index];
                                return ListTile(
                                  leading: CountryFlags(
                                    countryCode:
                                        country.code, // Use the country code
                                    height: 20,
                                    width: 20,
                                  ),
                                  title: Text(country.code),
                                  subtitle: Text(country.name),
                                  onTap: () {
                                    onTapCountryFlag(country);
                                  },
                                );
                              },
                            ), */
                            Container(
                              width: double.infinity,
                              margin: getMargin(right: 30, top: 15),
                              child: GetDropdownButtonFormField<Country>(
                                value: controller.selectedCountry.value,
                                onChanged: (Country? country) {
                                  controller.selectedCountry.value = country!;
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select a country';
                                  }
                                  return null;
                                },
                                items: controller.countries
                                    .map<DropdownMenuItem<Country>>(
                                  (Country country) {
                                    return DropdownMenuItem<Country>(
                                      value: country,
                                      child: Row(
                                        children: [
                                          CountryFlags(
                                            countryCode: country.code,
                                            height: 20,
                                            width: 20,
                                          ),
                                          SizedBox(width: 8),
                                          Text(country
                                              .code), // Display the country abbreviation
                                          SizedBox(width: 8),
                                          Text(country.name),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.emailController,
                                hintText: "lbl_email".tr,
                                margin: getMargin(top: 20),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle:
                                    TextFormFieldFontStyle.SatoshiLight14,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                }),
                            Obx(() => CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.passwordController,
                                hintText: "lbl_password".tr,
                                margin: getMargin(top: 20),
                                variant: TextFormFieldVariant.Neutral,
                                padding: TextFormFieldPadding.PaddingT14,
                                fontStyle:
                                    TextFormFieldFontStyle.SatoshiLight14,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      controller.isShowPassword.value =
                                          !controller.isShowPassword.value;
                                    },
                                    child: Container(
                                        margin: getMargin(
                                            left: 30,
                                            top: 14,
                                            right: 15,
                                            bottom: 14),
                                        child: CustomImageView(
                                            svgPath:
                                                controller.isShowPassword.value
                                                    ? ImageConstant.imgEye
                                                    : ImageConstant.imgEye))),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(48)),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "Please enter valid password \n Password should have,\n at least a upper case letter \n at least a lower case letter\n at least a digit \n at least a special character [@#\$%^&+=] \n length of at least 4 \n no white space allowed";
                                  }
                                  return null;
                                },
                                isObscureText:
                                    controller.isShowPassword.value)),
                            Padding(
                                padding: getPadding(top: 46, right: 25),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() => CustomCheckbox(
                                          width: getHorizontalSize(40),
                                          value: controller.isCheckbox.value,
                                          margin: getMargin(top: 1, bottom: 14),
                                          onChange: (value) {
                                            controller.isCheckbox.value = value;
                                          })),
                                      Expanded(
                                          child: Container(
                                              width: getHorizontalSize(276),
                                              margin: getMargin(left: 5),
                                              child: Text(
                                                  "msg_by_clicking_continue".tr,
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight14)))
                                    ])),
                            CustomButton(
                                height: getVerticalSize(50),
                                text: "lbl_continue".tr,
                                margin: getMargin(top: 17),
                                padding: ButtonPadding.PaddingAll15,
                                onTap: () {
                                  onTapContinue(context);
                                }),
                            Padding(
                                padding: getPadding(top: 58, bottom: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 12, bottom: 7),
                                          child: SizedBox(
                                              width: getHorizontalSize(99),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color:
                                                      ColorConstant.gray200))),
                                      Text("msg_or_continue_with".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtOutfitMedium16),
                                      Padding(
                                          padding:
                                              getPadding(top: 12, bottom: 7),
                                          child: SizedBox(
                                              width: getHorizontalSize(99),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color:
                                                      ColorConstant.gray200)))
                                    ]))
                          ]))),
            ),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 108, right: 107, bottom: 38),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomImageView(
                      svgPath: ImageConstant.imgGoogle,
                      height: getSize(32),
                      width: getSize(32)),
                  Container(
                      height: getSize(28),
                      width: getSize(28),
                      margin: getMargin(left: 34, top: 2, bottom: 2),
                      child: Stack(alignment: Alignment.topCenter, children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgGlobe,
                            height: getSize(28),
                            width: getSize(28),
                            alignment: Alignment.center),
                        CustomImageView(
                            svgPath: ImageConstant.imgVolume,
                            height: getVerticalSize(16),
                            width: getHorizontalSize(14),
                            alignment: Alignment.topCenter,
                            margin: getMargin(top: 5))
                      ])),
                  CustomImageView(
                      imagePath: ImageConstant.imgFacebook,
                      height: getSize(32),
                      width: getSize(32),
                      margin: getMargin(left: 34))
                ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
    Get.back();
  }

  /// Navigates to the phoneVerificationScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the phoneVerificationScreen.
  onTapContinue(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (!controller.isCheckbox.value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please accept the terms and conditions."),
        ),
      );
      return;
    }

    controller.signUp();
  }

  /* onTapCountryFlag(Country country) {
    final flagImage = CountryFlags(countryCode: country.code);

    controller.countryController.text = '';
    controller.countryController.value = TextEditingValue(
      text: '',
      selection: TextSelection.fromPosition(TextPosition(offset: 0)),
    );
    controller.countryController.text = '';
    controller.countryController.value = TextEditingValue(
      text: '',
      selection: TextSelection.fromPosition(TextPosition(offset: 0)),
    );

    controller.countryController.text =
        '$flagImage (${country.code}) ${country.name}';
    controller.countryController.value = TextEditingValue(
      text: controller.countryController.text,
      selection: TextSelection.fromPosition(
          TextPosition(offset: controller.countryController.text.length)),
    );
  } */
}
