// import 'package:flutter/material.dart';
// import 'package:iynfluencer/core/app_export.dart';
// import 'package:iynfluencer/presentation/post_page_screen/controller/post_page_controller.dart';
// import 'package:iynfluencer/widgets/custom_button.dart';

// // ignore: must_be_immutable
// class AppbarButton extends StatelessWidget {
//   AppbarButton({
//     Key? key,
//     this.margin,
//     //this.onTap,
//     required this.controller,
//   }) : super(
//           key: key,
//         );

//   EdgeInsetsGeometry? margin;

//   // Function? onTap;
//   final PostPageController controller;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         //onTap?.call();
//         controller.postJob();
//         controller.submitForm(context);
//       },
//       child: Padding(
//         padding: margin ?? EdgeInsets.zero,
//         child: CustomButton(
//           height: getVerticalSize(
//             32,
//           ),
//           width: getHorizontalSize(
//             70,
//           ),
//           text: "lbl_post".tr,
//           variant: ButtonVariant.FillCyan30083,
//           padding: ButtonPadding.PaddingAll4,
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class AppbarButton extends StatelessWidget {
  AppbarButton({
    Key? key,
    this.margin,
    required this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomButton(
          height: getVerticalSize(
            32,
          ),
          width: getHorizontalSize(
            70,
          ),
          text: "lbl_post".tr,
          variant: ButtonVariant.FillCyan300,
          padding: ButtonPadding.PaddingAll4,
        ),
      ),
    );
  }
}
