import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button_two.dart';

class ResponsiveErrorWidget extends StatelessWidget {
  final String errorMessage;
   String? smallMessage;
  final String? buttonText;
  final VoidCallback onRetry;
  final bool fullPage;

  ResponsiveErrorWidget({
    required this.errorMessage,
     this.smallMessage,
    required this.onRetry,
    this.fullPage = false,
    this.buttonText = 'Try Again',
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: ColorConstant.gray100,
        ),
        width: 330.w,
        height: 230.h, 
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300.w,
                    child: Text(
                      errorMessage,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtSatoshiBold16
                                .copyWith(
                              fontSize: 16.sp,
                              color: ColorConstant.black900,
                              fontWeight: FontWeight.w600,
                            )
                    ),
                  ),
                ),
                 SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    smallMessage ?? '',
                    textAlign: TextAlign.center,
                    style:TextStyle(
                     fontSize: getFontSize(
                         13,
                       ),
                     fontFamily: 'Satoshi',
                     fontWeight: FontWeight.w300,
                     color: ColorConstant.gray600
              ),
                  ),
                ),
                SizedBox(height: 20.h), // Responsive height
                CustomButtonTwo(
                  height: getVerticalSize(45),
                  width: getHorizontalSize(120),
                  text: buttonText,
                  onTap: onRetry,
                  padding: ButtonPaddingz.PaddingAll4,
                  fontStyle: ButtonFontStylez.SatoshiBold15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveEmptyWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
   String? smallMessage;
  final String buttonText;
  final bool fullPage;

  ResponsiveEmptyWidget({
    required this.buttonText,
    required this.errorMessage,
     this.smallMessage,
    required this.onRetry,
    this.fullPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: ColorConstant.gray100,
      ),
      width: 330.w,
      height: 230.h, 
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp), 
                ),
              ),
               SizedBox(height: 20.h),
                Align(
                alignment: Alignment.center,
                child: Text(
                  smallMessage ?? '',
                  textAlign: TextAlign.center,
                  style:TextStyle(
                   fontSize: getFontSize(
                       13,
                     ),
                   fontFamily: 'Satoshi',
                   fontWeight: FontWeight.w300,
                   color: ColorConstant.gray600
            ),
                ),
              ),
              SizedBox(height: 20.h), // Responsive height
              CustomButtonTwo(
                height: getVerticalSize(45),
                width: getHorizontalSize(120),
                text: buttonText,
                onTap: onRetry,
                padding: ButtonPaddingz.PaddingAll4,
                fontStyle: ButtonFontStylez.SatoshiBold15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
