import 'package:intl/intl.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chatbubble.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/datelable.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
export 'package:get/get.dart';
import 'controller/chats_opened_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatsOpenedScreen extends StatefulWidget {
  ChatsOpenedScreen({Key? key, this.selectedInfluencer, required this.chatData})
      : super(key: key);

  final Influencer? selectedInfluencer;
  // ChatData chatData;
  final ChatData chatData;

  @override
  State<ChatsOpenedScreen> createState() => _ChatsOpenedScreenState();
}

class _ChatsOpenedScreenState extends State<ChatsOpenedScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // ChatsOpenedController controller = Get.put(ChatsOpenedController());
  late AnimationController animationController;
  late String imageProvider;
  final UserController user = Get.find();
 // final String chatId = Get.parameters['id'] ?? '';

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    String? avatarUrl;
    if (widget.selectedInfluencer != null) {
      avatarUrl =
          "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.selectedInfluencer?.userId}-avatar.jpeg";
      // avatarUrl = 'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${widget.selectedInfluencer?.userId}-avatar.jpeg';
    } else if (widget.chatData != null) {
      avatarUrl =
          "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.chatData?.influencerUserId}-avatar.jpeg";
      // avatarUrl = 'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${widget.chatData?.influencerUserId}-avatar.jpeg';
    }

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    final scrollController = ScrollController();
    final String chatId = widget.chatData.chatId;

    return GetBuilder<ChatsOpenedController>(
        init: ChatsOpenedController(chatData: widget.chatData),
        builder: ((controller) {
          return SafeArea(
            child: Scaffold(
                key: _scaffoldKey,
                resizeToAvoidBottomInset: true,
                backgroundColor: ColorConstant.gray5001,
                appBar: CustomAppBar(
                    height: getVerticalSize(64),
                    leadingWidth: 52,
                    leading: AppbarImage(
                        height: getSize(30),
                        width: getSize(30),
                        svgPath: ImageConstant.imgArrowleftGray600,
                        margin:
                            getMargin(left: 10, top: 5, bottom: 20, right: 10),
                        onTap: () {
                          onTapArrowleft8();
                        }),
                    title: Padding(
                        padding: getPadding(left: 2, bottom: 2, top: 2),
                        child: Row(children: [
                          AppbarCircleimage(
                            url: imageProvider,
                            margin: getMargin(
                              left: 10,
                              top: 5,
                              bottom: 20,
                            ),
                          ),
                          AppbarSubtitle(
                            text:
                                "${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.firstName)} ${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.lastName)}"
                                    .tr,
                            margin: getMargin(left: 14, top: 5, bottom: 20),
                          )
                        ])),
                    actions: [
                      AppbarImage(
                        height: getSize(18),
                        width: getSize(18),
                        svgPath: ImageConstant.imgFrame18x18,
                        margin: getMargin(left: 23, right: 8, bottom: 10),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      AppbarImage(
                        height: getSize(20),
                        width: getSize(20),
                        svgPath: ImageConstant.imgFrame20x20,
                        margin: getMargin(left: 23, right: 22, bottom: 10),
                        onTap: () {
                          Get.back();
                        },
                      )
                    ],
                    styleType: Style.bgOutlineIndigo50_1),
                body: Obx(() {
                  if (controller.isLoading.value) {
                    return Stack(
                      children: [
                        PositionedDirectional(
                          top: 150,
                          start: 150,
                          child: CustomLoadingWidget(
                            animationController: animationController,
                          ),
                        ),
                      ],
                    );
                  } else if (controller.error.value.isNotEmpty) {
                    return ResponsiveErrorWidget(
                      errorMessage: controller.error.value,
                      onRetry: () {
                        controller.getUser(chatId);
                      },
                      fullPage: true,
                    );
                  } else {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Padding(
                            padding: getPadding(
                                left: 19, top: 5, right: 19, bottom: 10),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DateLable(
                                        dateTime: widget.chatData
                                            .createdAt /* ??
                                          DateTime.now(), */
                                        ),
                                    controller.messageModelObj.isEmpty
                                        ? SizedBox.shrink()
                                        : Expanded(
                                            child: ListView.builder(
                                                itemCount: controller
                                                    .messageModelObj.length,
                                                itemBuilder: (context, index) {
                                                  final message = controller
                                                      .messageModelObj[index];
                                                  String formattedDateTime =
                                                      DateFormat.jm('en_US')
                                                          .format(message
                                                              .createdAt);
                                                  return ChatMessageBubble(
                                                    messageText: message.text,
                                                    isReceived:
                                                        message.authorUserId !=
                                                            user
                                                                .userModelObj()
                                                                .userId,
                                                    timestamp:
                                                        formattedDateTime,
                                                    leadingImagePath:
                                                        ImageConstant
                                                            .imgTrashCyan300,
                                                    trailingImagePath:
                                                        ImageConstant.imgFrame2,
                                                  );
                                                }),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ChatInputBar(
                            messageController: controller.messageController,
                          ),
                        ),
                      ],
                    );
                  }
                })),
          );
        }));
  }

  onTapArrowleft8() {
    Get.back();
  }
}







