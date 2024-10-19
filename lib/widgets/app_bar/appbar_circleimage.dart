import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class AppbarCircleimage extends StatelessWidget {
  AppbarCircleimage({
    Key? key,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
    this.url,
    this.fit,
    this.radius
  }) : super(
          key: key,
        );

  String? imagePath;
  String? url;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  BoxFit? fit;

  BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Container(
           decoration: BoxDecoration(
                    shape: BoxShape.circle
          ),
          child: CustomImageView(
            svgPath: svgPath,
            imagePath: imagePath,
            url: url,
            height: getSize(
              40,
            ),
            width: getSize(
              40,
            ),
            fit: BoxFit.cover,
            radius: BorderRadius.circular(
            getSize(
               25.0,
             ),
            ),
          ),
        ),
      ),
    );
  }
}
