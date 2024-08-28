import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/controller/chats_influencer_controller.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/widgets/chatbubblez.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/widgets/chats_inputz.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chatbubble.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/controller/messages_page_influencer_controller.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/messages_page_influencer_page.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/models/messages_page_influencer_model.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/datelable.dart';
import 'package:iynfluencer/widgets/error_widget.dart';

/* 
class ChatsInfluencerScreen extends StatefulWidget {
  ChatsInfluencerScreen({Key? key, this.selectedJob, required this.chatData})
      : super(key: key);

  final Job? selectedJob;
  final ChatData chatData;

  Rx<Message?> replyMessages = Rx<Message?>(null);

  @override
  State<ChatsInfluencerScreen> createState() => _ChatsInfluencerScreenState();
}

class _ChatsInfluencerScreenState extends State<ChatsInfluencerScreen>
    with SingleTickerProviderStateMixin {
  MessagesPageInfluencerController messageInfluencerController = Get.put(
      MessagesPageInfluencerController(MessagesPageInfluencerModel().obs));

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController animationController;
  late String imageProvider;
  late String titleName;
  final UserController user = Get.find();
  RxBool show = false.obs;
  FocusNode focusNode = FocusNode();
  late ChatsInfluencerController controllers;
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
    if (widget.selectedJob != null) {
      avatarUrl =
          "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.selectedJob?.creator?.userId}-avatar.jpeg";
      // avatarUrl = 'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${widget.selectedInfluencer?.userId}-avatar.jpeg';
    } else if (widget.chatData != null) {
      avatarUrl =
          "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${widget.chatData.influencerUserId}-avatar.jpeg";
      // avatarUrl = 'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${widget.chatData?.influencerUserId}-avatar.jpeg';
    }

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }

    String? name;
    if (widget.selectedJob != null) {
      name =
          "${widget.selectedJob?.creator?.userId}"; /* ${capitalizeFirstLetter(widget.selectedJob?.creator?.userId)}"; */
    } else if (widget.chatData != null) {
      name =
          "${capitalizeFirstLetter(widget.chatData.creatorUser?.firstName)} ${capitalizeFirstLetter(widget.chatData.creatorUser?.lastName)}";
    }

    if (name != null && name.isNotEmpty) {
      titleName = name;
    } else {
      imageProvider = "Mark Adebayo";
    }

    controllers = ChatsInfluencerController(
        chatData: widget.chatData, selectedJob: widget.selectedJob);

    // controllers.getUser(widget.chatData.chatId);
    controllers.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
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
            padding: getPadding(left: 2, bottom: 2, top: 2),
            child: Row(
              children: [
                AppbarCircleimage(
                  url: imageProvider,
                  margin: getMargin(left: 10, top: 5, bottom: 20),
                ),
                AppbarSubtitle(
                  text: titleName.tr,
                  margin: getMargin(left: 14, top: 5, bottom: 20),
                )
              ],
            ),
          ),
          styleType: Style.bgOutlineIndigo50_1,
        ),
        body: RefreshIndicator(
          onRefresh: controllers.refreshItems,
          child: Obx(() {
            if (controllers.isLoading.value) {
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
            } else if (controllers.error.value.isNotEmpty) {
              return ResponsiveErrorWidget(
                errorMessage: controllers.error.value,
                onRetry: () {
                  controllers.getUser(chatId);
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
                      //  SizedBox(height: 16), Adjust spacing
                      /*  SizedBox(height: 16),
                      DateLable(
                        dateTime: widget.chatData.createdAt,
                      ), */
                      SizedBox(height: 16),
                      Expanded(
                        child: Obx(() {
                        return ListView.builder(
                            controller: scrollController,
                            reverse: true,
                            itemCount: controllers.messageModelObjs.length,
                            itemBuilder: (context, index) {
                              final message =
                                  controllers.messageModelObjs[index];
                              String formattedDateTime = DateFormat.jm('en_US')
                                  .format(message.createdAt);
                              if (controllers.messageModelObjs.isEmpty) {
                                return SizedBox.shrink();
                              } else if (lastDisplayedDate == null ||
                                  !isSameDay(
                                      lastDisplayedDate!, message.createdAt)) {
                                lastDisplayedDate = message.createdAt;
                                return Column(
                                  children: [
                                    SizedBox(height: 16),
                                    DateLable(
                                      dateTime: message.createdAt,
                                    ),
                                    ChatMessageBubblez(
                                        controller: controllers,
                                        messageText: message.text,
                                        isReceived: message.authorUserId !=
                                            widget.chatData.influencerUserId,
                                        timestamp: formattedDateTime,
                                        leadingImagePath:
                                            ImageConstant.imgVector,
                                        trailingImagePath:
                                            ImageConstant.imgVector,
                                        messageModelObjs: message.messageId,
                                        onSwipedMessage: (message) {
                                          replyToMessage(message);
                                          focusNode.requestFocus();
                                        }),
                                  ],
                                );
                              } else {
                                return ChatMessageBubblez(
                                    controller: controllers,
                                    messageText: message.text,
                                    isReceived: message.authorUserId !=
                                        widget.chatData.influencerUserId,
                                    timestamp: formattedDateTime,
                                    leadingImagePath: ImageConstant.imgVector,
                                    trailingImagePath: ImageConstant.imgVector,
                                    messageModelObjs: message.messageId,
                                    onSwipedMessage: (message) {
                                      replyToMessage(message);
                                      focusNode.requestFocus();
                                    });
                              }
                            });
                      })),
                      SizedBox(height: 10), // Adjust spacing
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
                              ChatInputsBar(
                                replyMessages: widget.replyMessages,
                                onCancelReply: () {
                                  cancelReply();
                                },
                                focusNode: focusNode,
                                chatData: widget.chatData,
                                icon: Icons.emoji_emotions_outlined,
                                onPressed: () {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  show.value = !show.value;
                                },
                                messageController:
                                    controllers.messageController,
                                closedController: controllers,
                              ),
                              show.value
                                  ? emojiSelect(controllers)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ); */

              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: getPadding(left: 19, right: 19),
                  child: Column(
                    children: [
                      //  SizedBox(height: 16), Adjust spacing
                      SizedBox(height: 16),
                      DateLable(
                        dateTime: widget.chatData.createdAt,
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          reverse: true,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controllers.messageModelObjs.length,
                          itemBuilder: (context, index) {
                            final sortedMessages =
                                controllers.messageModelObjs.reversed.toList();
                            final reversedIndex =
                                controllers.messageModelObjs.length - 1 - index;
                            final message = sortedMessages[reversedIndex];
                            String formattedDateTime = DateFormat.jm('en_US')
                                .format(message.createdAt);
                            if (index == sortedMessages.length) {
                              return Container(
                                height: 70,
                              );
                            } else if (sortedMessages.isEmpty) {
                              return SizedBox.shrink();
                            }
                            return ChatMessageBubblez(
                                controller: controllers,
                                messageText: message.text,
                                isReceived: message.authorUserId !=
                                    widget.chatData.creatorUserId,
                                timestamp: formattedDateTime,
                                leadingImagePath: ImageConstant.imgVector,
                                trailingImagePath: ImageConstant.imgVector,
                                messageModelObjs: message.messageId,
                                onSwipedMessage: (message) {
                                  replyToMessage(message);
                                  focusNode.requestFocus();
                                });
                          },
                        ),
                      ),
                      SizedBox(height: 10), // Adjust spacing
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
                              ChatInputsBar(
                                replyMessages: widget.replyMessages,
                                onCancelReply: () {
                                  cancelReply();
                                },
                                focusNode: focusNode,
                                chatData: widget.chatData,
                                icon: Icons.emoji_emotions_outlined,
                                onPressed: () {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  show.value = !show.value;
                                },
                                messageController: controllers.messageController,
                                closedController: controllers,
                              ),
                              show.value
                                  ? emojiSelect(controllers)
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

  Widget emojiSelect(ChatsInfluencerController controller) {
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
    widget.replyMessages.value = message;
  }

  void cancelReply() {
    widget.replyMessages.value = null;
  }

  onTapArrowleft8() {
    messageInfluencerController.getUser();
    messageInfluencerController.setUnreadInfluencer(0);
    Get.back(result: true);
  }
}
 */

class ChatsInfluencerScreen extends StatefulWidget {
  ChatsInfluencerScreen({Key? key, this.selectedJob, required this.chatData, this.query})
      : super(key: key);

  final Job? selectedJob;
  final ChatData chatData;
  final String? query;

  Rx<Message?> replyMessages = Rx<Message?>(null);

  @override
  State<ChatsInfluencerScreen> createState() => _ChatsInfluencerScreenState();
}

class _ChatsInfluencerScreenState extends State<ChatsInfluencerScreen>
    with SingleTickerProviderStateMixin {
  MessagesPageInfluencerController messageInfluencerController = Get.put(
      MessagesPageInfluencerController(MessagesPageInfluencerModel().obs));

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController animationController;
  late String imageProvider;
  late String titleName;
  final UserController user = Get.find();
  RxBool show = false.obs;
  FocusNode focusNode = FocusNode();
  late ChatsInfluencerController controllers;

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
    if (widget.selectedJob != null) {
      avatarUrl =  widget.selectedJob?.creator?.first.user?.avatar ?? '';
      //print(avatarUrl);
      //  avatarUrl =
      //     'https://res.cloudinary.com/djiuzlqfn/image/upload/v1714592279/m7qg5kq7l2zi0ujpwmfc.jpg';
    } else if (widget.chatData != null) {
      avatarUrl = widget.chatData.creatorUser!.avatar;
      // avatarUrl = 'https://iynf-kong-akbf9.ondigitalocean.app/users/avatars/user-${widget.chatData?.influencerUserId}-avatar.jpeg';
    }

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }

    String? name;
    if (widget.selectedJob != null) {
      name =
          "${capitalizeFirstLetter( widget.selectedJob?.creator?.first.user?.firstName ?? 'Mark')}  ${capitalizeFirstLetter(widget.selectedJob?.creator?.first.user?.lastName ?? 'Adebayo')}";
      // print(name);
      //  name = 'Mark Adebayo';
    } else if (widget.chatData != null) {
      name =
          "${capitalizeFirstLetter(widget.chatData.creatorUser?.firstName)} ${capitalizeFirstLetter(widget.chatData.creatorUser?.lastName)}";
    }

    if (name != null && name.isNotEmpty) {
      titleName = name;
    } else {
      titleName = "Mark Adebayo";
    }

    controllers = ChatsInfluencerController(
        chatData: widget.chatData, 
        selectedJob: widget.selectedJob,
         query: widget.query
        );

    // controllers.getUser(widget.chatData.chatId);
    controllers.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
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
          onRefresh: controllers.refreshItems,
          child: Obx(() {
            if (controllers.isLoading.value) {
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
            } else if (controllers.error.value.isNotEmpty) {
              return ResponsiveErrorWidget(
                errorMessage: controllers.error.value,
                onRetry: () {
                  controllers.getUser(chatId);
                },
                fullPage: true,
              );
            } else {
              /*              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: getPadding(left: 19, right: 19),
                  child: Column(
                    children: [
                      //  SizedBox(height: 16), Adjust spacing
                      SizedBox(height: 16),
                      DateLable(
                        dateTime: widget.chatData.createdAt,
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          reverse: true,
                          itemCount: controllers.messageModelObjs.length,
                          itemBuilder: (context, index) {
                            final message = controllers.messageModelObjs[index];
                            String formattedDateTime = DateFormat.jm('en_US')
                                .format(message.createdAt);
                            if (controllers.messageModelObjs.isEmpty) {
                              return SizedBox.shrink();
                            }
                            return ChatMessageBubblez(
                                controller: controllers,
                                messageText: message.text,
                                isReceived: message.authorUserId !=
                                    widget.chatData.influencerUserId,
                                timestamp: formattedDateTime,
                                leadingImagePath: ImageConstant.imgVector,
                                trailingImagePath: ImageConstant.imgVector,
                                messageModelObjs: message.messageId,
                                onSwipedMessage: (message) {
                                  replyToMessage(message);
                                  focusNode.requestFocus();
                                });
                          },
                        ),
                      ),
                      SizedBox(height: 10), // Adjust spacing
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
                              ChatInputsBar(
                                replyMessages: widget.replyMessages,
                                onCancelReply: () {
                                  cancelReply();
                                },
                                focusNode: focusNode,
                                chatData: widget.chatData,
                                icon: Icons.emoji_emotions_outlined,
                                onPressed: () {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  show.value = !show.value;
                                },
                                messageController:
                                    controllers.messageController,
                                closedController: controllers,
                              ),
                              show.value
                                  ? emojiSelect(controllers)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ); */

              Map<String, List<Message>> groupedMessages =
                  controllers.groupMessagesByDate(controllers.messageModelObjs);
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: getPadding(left: 19, right: 19),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          reverse: true,
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
                                SizedBox(height: 16),
                                ListView.builder(
                                  controller: scrollController,
                                  reverse: true,
                                  shrinkWrap: true,
                                  itemCount: messages.length,
                                  itemBuilder: (context, subIndex) {
                                    final message = messages[subIndex];
                                    String formattedDateTime =
                                        DateFormat.jm('en_US')
                                            .format(message.createdAt);
                                    if (messages.isEmpty) {
                                      return SizedBox.shrink();
                                    }
                                    return ChatMessageBubblez(
                                        controller: controllers,
                                        messageText: message.text,
                                        isReceived: message.authorUserId !=
                                            widget.chatData.influencerUserId,
                                        timestamp: formattedDateTime,
                                        leadingImagePath:
                                            ImageConstant.imgVector,
                                        trailingImagePath:
                                            ImageConstant.imgVector,
                                        messageModelObjs: message.messageId,
                                        onSwipedMessage: (message) {
                                          replyToMessage(message);
                                          focusNode.requestFocus();
                                        });
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
                              ChatInputsBar(
                                replyMessages: widget.replyMessages,
                                onCancelReply: () {
                                  cancelReply();
                                },
                                focusNode: focusNode,
                                chatData: widget.chatData,
                                icon: Icons.emoji_emotions_outlined,
                                onPressed: () {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  show.value = !show.value;
                                },
                                messageController: widget.query != null
                               //  ? controllers.queryController  :      
                                ? TextEditingController(text: widget.query) :
                                   controllers.messageController,
                                closedController: controllers,
                                query: widget.query,
                              ),
                              show.value
                                  ? emojiSelect(controllers)
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

  Widget emojiSelect(ChatsInfluencerController controller) {
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
    widget.replyMessages.value = message;
  }

  void cancelReply() {
    widget.replyMessages.value = null;
  }

  onTapArrowleft8() {
    messageInfluencerController.onInit();
    messageInfluencerController.setUnreadInfluencer(0);
    Get.back(result: true);
  }
}
