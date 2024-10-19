import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/models/payments/payment_model.dart';
import 'package:iynfluencer/presentation/transaction_one_screen/controller/transaction_one_controller.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class TransactionOneScreen extends StatelessWidget {
  final Payment selectedPayment;

   TransactionOneScreen({
    required this.selectedPayment
  });

  final controller = Get.put(TransactionOneController());

  @override
  Widget build(BuildContext context) {
     String formattedDateTime =
        controller.formatDateTime(selectedPayment.createdAt ?? DateTime.now());

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
              height: getVerticalSize(48),
              leadingWidth: 50,
              leading: AppbarImage(
                height: getSize(30),
                width: getSize(30),
                svgPath: ImageConstant.imgArrowleftGray600,
                margin: getMargin(left: 20, top: 6, bottom: 12),
                onTap: () {
                  onTapArrowleft12();
                },
              ),
              centerTitle: true,
              title: AppbarTitle(text:"Transaction details".tr),
              styleType: Style.bgOutlineIndigo50,
            ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: getVerticalSize(197),
                padding: EdgeInsets.symmetric(vertical:20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgRectangle5059,
                        height: getSize(60),
                        width: getSize(66),
                        fit: BoxFit.cover,
                        radius: BorderRadius.circular(40.r),
                      ),
                    ),
                    SizedBox(height: 10),
                   Container(
                    width: getHorizontalSize(195),
                    alignment: Alignment.center,
                    child: Text(
                      selectedPayment.job?.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiLight125Gray600ab.
                      copyWith(
                        color: ColorConstant.black9000,
                        fontWeight: FontWeight.bold,
                        fontSize: getSize(13.5)
                        ),
                    ),
                   ),
                    SizedBox(height: 10),
                   Container(
                    width: getHorizontalSize(106),
                    alignment: Alignment.center,
                    child: Text(
                      '\$${((selectedPayment.amount ?? 0) / 100).toStringAsFixed(2)}',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiLight14Gray900a2
                         .copyWith(
                           fontSize: 18.0,
                           fontWeight: FontWeight.bold,
                           color: ColorConstant.black9000),
                    ),
                   ),
                    SizedBox(height: 10),
                     Container(
                       decoration: BoxDecoration(
                       color: selectedPayment.status == 'processing'
                              ? ColorConstant.lightPink222
                               : selectedPayment.status == 'succeeded'
                                  ? ColorConstant.lightgray
                                 : ColorConstant.redA700,
                       borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                                   padding: const EdgeInsets.symmetric(
                                   horizontal: 8, vertical: 4),
                          child: Text(
                                   selectedPayment.status ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: AppStyle.txtSatoshiLight14Gray900a2
                                       .copyWith(
                                          fontSize: 12,
                                          color: selectedPayment.status == 'processing'
                                                ? ColorConstant.lightRed222
                                                 : selectedPayment.status == 'succeeded'
                                                  ? ColorConstant.deepgray
                                                  : ColorConstant.whiteA700,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                  ]
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color:ColorConstant.gray200Ab
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                          side: BorderSide(
                          color: ColorConstant.whiteA700,
                          width: getHorizontalSize(1)),
                          borderRadius:BorderRadiusStyle.roundedBorder17),
                        child: Container(
                          height: getVerticalSize(176),
                          width: getVerticalSize(359),
                          decoration: BoxDecoration(
                            color:ColorConstant.whiteA700
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,vertical: 15
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: getHorizontalSize(128),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Transaction Details',
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray900.copyWith(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical:5
                                    ),
                                  height: getVerticalSize(120),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Text(
                                            'UserId',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtSatoshiLight125Gray600ab
                                             .copyWith(
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w300,
                                                 color: ColorConstant.black9000),
                                               ),
                                               Text(
                                                  selectedPayment.influencerId ?? '',
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight125Gray600ab
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400,
                                                          color:
                                                              ColorConstant.black9000),
                                                ),
                                        ]),
                                        SizedBox(height:10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Text(
                                             'Transaction Date',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                              style: AppStyle.txtSatoshiLight125Gray600ab
                                               .copyWith(
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w300,
                                                 color: ColorConstant.black9000),
                                            ),
                                        Text(
                                          formattedDateTime,
                                           overflow: TextOverflow.ellipsis,
                                           textAlign: TextAlign.right,
                                           style: AppStyle
                                                    .txtSatoshiLight125Gray600ab
                                                    .copyWith(
                                                       fontSize: 14,
                                                       fontWeight: FontWeight.w400,
                                                       color:ColorConstant.black9000),
                                            ),
                                        ]),
                                        SizedBox(height:10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Text(
                                             'Transaction ID',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                              style: AppStyle.txtSatoshiLight125Gray600ab
                                               .copyWith(
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w300,
                                                 color: ColorConstant.black9000),
                                            ),
                                        Text(
                                          selectedPayment.transactionId ?? '',
                                           overflow: TextOverflow.ellipsis,
                                           textAlign: TextAlign.right,
                                           style: AppStyle
                                                    .txtSatoshiLight125Gray600ab
                                                    .copyWith(
                                                       fontSize: 14,
                                                       fontWeight: FontWeight.w400,
                                                       color:ColorConstant.black9000),
                                            ),
                                        ]),
                                        SizedBox(height:10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Text(
                                             'Payment Method',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                              style: AppStyle.txtSatoshiLight125Gray600ab
                                               .copyWith(
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w300,
                                                 color: ColorConstant.black9000),
                                            ),
                                        Text(
                                           'Stripe Wallet',
                                           overflow: TextOverflow.ellipsis,
                                           textAlign: TextAlign.right,
                                           style: AppStyle
                                                    .txtSatoshiLight125Gray600ab
                                                    .copyWith(
                                                       fontSize: 14,
                                                       fontWeight: FontWeight.w400,
                                                       color:ColorConstant.black9000),
                                            ),
                                        ]),
                                        
                                    ],
                                  )
                                 
                                )
                              ],
                            ),
                            ),
                        ),
                      )
                      ),
        
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                          side: BorderSide(
                          color: ColorConstant.whiteA700,
                          width: getHorizontalSize(1)),
                          borderRadius:BorderRadiusStyle.roundedBorder17),
                        child: Container(
                          height: getVerticalSize(176),
                          width: getVerticalSize(359),
                          decoration: BoxDecoration(
                            color:ColorConstant.whiteA700
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,vertical: 15
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: getHorizontalSize(128),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Job Details',
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray900.copyWith(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical:5
                                    ),
                                  height: getVerticalSize(120),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Text(
                                            'Project cost',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtSatoshiLight125Gray600ab
                                             .copyWith(
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w300,
                                                 color: ColorConstant.black9000),
                                               ),
                                               Text(
                                                   '\$${((selectedPayment.amount ?? 0) / 100).toStringAsFixed(2)}',
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight125Gray600ab
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400,
                                                          color:
                                                              ColorConstant.black9000),
                                                ),
                                        ]),
                                        SizedBox(height:10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Text(
                                             'Job Title',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                              style: AppStyle.txtSatoshiLight125Gray600ab
                                               .copyWith(
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w300,
                                                 color: ColorConstant.black9000),
                                            ),
                                        Text(
                                           selectedPayment.job?.title ?? '',
                                           overflow: TextOverflow.ellipsis,
                                           textAlign: TextAlign.right,
                                           style: AppStyle
                                                    .txtSatoshiLight125Gray600ab
                                                    .copyWith(
                                                       fontSize: 14,
                                                       fontWeight: FontWeight.w400,
                                                       color:ColorConstant.black9000),
                                            ),
                                        ]),
                                        SizedBox(height:10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Text(
                                             'Budget',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                              style: AppStyle.txtSatoshiLight125Gray600ab
                                               .copyWith(
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w300,
                                                 color: ColorConstant.black9000),
                                            ),
                                        Text(
                                           "\$${capitalizeFirstLetter(selectedPayment.job?.budgetFrom.toString())}-\$${capitalizeFirstLetter(selectedPayment.job?.budgetTo.toString())}",
                                           overflow: TextOverflow.ellipsis,
                                           textAlign: TextAlign.right,
                                           style: AppStyle
                                                    .txtSatoshiLight125Gray600ab
                                                    .copyWith(
                                                       fontSize: 14,
                                                       fontWeight: FontWeight.w400,
                                                       color:ColorConstant.black9000),
                                            ),
                                        ]),   
                                    ],
                                  )
                                )
                              ],
                            ),
                            ),
                        ),
                      )
                      )
                  ],
                )
              ),
            ],
          ),
        ),
      ),

         bottomNavigationBar: SafeArea(
           child: Container(
            margin: getMargin(left: 20, right: 20, bottom: 36, top: 40),
            decoration: AppDecoration.fillWhiteA700,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    CustomButton(
                        height: getVerticalSize(44),
                        text: "Confirm Job done".tr,
                        padding: ButtonPadding.PaddingAll12,
                        onTap: () {
                        },
                    ),
                CustomButton(
                    height: getVerticalSize(44),
                    text: "dispute".tr,
                    margin: getMargin(top: 10),
                    variant: ButtonVariant.Neutral,
                    padding: ButtonPadding.PaddingAll12,
                    fontStyle: ButtonFontStyle.SatoshiBold14Gray900)
              ],
            ),
                   ),
         ),
      )
      );
  }

  
  void onTapArrowleft12() {
    Get.back();
  }

}
