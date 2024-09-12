import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/data/models/messages/hive_message.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chatbubble.dart';
import 'package:iynfluencer/presentation/messages_page/controller/messages_controller.dart';
import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/presentation/messages_page/models/messages_model.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/datelable.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:swipe_to/swipe_to.dart';
export 'package:get/get.dart';
import 'controller/chats_opened_controller.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:timeago/timeago.dart' as timeago;

/* class ChatsOpenedScreen extends StatefulWidget {
  ChatsOpenedScreen({
    Key? key,
    this.selectedInfluencer,
    required this.chatData,
  }) : super(key: key);

  final Influencer? selectedInfluencer;
  // ChatData chatData;
  final ChatData chatData;
  Rx<Message?> replyMessage = Rx<Message?>(null);

  @override
  State<ChatsOpenedScreen> createState() => _ChatsOpenedScreenState();
}

class _ChatsOpenedScreenState extends State<ChatsOpenedScreen>
    with SingleTickerProviderStateMixin {
  final MessagesController messageController = Get.put(MessagesController());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // ChatsOpenedController controller = Get.put(ChatsOpenedController());
  late AnimationController animationController;
  late String imageProvider;
  late String titleName;
  final UserController user = Get.find();
  RxBool show = false.obs;
  FocusNode focusNode = FocusNode();
  late ChatsOpenedController controller;
  final scrollController = ScrollController();
  DateTime? lastDisplayedDate;

  String? capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    String? avatarUrl;
    if (widget.selectedInfluencer != null) {
       avatarUrl = widget.selectedInfluencer?.user?.first.avatar ?? '';
    //  avatarUrl =
      //    'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${widget.selectedInfluencer?.userId}-avatar.jpeg';
    } else if (widget.chatData != null) {
      avatarUrl = widget.chatData.influencerUser!.avatar;
      // avatarUrl = 'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${widget.chatData?.influencerUserId}-avatar.jpeg';
    }

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }

    String? name;
    if (widget.selectedInfluencer != null) {
       name =
         "${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.firstName)} ${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.lastName)}";
    } else if (widget.chatData != null) {
      name =
          "${capitalizeFirstLetter(widget.chatData.influencerUser?.firstName)} ${capitalizeFirstLetter(widget.chatData.influencerUser?.lastName)}";
    }

    if (name != null && name.isNotEmpty) {
      titleName = name;
    } else {
      imageProvider = "Mark Adebayo";
    }

    controller = Get.put(ChatsOpenedController(
      chatData: widget.chatData,
      selectedInfluencer: widget.selectedInfluencer,
    ));

    // controller.getUser(widget.chatData.chatId);
    controller.onInit();
  }

  Future<void> _refresh() async {
    await controller.refreshItems();
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    // controller.dispose();
    super.dispose();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    final String chatId = widget.chatData.chatId;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorConstant.gray5001,
        appBar: CustomAppBar(
          height: getVerticalSize(54),
          leadingWidth: 52,
          leading: AppbarImage(
            height: getSize(30),
            width: getSize(30),
            svgPath: ImageConstant.imgArrowleftGray600,
            margin: getMargin(left: 10, top: 5, bottom: 20, right: 10),
            onTap: () {
              onTapArrowleft8();
            },
          ),
          title: Padding(
            padding: getPadding(left: 2, top: 3),
            child: Row(
              children: [
                AppbarCircleimage(
                  url: imageProvider,
                  margin: getMargin(left: 10, top: 5, bottom: 20),
                ),
                AppbarSubtitle(
                  text: titleName.tr,
                  margin: getMargin(left: 14, top: 5, bottom: 20),
                ),
              ],
            ),
          ),
          styleType: Style.bgOutlineIndigo50_1,
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Obx(() {
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
              /*  return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: getPadding(left: 19, right: 19),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Expanded(
                        child: Obx(() {
                          return ListView.builder(
                            // key: PageStorageKey<String>('messagesList'),
                            controller: scrollController,
                            reverse: true,
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.messageModelObj.length,
                            itemBuilder: (context, index) {
                              final message = controller.messageModelObj[index];
                              String formattedDateTime = DateFormat.jm('en_US')
                                  .format(message.createdAt);
                              if (controller.messageModelObj.isEmpty) {
                                return SizedBox.shrink();
                              } // Check if the current message's date is the same as the date of the last displayed message
                              else if (lastDisplayedDate == null ||
                                  !isSameDay(
                                      lastDisplayedDate!, message.createdAt)) {
                                lastDisplayedDate = message.createdAt;
                                return Column(
                                  children: [
                                    SizedBox(height: 16),
                                    DateLable(
                                      dateTime: message.createdAt,
                                    ),
                                    ChatMessageBubble(
                                      controller: controller,
                                      messageText: message.text,
                                      isReceived: message.authorUserId !=
                                          widget.chatData.creatorUserId,
                                      timestamp: formattedDateTime,
                                      leadingImagePath: ImageConstant.imgVector,
                                      trailingImagePath:
                                          ImageConstant.imgVector,
                                      messageModelObj: message.messageId,
                                      onSwipedMessage: (message) {
                                        replyToMessage(message);
                                        focusNode.requestFocus();
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                // If it's the same date, only display the message bubble
                                return ChatMessageBubble(
                                  controller: controller,
                                  messageText: message.text,
                                  isReceived: message.authorUserId !=
                                      widget.chatData.creatorUserId,
                                  timestamp: formattedDateTime,
                                  leadingImagePath: ImageConstant.imgVector,
                                  trailingImagePath: ImageConstant.imgVector,
                                  messageModelObj: message.messageId,
                                  onSwipedMessage: (message) {
                                    replyToMessage(message);
                                    focusNode.requestFocus();
                                  },
                                );
                              }
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 10),
                      PopScope(
                        canPop: true,
                        onPopInvoked: (didPop) {
                          if (show.value) {
                            // if show is true
                            show.value = false;
                          } else {
                            Navigator.of(context);
                          }
                        },
                        child: SafeArea(
                          bottom: true,
                          top: false,
                          child: Column(
                            children: [
                              ChatInputBar(
                                messageModelObj: controller.messageModelObj,
                                replyMessage: widget.replyMessage,
                                onCancelReply: () {
                                  cancelReply();
                                },
                                focusNode: focusNode,
                                chatData: widget.chatData,
                                icon: Icons.emoji_emotions_outlined,
                                onPressed: () {
                                  controller.hideEmojiWidget();
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  show.value = !show.value;
                                },
                                messageController: controller.messageController,
                                openedController: controller,
                              ),
                              show.value
                                  ? emojiSelect(controller)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );  */
               return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: getPadding(left: 19, right: 19),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                        DateLable(
                         dateTime: widget.chatData.createdAt,
                        ),
                      SizedBox(height: 16),
                      Expanded(
                        child: Obx(() {
                          return ListView.builder(
                            //key: PageStorageKey<String>('messagesList'),
                            controller: scrollController,
                            reverse: true,
                            //  shrinkWrap: true,
                            //  physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.messageModelObj.length,
                            itemBuilder: (context, index) {
                              /*  final sortedMessages =
                                  controller.messageModelObj.reversed.toList();
                              final reversedIndex =
                                  controller.messageModelObj.length - 1 - index; */
                              final message = controller.messageModelObj[index];
                              String formattedDateTime = DateFormat.jm('en_US')
                                  .format(message.createdAt);
                              if (controller.messageModelObj.isEmpty) {
                                return SizedBox.shrink();
                              } //else{
                              return Column(
                                children: [
                                  ChatMessageBubble(
                                      controller: controller,
                                      messageText: message.text,
                                      isReceived: message.authorUserId !=
                                          widget.chatData.creatorUserId,
                                      timestamp: formattedDateTime,
                                      leadingImagePath: ImageConstant.imgVector,
                                      trailingImagePath:
                                          ImageConstant.imgVector,
                                      messageModelObj: message.messageId,
                                      onSwipedMessage: (message) {
                                        replyToMessage(message);
                                        focusNode.requestFocus();
                                      }),
                                ],
                              );
                              //     }
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 10),
                      PopScope(
                        canPop: true,
                        onPopInvoked: (didPop) {
                          if (show.value) {
                            // if show is true
                            show.value = false;
                          } else {
                            Navigator.of(context);
                          }
                        },
                        child: SafeArea(
                          bottom: true,
                          top: false,
                          child: Column(
                            children: [
                              ChatInputBar(
                                messageModelObj: controller.messageModelObj,
                                replyMessage: widget.replyMessage,
                                onCancelReply: () {
                                  cancelReply();
                                },
                                focusNode: focusNode,
                                chatData: widget.chatData,
                                icon: Icons.emoji_emotions_outlined,
                                onPressed: () {
                                  controller.hideEmojiWidget();
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  show.value = !show.value;
                                },
                                messageController: controller.messageController,
                                openedController: controller,
                              ),
                              show.value
                                  ? emojiSelect(controller)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ); 
            }
          }),
        ),
      ),
    );
  }

  Widget emojiSelect(ChatsOpenedController controller) {
    return EmojiPicker(
      config: const Config(
        bottomActionBarConfig: BottomActionBarConfig(
          showBackspaceButton: false,
          showSearchViewButton: false,
        ),
      ),
      onEmojiSelected: (category, emoji) {
        controller.messageController.text =
            controller.messageController.text + emoji.emoji;
      },
    );
  }

  void replyToMessage(Message message) {
    widget.replyMessage.value = message;
  }

  void cancelReply() {
    widget.replyMessage.value = null;
  }

  onTapArrowleft8() {
    messageController.getUser();
    messageController.setUnreadCreator(0);
    Get.back(result: true);
  }
}
 */

