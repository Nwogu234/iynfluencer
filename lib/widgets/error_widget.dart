import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';

class ResponsiveErrorWidget extends StatelessWidget {
  final String errorMessage;
  final String buttonText;
  final VoidCallback onRetry;
  final bool fullPage;

  ResponsiveErrorWidget({
    required this.errorMessage,
    required this.onRetry,
    this.fullPage = false,
    this.buttonText = 'Try Again',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorConstant.gray100,
        ),
        width: 320.w,// 100% of screen width if fullPage, else 80%
        height: 250.h ,// 100% of screen height if fullPage, else 30%
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp), // Responsive font size
                ),
                SizedBox(height: 20.h), // Responsive height
                ElevatedButton(
                  onPressed: onRetry,
                  child: Text(buttonText,
                      style: TextStyle(fontSize: 14.sp)), // Responsive font size
                ),
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
  final String buttonText;
  final bool fullPage;

  ResponsiveEmptyWidget({
    required this.buttonText,
    required this.errorMessage,
    required this.onRetry,
    this.fullPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorConstant.gray100,
        ),
        width: 320.w,// 100% of screen width if fullPage, else 80%
        height: 250.h ,// 100% of screen height if fullPage, else 30%
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp), // Responsive font size
                ),
                SizedBox(height: 20.h), // Responsive height
                ElevatedButton(
                  onPressed: onRetry,
                  child: Text(buttonText,
                      style: TextStyle(fontSize: 14.sp)), // Responsive font size
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
