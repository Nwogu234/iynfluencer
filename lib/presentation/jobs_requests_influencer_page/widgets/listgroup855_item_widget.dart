import 'package:iynfluencer/presentation/jobs_requests_influencer_page/models/jobs_requests_influencer_model.dart';
import 'package:iynfluencer/presentation/request_detail_screen/request_detail_screen.dart';

import '../controller/jobs_requests_influencer_controller.dart';
import '../models/listgroup855_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class Listgroup855ItemWidget extends StatelessWidget {
  Listgroup855ItemWidget(
    this.listgroup855ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  JobsRequestsInfluencerModel listgroup855ItemModelObj;

  final JobsRequestsInfluencerController controller =
      Get.find<JobsRequestsInfluencerController>();

  // Widget cancelButton = TextButton(
  //   child: Text("Cancel"),
  //   onPressed: () {},
  // );
  // Widget continueButton = TextButton(
  //   child: Text("Continue"),
  //   onPressed: () {
  //    controller.jobsRequestsInfluencerModelObj();
  //   },
  // );

  // show the dialog
  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button for close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dismiss Request'),
          content: Text('Are You Sure you want to Dismiss Request'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // close the dialog
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Perform an action when OK button is pressed
                controller.influencerDeclineRequestJob(
                    listgroup855ItemModelObj.jobRequestId!,
                    Navigator.of(context));
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

   String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20
      ),
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          padding: getPadding(
            left: 2,
            right: 2,
          ),
          decoration: AppDecoration.outlineIndigo501,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  right: 7,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      fit: BoxFit.cover,
                      url: listgroup855ItemModelObj.creatorUserData?.avatar ?? '',
                      height: getSize(
                        45,
                      ),
                      width: getSize(
                        45,
                      ),
                      radius: BorderRadius.circular(
                        getSize(
                          22.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 16,
                        top: 4,
                        bottom: 1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "${capitalizeFirstLetter(listgroup855ItemModelObj.creatorUserData?.firstName)} ${capitalizeFirstLetter(listgroup855ItemModelObj.creatorUserData?.lastName)}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold145,
                          ),
                          Padding(
                            padding: getPadding(
                              left: 1,
                              top: 1,
                            ),
                            child: Text(
                               listgroup855ItemModelObj.creatorUserData?.country ?? 'Nigeria',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      svgPath: ImageConstant.imgVector,
                      height: getVerticalSize(
                        1,
                      ),
                      width: getHorizontalSize(
                        13,
                      ),
                      margin: getMargin(
                        top: 15,
                        bottom: 28,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 20,
                ),
                child: Text(
                  listgroup855ItemModelObj.job?.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold14Gray900ab,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  321,
                ),
                margin: getMargin(
                  left: 1,
                  top: 8,
                  right: 9,
                ),
                child: Text(
                  listgroup855ItemModelObj.job?.description ?? '',
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiLight14Gray900ab,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 14,
                  right: 62,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_budget".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight135Gray600,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 3,
                          ),
                          child: Text(
                            '${listgroup855ItemModelObj.job?.budgetFrom} ${listgroup855ItemModelObj.job?.budgetTo}',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold125Gray900a7,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "msg_project_duration".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight135Gray600,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 3,
                          ),
                          child: Text(
                            '${listgroup855ItemModelObj.job!.duration!.toString()} weeks',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold125Gray900a7,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 20,
                  bottom: 16,
                ),
                child: Row(
                  children: [
                    CustomButton(
                      height: getVerticalSize(
                        32,
                      ),
                      width: getHorizontalSize(
                        90,
                      ),
                      text: "lbl_view_details".tr,
                      fontStyle: ButtonFontStyle.SatoshiBold12,
                      onTap: () {
                        Get.to(RequestDetailScreen(
                          jobrequest: listgroup855ItemModelObj,
                        ),
                         transition: Transition.zoom,
                         duration: Duration(seconds:1)
                        );
                        // Get.toNamed(
                        //   AppRoutes.requestDetailScreen,
                        // );
                      },
                    ),
                    CustomButton(
                      height: getVerticalSize(
                        32,
                      ),
                      width: getHorizontalSize(
                        72,
                      ),
                      text: "lbl_dismiss".tr,
                      margin: getMargin(
                        left: 12,
                      ),
                      onTap: () => _showAlertDialog(context),
                      variant: ButtonVariant.OutlineIndigo50_2,
                      fontStyle: ButtonFontStyle.SatoshiBold12Gray900ab,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
