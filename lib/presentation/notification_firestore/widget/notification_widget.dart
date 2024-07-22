import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/data/models/notification/notification_model';
import 'package:iynfluencer/theme/app_decoration.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_image_view.dart';

class NotificationWidget extends StatelessWidget {
  final MNotification  notication;

  NotificationWidget({required this.notication});

  @override
  Widget build(BuildContext context) {
    final type = notication.type;
    final img = notication.img;
    final title = notication.title;
    final body = notication.body;
    final timeStamp = notication.createdAt;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20
      ),
      child: Container(
         width: double.maxFinite,
       // decoration: AppDecoration.outlineIndigo501,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              type == 'Message'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                child: CustomImageView(
                                  fit: BoxFit.cover,
                                  url: img ??
                                      'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                                  height: getSize(30),
                                  width: getSize(30),
                                  margin: getMargin(bottom: 4),
                                  radius: BorderRadius.circular(20.r),
                                ),
                              ),
                            ),
                             Text('$title has sent a message')
                          ],
                        ),
                        Text(
                           timeago.format(timeStamp!),
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.left,
                           style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                          fontSize: 12.5.sp,
                          fontWeight: FontWeight.w500
                         ),
                        )
                      ],
                    )
                  : type == 'Bid'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(title),
                            ),
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
                                      child: CustomImageView(
                                        fit: BoxFit.cover,
                                        imagePath: ImageConstant.imgFrameBudget,
                                        height: getSize(20),
                                        width: getSize(20),
                                        margin: getMargin(bottom: 4),
                                      ),
                                    ),
                                  ),
                                  Text('An influencer has submitted a Bid')
                                ]),
                          Text(
                           timeago.format(timeStamp!),
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.left,
                           style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                          fontSize: 12.5.sp,
                          fontWeight: FontWeight.w500
                         ),
                        )
                          ],
                        ) : 
                        type == 'Job' ? 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(title),
                            ),
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
                                      child: CustomImageView(
                                        fit: BoxFit.cover,
                                        imagePath: ImageConstant.imgFrameBudget,
                                        height: getSize(20),
                                        width: getSize(20),
                                        margin: getMargin(bottom: 4),
                                      ),
                                    ),
                                  ),
                                  Text(body)
                                ]),
                          Text(
                           timeago.format(timeStamp!),
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.left,
                           style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                          fontSize: 12.5.sp,
                          fontWeight: FontWeight.w500
                         ),
                        )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(title),
                            ),
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
                                      child: CustomImageView(
                                        fit: BoxFit.cover,
                                        imagePath: ImageConstant.imgFrameBudget,
                                        height: getSize(20),
                                        width: getSize(20),
                                        margin: getMargin(bottom: 4),
                                      ),
                                    ),
                                  ),
                                  Text('$body has hired an Influencer')
                                ]),
                        Text(
                           timeago.format(timeStamp!),
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.left,
                           style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                          fontSize: 12.5.sp,
                          fontWeight: FontWeight.w500
                         ),
                        )
                          ],
                        )
            ]),
      ),
    );
  }
}
