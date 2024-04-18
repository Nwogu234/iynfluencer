import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/modals/hire_modal.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_button_one.dart';
import 'package:iynfluencer/widgets/custom_button_two.dart';
import '../influencer_profile_about_page/widgets/chipviewframe89_item_widget.dart';
import 'controller/influencer_profile_about_controller.dart';
import 'models/chipviewframe89_item_model.dart';
import 'models/influencer_profile_about_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class InfluencerProfileAboutPage extends StatelessWidget {
  InfluencerProfileAboutPage({required this.selectedInfluencer});

  final Influencer? selectedInfluencer;

   ChatData chatData = ChatData(
      id: 'id',
      creatorId: 'CreatorId',
      creatorUserId: 'CreatorUserId',
      influencerId: 'InfluencerId',
      influencerUserId: 'defaultInfluencerUserId',
      unreadByCreator: 0,
      unreadByInfluencer: 0,
      blockedByCreator: false,
      blockedByInfluencer: false,
      chatId: 'ChatId',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      messages: const []);

  InfluencerProfileAboutController controller = Get.put(
      InfluencerProfileAboutController(InfluencerProfileAboutModel().obs));

  @override
  Widget build(BuildContext context) {

     String? avatarUrl =
       "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${selectedInfluencer!.userId}-avatar.jpeg";
    String imageProvider;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

   return SafeArea(
    child: Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
              SizedBox(
                width: double.maxFinite,
                height: getVerticalSize(880),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                   Align(
                     alignment: Alignment.topCenter,
                       child: SizedBox(
                         height: getVerticalSize(170),
                         width: double.maxFinite,
                         child: Stack(
                           alignment: Alignment.topCenter,
                              children: [
                                 Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.cyan100
                                  ),
                                   height: getVerticalSize(170),
                                   width: getHorizontalSize(375),
                                   alignment: Alignment.center
                                   ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: CustomAppBar(
                                       height: getVerticalSize(44),
                                       leadingWidth: 45,
                                       leading: AppbarImage(
                                       height: getSize(30),
                                       width: getSize(30),
                                       svgPath: ImageConstant
                                                 .imgArrowleftGray200,
                                       margin: getMargin(left: 15),
                                        onTap: () {
                                        onTapArrowleft7();
                                         }),
                                     actions: [
                                       AppbarImage(
                                          height: getVerticalSize(26),
                                          width: getHorizontalSize(60),
                                          svgPath:ImageConstant.imgComputer,
                                          margin: getMargin(
                                                    left: 16,
                                                    right: 16,
                                                     bottom: 4
                                                     ),
                                          onTap: () {},
                                             )
                                            ]),
                                  ),
                      ]))),
                  Padding(
                    padding: EdgeInsets.only(left:25, bottom: 90),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Container(
                          decoration: BoxDecoration(
                                shape: BoxShape.circle
                              ),
                           child: CustomImageView(
                             url: imageProvider,
                            fit: BoxFit.cover,
                             height: getSize(85),
                             width: getSize(85),
                             radius: BorderRadius.circular(
                                  getSize(70)),
                             margin: getMargin(left: 5)
                           ),
                      ),
                     Padding(
                       padding: getPadding(top: 10),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Text(
                                    "${capitalizeFirstLetter(selectedInfluencer?.user?.first.firstName)} ${capitalizeFirstLetter(selectedInfluencer?.user?.first.lastName)}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16.copyWith(
                                fontSize: 24.sp
                              ),
                                   ),
                                   Padding(
                                      padding: getPadding(
                                        left: 2,
                                        top: 4
                                        ),
                                      child: Text(
                                              "${capitalizeFirstLetter(selectedInfluencer?.user?.first.country)}",
                                        overflow: TextOverflow.ellipsis,
                                       textAlign: TextAlign.left,
                                       style: AppStyle.txtSatoshiBold16.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal
                                       ),
                                          
                                          )),
                                           Padding(
                                             padding: getPadding(top: 5,left: 2),
                                             child: Row(
                                               children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top:2),
                                                  child: Text( 
                                                    "0 Avg Views".tr,
                                                    overflow: TextOverflow
                                                           .ellipsis,
                                                    textAlign:
                                                           TextAlign.left,
                                                    style: AppStyle.txtSatoshiBold16.copyWith(
                                                     fontSize: 14.sp,
                                                     fontWeight: FontWeight.normal
                                                                                                 ),
                                                  ),
                                                ),
                                        
                                                 Padding(
                                                   padding: getPadding(
                                                       left: 10,
                                                       top: 2
                                                       ),
                                                   child: Text(
                                                     "${selectedInfluencer?.jobsDone} jobs completed".tr,
                                                     overflow: TextOverflow
                                                         .ellipsis,
                                                     textAlign:
                                                         TextAlign.left,
                                                    style: AppStyle.txtSatoshiBold16.copyWith(
                                                     fontSize: 14.sp,
                                                     fontWeight: FontWeight.normal
                                               ),
                                                 )),
                                                 Padding(
                                                   padding: getPadding(
                                                       left: 10,
                                                       top: 2
                                                       ),
                                                   child: Text(
                                                     "0 Reviews".tr,
                                                     overflow: TextOverflow
                                                         .ellipsis,
                                                     textAlign:
                                                         TextAlign.left,
                                                    style: AppStyle.txtSatoshiBold16.copyWith(
                                                     fontSize: 14.sp,
                                                     fontWeight: FontWeight.normal
                                               ),
                                                 ))
                                        ])),
                                          Padding(
                                              padding:
                                                  getPadding(left: 2, top: 14),
                                              child: Row(
                                                children: [
                                                CustomButtonTwo(
                                                  height: getVerticalSize(34),
                                                  width: getHorizontalSize(101),
                                                  text: "Hire Now".tr,
                                                  padding:
                                                         ButtonPaddingz.PaddingAll4,
                                                  onTap: () =>
                                                     Get.bottomSheet(HireModal(
                                                         influencer:
                                                         selectedInfluencer!),
                                                  backgroundColor: ColorConstant.whiteA700
                                                  ),
                                                  fontStyle: ButtonFontStylez
                                                      .SatoshiBold15,
                                                ),
                                                CustomButton(
                                                  onTap: (){
                                                    Get.to(
                                                      ChatsOpenedScreen(
                                                        selectedInfluencer: selectedInfluencer!,
                                                        chatData: chatData,
                                                        )
                                                      );
                                                    },
                                                    height: getVerticalSize(34),
                                                    width:
                                                        getHorizontalSize(110),
                                                    text: "Message".tr,
                                                    margin: getMargin(left: 12),
                                                    variant: ButtonVariant
                                                        .FillGray200ab,
                                                    padding: ButtonPadding
                                                        .PaddingAll4,
                                                    fontStyle: ButtonFontStyle
                                                        .SatoshiBold15Gray900)
                                              ])),

                                           Padding(
                                             padding: const EdgeInsets.only(left:2, top:10),
                                             child: Text(
                                                   "lbl_about".tr,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: AppStyle.txtH2Gray600,
                                                 ),
                                           ),
                                    Padding(
                                      padding: getPadding(left:2),
                                      child: Container(
                                        width: getHorizontalSize(
                                          313,
                                        ),
                                        margin: getMargin(
                                        top: 7,
                                        ),
                                      child: Text(
                                        "${selectedInfluencer?.bio}",
                                       maxLines: null,
                                       textAlign: TextAlign.left,
                                       style: AppStyle.txtSatoshiBold16
                                           .copyWith(
                                       fontSize: 14.sp,
                                      fontWeight: FontWeight.w600)),
                                      ),
                                    ), 

                       Padding(
                          padding: getPadding(
                            left: 3,
                            top: 20,
                          ),
                          child: Text(
                            "Niche".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH2Gray600,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 2,
                            top: 10,
                          ),
                          child: Wrap(
                            runSpacing: getVerticalSize(
                              5,
                            ),
                            spacing: getHorizontalSize(
                              5,
                            ),
                            children: selectedInfluencer?.niche?.map((item) {
                                  return Chipviewframe89ItemWidget(
                                    Chipviewframe89ItemModel(
                                      chipviewframe89ModelObj: item,
                                    ),
                                  );
                                })?.toList() ??
                                [],
                          ),
                        ),   
                      ],
                    ),
                  ),
                  Padding(
                          padding: getPadding(
                            left: 3,
                            top: 20,
                          ),
                          child: Text(
                            "Social Media".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH2Gray600,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: getPadding(top:20, bottom: 5),
                            child: Row(
                               mainAxisAlignment:
                                                MainAxisAlignment.start,
                              children: <Widget>[
                                 CustomImageView(
                                   imagePath: ImageConstant.imgTiktok,
                                   height: getSize(28),
                                   width: getSize(28)),
                                 Padding(
                                   padding: getPadding(left: 20),
                                   child: CustomImageView(
                                     svgPath: ImageConstant.imgFacebook,
                                     height: getSize(28),
                                     width: getSize(28)),
                                 ),
                                 Padding(
                                   padding: getPadding(left: 20),
                                   child: CustomImageView(
                                     imagePath: ImageConstant.imgTwitter,
                                     height: getSize(22),
                                     width: getSize(22)),
                                 ),
                                 Padding(
                                   padding: getPadding(left: 20),
                                   child: CustomImageView(
                                     imagePath: ImageConstant.imgYoutube,
                                     height: getSize(32),
                                     width: getSize(32)),
                                 ),
                                 Padding(
                                   padding: getPadding(left: 20),
                                   child: CustomImageView(
                                     imagePath: ImageConstant.imgInstagram,
                                     height: getSize(22),
                                     width: getSize(22)),
                                 ),
                              ],
                            ),
                          ),
                        ),

                         Padding(
                          padding: getPadding(
                            left: 3,
                            top: 20,
                          ),
                          child: Text(
                            "Jobs Completed".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtH2Gray600,
                          ),
                        ),
                          Padding(
                            padding: getPadding(
                              top: 10,
                              left:3
                              ),
                             child: Text(
                                 "(${selectedInfluencer?.jobsDone})".tr,
                               overflow: TextOverflow .ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal
                             ),
                          )),
            ],
          )
        ),
           ])),
      ])))
  ));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft7() {
    Get.back();
  }

 /*  onTapChatCard(Influencer? selectedInfluencer) {
    Get.to(
      ChatsOpenedScreen(
        selectedInfluencer: selectedInfluencer,
      )
    );
  } */
}