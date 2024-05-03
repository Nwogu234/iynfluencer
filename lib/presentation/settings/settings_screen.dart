import 'package:iynfluencer/presentation/settings/widgets/edit_bottom_sheet.dart';

import '../../data/general_controllers/user_controller.dart';
import 'controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String capitalize(String value) {
      if (value == null || value.isEmpty) {
        return value;
      }
      return value[0].toUpperCase() + value.substring(1);
    }
    final UserController user = Get.find();

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
            margin: getMargin(left: 20, top: 9, bottom: 9),
            onTap: () {
              onTapArrowleft21();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "Settings"),
          styleType: Style.bgOutlineIndigo50,
        ),
        body: Obx(
              () => Padding(
            padding: const EdgeInsets.fromLTRB(10.0,30,10,0),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.cyan300,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: EditUser(user: user),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Account Details',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      'Edit',
                                      style: TextStyle(color: ColorConstant.cyan300, fontSize: 10,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Email: ',
                                      style: TextStyle(color: ColorConstant.gray600),
                                    ),
                                    Text(
                                      '${user.userModelObj.value.email}',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'First Name:',
                                      style: TextStyle(color: ColorConstant.gray600),
                                    ),
                                    Text(
                                      '${capitalize(user.userModelObj.value.firstName)}',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Last Name: ',
                                      style: TextStyle(color: ColorConstant.gray600),
                                    ),
                                    Text(
                                      '${capitalize(user.userModelObj.value.lastName)}',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Country:',
                                      style: TextStyle(color: ColorConstant.gray600),
                                    ),
                                    Text(
                                      user.userModelObj.value.firstName != null && user.userModelObj.value.firstName.isNotEmpty
                                          ? capitalize(user.userModelObj.value.country!)
                                          : "None",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date of Birth:',
                                      style: TextStyle(color: ColorConstant.gray600),
                                    ),
                                    Text(
                                      "${user.userModelObj.value.dob}",

                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Phone Number:',
                                      style: TextStyle(color: ColorConstant.gray600),
                                    ),
                                    Text(
                                      user.userModelObj.value.firstName != null && user.userModelObj.value.firstName.isNotEmpty
                                          ? user.userModelObj.value.firstName
                                          : "None",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft21() {
    Get.back();
  }
}
