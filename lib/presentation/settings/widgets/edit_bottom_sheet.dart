import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/controller/influencer_profile_comm_post_hire_modal_controller.dart';
import 'package:iynfluencer/presentation/post_page_screen/post_page_screen.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/skeletons.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../data/apiClient/api_client.dart';
import '../../../widgets/custom_text_form_field.dart';

class EditUser extends StatelessWidget {
  UserController user;
  final EditUserController userController = Get.put(EditUserController());

  EditUser({Key? key, required this.user}) : super(key: key);
  final InfluencerProfileCommHireModalContainerController _controller =
      Get.put(InfluencerProfileCommHireModalContainerController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Update Account Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  fontStyle: TextFormFieldFontStyle.SatoshiBold10,
                  shape: TextFormFieldShape.CircleBorder10,
                  variant: TextFormFieldVariant.None,
                  focusNode: FocusNode(),
                  hintText: 'Username',
                  label: 'Username',
                  autofocus: false,
                  controller: userController.firstNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  textInputType: TextInputType.number,
                  controller: userController.phoneNumberController,
                  label: 'Phone Number',
                  fontStyle: TextFormFieldFontStyle.SatoshiBold10,
                  shape: TextFormFieldShape.CircleBorder10,
                  variant: TextFormFieldVariant.None,
                  focusNode: FocusNode(),
                  autofocus: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => TextFormField(
                    focusNode: FocusNode(),
                    autofocus: false,
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        userController.updateDateFieldValue(selectedDate);
                      }
                      // Handle the case when the user cancels the date picker
                    },
                    controller: TextEditingController(
                        text: userController.dateFieldValue.value),
                    style: TextStyle(
                      color: ColorConstant.gray900,
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            10.00,
                          ),
                        ),
                        borderSide: BorderSide(
                            width: 1.0, color: Colors.lightBlue.shade50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            10.00,
                          ),
                        ),
                        borderSide: BorderSide(
                            width: 1.0, color: Colors.lightBlue.shade50),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            10.00,
                          ),
                        ),
                        borderSide: BorderSide(
                            width: 1.0, color: Colors.lightBlue.shade50),
                      ),
                      label: Text("Date of Birth"),
                      isDense: true,
                      floatingLabelStyle: TextStyle(color: Colors.black,fontSize: 13),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            10.00,
                          ),
                        ),
                        borderSide: BorderSide(
                            width: 1.0, color: Colors.lightBlue.shade50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1.0,
                        color: Colors.lightBlue.shade50,
                      ),
                      right: BorderSide(
                        width: 1.0,
                        color: Colors.lightBlue.shade50,
                      ),
                      bottom: BorderSide(
                        width: 1.0,
                        color: Colors.lightBlue.shade50,
                      ),
                      left: BorderSide(
                        width: 1.0,
                        color: Colors.lightBlue.shade50,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(10.0),
                    ),
                  ),
                  child: CountryCodePicker(
                    onChanged: (value){
                      userController.country.value=value.name!;
                      print(value.name);
                    },
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: '${userController.user.userModelObj.value.countryCode}',
                    favorite: ['+39','FR'],
                    // optional. Shows only country name and flag
                    showCountryOnly: true,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: true,
                    // optional. aligns the flag and the Text left
                    alignLeft: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: userController.saveChanges,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class ModalWithPageView extends StatelessWidget {
//   const ModalWithPageView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         appBar:
//             AppBar(leading: Container(), title: Text('Modal With Page View')),
//         body: SafeArea(
//           bottom: false,
//           child: PageView(
//             children: List.generate(
//                 2,
//                 (index) => ListView(
//                       shrinkWrap: true,
//                       controller: ModalScrollController.of(context),
//                       children: ListTile.divideTiles(
//                         context: context,
//                         tiles: List.generate(
//                             3,
//                             (index) => ListTile(
//                                   title: Text('Item'),
//                                 )),
//                       ).toList(),
//                     )),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SimpleModal extends StatelessWidget {
//   const SimpleModal({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         child: CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//           leading: Container(), middle: Text('Modal Page')),
//       child: Center(),
//     ));
//   }
// }

class EditUserController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final RxString dateFieldValue = ''.obs;
  RxString country = ''.obs;
  final apiClient = ApiClient();
  final UserController user = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    // Initialize the text field values
    firstNameController.text = user.userModelObj.value.firstName;
    emailController.text = user.userModelObj.value.email;
    phoneNumberController.text = user.userModelObj.value.creatorId!;
    country.value = user.userModelObj.value.country!;
    dateFieldValue.value = ''; // Set initial value for date field
  }

  void updateDateFieldValue(DateTime selectedDate) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    dateFieldValue.value = formattedDate;
  }

  void saveChanges() async{
    var update = UpdateUser(
      country: country.value,
      dob: dateFieldValue.value,
      userName: firstNameController.text,
      phoneNumber: phoneNumberController.text,
    );
    Response response = await apiClient.updateUser(update, user.token);
    if(response.isOk){
      Get.back();
      user.getUser();
      Get.snackbar('Success', 'Update successful');
    }
    else{
      user.getUser();
      Get.snackbar('Update Failed', 'Try again');
    }
    // Perform save logic here

  }

  @override
  void onClose() {
    // Clean up resources
    firstNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
