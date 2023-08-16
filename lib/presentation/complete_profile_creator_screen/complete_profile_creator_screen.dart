import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/validation_functions.dart';
import '../../widgets/custo_dropdown.dart';
import 'controller/complete_profile_creator_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileCreatorScreen
    extends GetWidget<CompleteProfileCreatorController> {
  CompleteProfileCreatorScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorConstant.whiteA70001,
            appBar: CustomAppBar(
                height: 54.h,
                leadingWidth: 50.w,
                leading: AppbarImage(
                    height: 30.h,
                    width: 30.w,
                    svgPath: ImageConstant.imgArrowleftGray600,
                    margin: EdgeInsets.only(
                      left: 20.w,
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    onTap: () {
                      onTapArrowleft();
                    }),
                actions: [
                  AppbarSubtitle2(
                    text: "lbl_skip".tr,
                    margin:
                    EdgeInsets.fromLTRB(
                        28.w, 17.h, 28.w, 17.h
                    ),
                  )
                ]),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                    BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 5.h),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("msg_complete_profile".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtH1),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: GestureDetector(
                                  onTap: () async {
                                    final ImagePicker _picker = ImagePicker();
                                    try {
                                      // Pick an image
                                      final XFile? image = await _picker
                                          .pickImage(source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.profileImage.value =
                                            File(image.path);
                                        await controller.storage.write(key: 'profile_image_path', value: image.path);
                                      }
                                    } catch (e) {
                                      print(e);
                                      // You can display an error message to the user
                                      Get.snackbar('Error',
                                          'Failed to pick an image. Please try again.');
                                    }
                                  },
                                  child: Obx(
                                        () => controller.profileImage.value == null
                                        ? CustomImageView(
                                      svgPath: ImageConstant.imgCheckmark,
                                      height: 90.h,
                                      width: 95.w,
                                      margin: EdgeInsets.only(
                                        left: 8.w,
                                        top: 31.h,
                                      ),
                                    )
                                        : CircleAvatar(
                                      radius: 45.h,
                                      backgroundImage: FileImage(
                                          controller.profileImage.value!),
                                    ),
                                  ),
                                ),
                              ),
                              // other widgets
                              Padding(
                                padding: EdgeInsets.only(top: 23.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select categories of your brand",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiLight13Gray900,
                                    ),
                                    Obx(
                                          () => CustoDropDown(
                                        value: controller.selectedValue.value,
                                        hintText: 'Add Niche',
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        items: controller.itemsToDisplay,
                                        onChanged: controller.onDropdownItemChanged,
                                      ),
                                    ),

                                    SizedBox(height: 8.h),
                                    Obx(() => controller.errorText.value != null
                                        ? Text(
                                      controller.errorText.value,
                                      style: TextStyle(color: Colors.red,fontSize:10.sp),
                                    )
                                        : Container(),
                                    ),
                                    Obx(() => Wrap(
                                      spacing: 8.0.w,
                                      children: controller.selectedDropdownItems.value.map((account) {
                                        return Chip(
                                          label: Text('${account.title}'),
                                          deleteIcon: Icon(
                                            Icons.close,
                                          ),
                                          onDeleted: () => controller.handleDelete(account),
                                        );
                                      }).toList(),
                                    )),
                                    SizedBox(height: 16.h),
                                    // Obx(() => Column(
                                    //       children: List.generate(
                                    //           controller.selectedDropdownItems
                                    //               .length, (index) {
                                    //         final item = controller
                                    //             .selectedDropdownItems[index];
                                    //         return ListTile(
                                    //           title: Text(item.value),
                                    //           onTap: () {},
                                    //         );
                                    //       }),
                                    //     )),
                                  ],
                                ),
                              ),

                              Padding(
                                  padding: EdgeInsets.only(top: 22.h),
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("lbl_bio".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiLight13Gray900),
                                        CustomTextFormField(
                                            validator: (value) {
                                              if (value == null) {
                                                return "Please enter valid text";
                                              }
                                              return null;
                                            },
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller:
                                            controller.bio,
                                            hintText: "msg_brief_intro_about".tr,
                                            margin: EdgeInsets.only(top: 7.h),
                                            // padding:
                                            // TextFormFieldPadding.PaddingT,
                                            textInputAction: TextInputAction.done,
                                            maxLines: 5
                                        )
                                      ])),
                              // other widgets
                              CustomButton(
                                  height: 50.h,
                                  text: "msg_save_and_continue".tr,
                                  margin: EdgeInsets.only(top: 22.h),
                                  padding: ButtonPadding.PaddingAll15,
                                  fontStyle: ButtonFontStyle.SatoshiBold14Gray100,
                                  onTap: onTapSaveand)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )));
  }

  onTapSaveand() {
    if (!_formKey.currentState!.validate()&&controller.selectedDropdownItems.isEmpty) {
      controller.errorText.value="Please select at least one niche";
      return;
    }
    else if(controller.selectedDropdownItems.isEmpty){
      controller.errorText.value="Please select at least one niche";
    }else if(!_formKey.currentState!.validate()){
      controller.errorText.value="";
      return;
    }
    else{
      controller.completeProfile();
    }
  }

  onTapArrowleft() {
    Get.back();
  }

}



//this better work