/* import 'package:intl/intl.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chatbubble.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/datelable.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
export 'package:get/get.dart';
import 'controller/chats_opened_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatsOpenedScreen extends StatefulWidget {
  ChatsOpenedScreen({
    Key? key,
    this.selectedInfluencer,
    this.chatData,
  }) : super(key: key);

  final Influencer? selectedInfluencer;
  final ChatData? chatData;

  @override
  State<ChatsOpenedScreen> createState() => _ChatsOpenedScreenState();
}

class _ChatsOpenedScreenState extends State<ChatsOpenedScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ChatsOpenedController controller = Get.put(ChatsOpenedController());
  late AnimationController animationController;
  //String chatId = '';
  late String imageProvider;
  final UserController user = Get.find();
  String chatId = Get.parameters['id'] as String;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    String? avatarUrl;
    if (widget.selectedInfluencer != null) {
      avatarUrl =
          "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.selectedInfluencer?.userId}-avatar.jpeg";
    } else if (widget.chatData != null) {
      avatarUrl =
          "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.chatData?.influencerUserId}-avatar.jpeg";
    }

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorConstant.gray5001,
        appBar: CustomAppBar(
          height: getVerticalSize(64),
          leadingWidth: 52,
          leading: AppbarImage(
            height: getSize(30),
            width: getSize(30),
            svgPath: ImageConstant.imgArrowleftGray600,
            margin: getMargin(left: 10, top: 5, bottom: 20, right: 10),
            onTap: () => Get.back(),
          ),
          title: Padding(
            padding: getPadding(left: 2, bottom: 2, top: 2),
            child: Row(
              children: [
                AppbarCircleimage(
                  url: imageProvider,
                  margin: getMargin(left: 10, top: 5, bottom: 20),
                ),
                AppbarSubtitle(
                  text:
                      "${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.firstName)} ${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.lastName)}"
                          .tr,
                  margin: getMargin(left: 14, top: 5, bottom: 20),
                )
              ],
            ),
          ),
          actions: [
            AppbarImage(
              height: getSize(18),
              width: getSize(18),
              svgPath: ImageConstant.imgFrame18x18,
              margin: getMargin(left: 23, right: 8, bottom: 10),
              onTap: () => Get.back(),
            ),
            AppbarImage(
              height: getSize(20),
              width: getSize(20),
              svgPath: ImageConstant.imgFrame20x20,
              margin: getMargin(left: 23, right: 22, bottom: 10),
              onTap: () => Get.back(),
            )
          ],
          styleType: Style.bgOutlineIndigo50_1,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Stack(
              children: [
                PositionedDirectional(
                  top: 150,
                  start: 150,
                  child: CustomLoadingWidget(
                    animationController: animationController,
                  ),
                ),
              ],
            );
          } else if (controller.error.value.isNotEmpty) {
            return ResponsiveErrorWidget(
              errorMessage: controller.error.value,
              onRetry: () => controller.getUser(chatId),
              fullPage: true,
            );
          } else {
            return Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: getPadding(
                        left: 19, top: 5, right: 19, bottom: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DateLable(
                            dateTime: widget.chatData?.createdAt ??
                                DateTime.now(),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.messageModelObj.length,
                            itemBuilder: (context, index) {
                              final message =
                                  controller.messageModelObj[index];
                              final formattedDateTime =
                                  DateFormat.jm('en_US')
                                      .format(message.createdAt);
                              return ChatMessageBubble(
                                messageText: message.text,
                                isReceived: message.authorId !=
                                    user.userModelObj().userId,
                                timestamp: formattedDateTime,
                                leadingImagePath:
                                    ImageConstant.imgTrashCyan300,
                                trailingImagePath: ImageConstant.imgFrame2,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ChatInputBar(
                    messageController: controller.messageController,
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}

 */



