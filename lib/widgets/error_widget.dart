import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      width: fullPage
          ? 1.sw
          : 0.8.sw, // 100% of screen width if fullPage, else 80%
      height: fullPage
          ? 1.sh
          : 0.3.sh, // 100% of screen height if fullPage, else 30%
      color: Colors.red.withOpacity(0.1),
      child: Center(
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
    );
  }
}

class ResponsiveEmptyWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final bool fullPage;

  ResponsiveEmptyWidget({
    required this.errorMessage,
    required this.onRetry,
    this.fullPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullPage
          ? 1.sw
          : 0.8.sw, // 100% of screen width if fullPage, else 80%
      height: fullPage
          ? 1.sh
          : 0.3.sh, // 100% of screen height if fullPage, else 30%
      color: Colors.red.withOpacity(0.1),
      child: Center(
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
              child: Text('Bid A Job',
                  style: TextStyle(fontSize: 14.sp)), // Responsive font size
            ),
          ],
        ),
      ),
    );
  }
}
