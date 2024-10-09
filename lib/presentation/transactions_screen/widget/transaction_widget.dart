import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/models/payments/payment_model.dart';
import 'package:iynfluencer/presentation/transactions_screen/controller/transaction_controller.dart';

class TransactionWidget extends StatelessWidget {
  final Payment? payment;
  VoidCallback? onTapTransCard;

  TransactionWidget({this.payment, this.onTapTransCard});

  final controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
        controller.formatDateTime(payment?.createdAt ?? DateTime.now());

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    String truncateEllipsis({required String myString, int? textLength = 15}) {
      return (myString.length <= textLength!)
          ? myString
          : '${myString.substring(0, textLength)}.....';
    }

    return InkWell(
      onTap: () {
        onTapTransCard?.call();
      },
      child: Container(
        width: double.maxFinite,
        padding: getPadding(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorConstant.lightgray,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgGreenArrow,
                                height: getSize(20),
                                width: getSize(20),
                                margin: getMargin(bottom: 4),
                                color: ColorConstant.deepgray),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: getVerticalSize(50),
                        width: getVerticalSize(155),
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Text(
                                    // payment?.job?.title ?? '',
                                    truncateEllipsis(
                                        myString: payment?.job?.title ?? ''),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold14Gray900
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    formattedDateTime,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight125Gray600ab
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: ColorConstant.black9000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      SizedBox(
                        // width: 70,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 4, right: 2),
                              child: Text(
                                '\$${((payment?.amount ?? 0) / 100).toStringAsFixed(2)}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight14Gray900a2
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstant.black9000),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: payment?.status == 'processing'
                                      ? ColorConstant.lightPink222
                                      : payment?.status == 'succeeded'
                                          ? ColorConstant.lightgray
                                          : ColorConstant.redA700,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  payment?.status ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  style: AppStyle.txtSatoshiLight14Gray900a2
                                      .copyWith(
                                          fontSize: 12,
                                          color: payment?.status == 'processing'
                                              ? ColorConstant.lightRed222
                                              : payment?.status == 'succeeded'
                                                  ? ColorConstant.deepgray
                                                  : ColorConstant.whiteA700,
                                          fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  /*      SizedBox(height: 5),
                  Divider(
                    color: ColorConstant.strk100,
                    thickness: 3,
                  ) */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
