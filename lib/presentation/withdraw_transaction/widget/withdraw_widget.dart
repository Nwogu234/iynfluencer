import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/data/models/notification/notification_model';
import 'package:iynfluencer/data/models/withdrawal/withdraw_transaction.dart';
import 'package:iynfluencer/theme/app_decoration.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_image_view.dart';

class WithdrawalWidget extends StatelessWidget {
  final TransactionDoc  withdrawal;

  WithdrawalWidget({required this.withdrawal});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 10
      ),
      child: Container(
         width: double.maxFinite,
       // decoration: AppDecoration.outlineIndigo501,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Padding(
                       padding: EdgeInsets.only(right: 10),
                       child: Container(
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: CustomImageView(
                            imagePath: ImageConstant.imgFrameDollar,
                             height: getSize(30),
                             width: getSize(30),
                             margin: getMargin(bottom: 4),
                             radius: BorderRadius.circular(20.r),
                           ),
                         ),
                       ),
                     ),
                      Expanded(child: Text('You sucessfully completed a Withdrawal of \$${((withdrawal.amount)! / 100).toString()}'))
                   ],
                 ),
                 Text(
                    timeago.format(withdrawal.createdAt!),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                   fontSize: 12.5.sp,
                   fontWeight: FontWeight.w500
                  ),
                 )
            ]),
      ),
    );
  }
}