enum MessageStatus { sending, sent, failed }

class ChatsOpenedScreen extends StatefulWidget {
  ChatsOpenedScreen(
      {Key? key,
      this.selectedInfluencer,
      required this.chatData,
      this.selectedJob})
      : super(key: key);

  final Influencer? selectedInfluencer;
  // ChatData chatData;
  final ChatData chatData;
  final Job? selectedJob;
  Rx<Message?> replyMessage = Rx<Message?>(null);

  @override
  State<ChatsOpenedScreen> createState() => _ChatsOpenedScreenState();
}

class _ChatsOpenedScreenState extends State<ChatsOpenedScreen>
    with SingleTickerProviderStateMixin {
  final MessagesController messageController =
      Get.put(MessagesController(MessagesModel().obs));

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController animationController;
  late String imageProvider;
  late String titleName;
  final UserController user = Get.find();
  RxBool show = false.obs;
  FocusNode focusNode = FocusNode();
  late ChatsOpenedController controller;
  List<Widget> chatList = [];
  final ScrollController _scrollController = ScrollController();

  String? capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    String? avatarUrl;
    if (widget.selectedInfluencer != null) {
      avatarUrl = widget.selectedInfluencer?.user?.first.avatar ?? '';
      // avatarUrl =
      //     "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.selectedInfluencer?.userId}-avatar.jpeg";
    } else if (widget.chatData != null) {
      avatarUrl = widget.chatData.influencerUser!.avatar;
      //  avatarUrl =
      //     "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.chatData?.influencerUserId}-avatar.jpeg";
    }

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }

    String? name;
    if (widget.selectedInfluencer != null) {
      name =
          "${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.firstName)} ${capitalizeFirstLetter(widget.selectedInfluencer?.user?.first.lastName)}";
    } else if (widget.chatData != null) {
      name =
          "${capitalizeFirstLetter(widget.chatData.influencerUser?.firstName)} ${capitalizeFirstLetter(widget.chatData.influencerUser?.lastName)}";
    }

    if (name != null && name.isNotEmpty) {
      titleName = name;
    } else {
      titleName = "Mark Adebayo";
    }

    controller = ChatsOpenedController(
      chatData: widget.chatData,
      selectedInfluencer: widget.selectedInfluencer,
    );

    controller.onInit();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!controller.isLoading.value && controller.isLoadingMore.value) {
          controller.loadMessagesOrFetch(widget.chatData.chatId);
        }
      }
    });
  }

  Future<void> _refresh() async {
    await controller.refreshItems();
  }

  @override
  void dispose() {
    animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String chatId = widget.chatData.chatId;
    //  final Rx<MessageStatus> messageStatusRx = MessageStatus.sending.obs;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorConstant.gray5001,
        appBar: /* CustomAppBar(
          height: getVerticalSize(50),
          leadingWidth: 52,
          leading: AppbarImage(
            height: getSize(30),
            width: getSize(30),
            svgPath: ImageConstant.imgArrowleftGray600,
            margin: getMargin(left: 10, top: 5, bottom: 20, right: 10),
            onTap: () {
              onTapArrowleft8(widget.chatData);
            },
          ),
          title: Padding(
            padding: getPadding(left: 2, top: 3),
            child: Row(
              children: [
                AppbarCircleimage(
                  url: imageProvider,
                  margin: getMargin(left: 10, top: 15, bottom: 20),
                ),
                AppbarSubtitle(
                  text: titleName.tr,
                  margin: getMargin(left: 14, top: 5, bottom: 20),
                ),
              ],
            ),
          ),
          styleType: Style.bgOutlineIndigo50_1,
        ), */

        CustomAppBar(
          centerTitle: true,
          height: getVerticalSize(50),
          leadingWidth: 52,
          leading: AppbarImage(
            height: getSize(30),
            width: getSize(30),
            svgPath: ImageConstant.imgArrowleftGray600,
            margin: getMargin(left: 10, top: 10, bottom: 15, right: 10),
            onTap: () {
              onTapArrowleft8(widget.chatData);
            },
          ),
          title: Padding(
            padding: getPadding(left: 2, top: 3),
            child: AppbarSubtitle(
              text: titleName.tr,
              margin: getMargin( //left: 14,
               top: 5,
               bottom: 10,
               right:10
               ),
            ),
          ),

          actions: [
             AppbarCircleimage(
                  url: imageProvider,
                 margin: getMargin( 
                  right: 10,
                  bottom: 5
                 )
                  //left: 10,
                 //  top: 15, bottom: 20),
                ),
          ],
          styleType: Style.bgOutlineIndigo50_1,
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Obx(() {
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
              Map<String, List<Message>> groupedMessages =
                  controller.groupMessagesByDate(controller.messageModelObj);
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: getPadding(left: 19, right: 19),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          //  controller: _scrollController,
                          reverse: controller.isReverse.value,
                          itemCount: groupedMessages.length,
                          itemBuilder: (context, index) {
                            String date = groupedMessages.keys.elementAt(index);
                            List<Message> messages = groupedMessages[date]!;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                messages.isNotEmpty
                                    ? DateLable(
                                        dateTime: DateTime.parse(date),
                                      )
                                    : DateLable(
                                        dateTime: widget.chatData.createdAt,
                                      ),
                                ListView.builder(
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  reverse: controller.isReverse.value,
                                  itemCount: messages.length,
                                  itemBuilder: (context, subIndex) {
                                    final message = messages[subIndex];
                                    Rx<MessageStatus> messageStatusRx =
                                        controller
                                            .intToMessageStatus(
                                                message.status ?? 0)
                                            .obs;
                                    String formattedDateTime =
                                        DateFormat.jm('en_US')
                                            .format(message.createdAt);
                                    return ChatMessageBubble(
                                      isCompleteMessage:
                                          message.isCompleteMessage ?? false,
                                      controller: controller,
                                      messageText: message.text,
                                      isReceived: message.authorUserId !=
                                          widget.chatData.creatorUserId,
                                      timestamp: formattedDateTime,
                                      leadingImagePath: ImageConstant.imgVector,
                                      trailingImagePath:
                                          ImageConstant.imgVector,
                                      messageModelObj: message.messageId,
                                      onSwipedMessage: (messages) {
                                        replyToMessage(message);
                                        focusNode.requestFocus();
                                      },
                                      messageStatus: messageStatusRx,
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      PopScope(
                        canPop: true,
                        onPopInvoked: (didPop) {
                          if (show.value) {
                            show.value = false;
                          } else {
                            Navigator.of(context);
                          }
                        },
                        child: SafeArea(
                          bottom: true,
                          top: false,
                          child: Column(
                            children: [
                              ChatInputBar(
                                replyMessage: widget.replyMessage,
                                onCancelReply: () {
                                  cancelReply();
                                },
                                focusNode: focusNode,
                                chatData: widget.chatData,
                                icon: Icons.emoji_emotions_outlined,
                                onPressed: () {
                                  controller.hideEmojiWidget();
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  show.value = !show.value;
                                },
                                messageController: controller.messageController,
                                openedController: controller,
                              ),
                              show.value
                                  ? emojiSelect(controller)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  Widget emojiSelect(ChatsOpenedController controller) {
    return EmojiPicker(
      config: const Config(
        bottomActionBarConfig: BottomActionBarConfig(
          showBackspaceButton: false,
          showSearchViewButton: false,
        ),
      ),
      onEmojiSelected: (category, emoji) {
        controller.messageController.text =
            controller.messageController.text + emoji.emoji;
      },
    );
  }

  void replyToMessage(Message messages) {
    widget.replyMessage.value = messages;
  }

  void cancelReply() {
    widget.replyMessage.value = null;
  }

  onTapArrowleft8(ChatData chatData) async {
    messageController.onInit();
    messageController.setUnreadCreator(0);
    Get.back(result: true);
  }
}
