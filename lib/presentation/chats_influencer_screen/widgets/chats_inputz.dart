import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/controller/chats_influencer_controller.dart';
import 'package:iynfluencer/widgets/reply_message_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/camera_screen/camera_scree.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';
/* 
class ChatInputsBar extends StatefulWidget {
  final TextEditingController messageController;
  IconData? icon;
  VoidCallback? onPressed;
  final ChatData chatData;
  final FocusNode focusNode;
  Rx<Message?> replyMessages = Rx<Message?>(null);
  final VoidCallback onCancelReply;
  final ChatsInfluencerController closedController;

  ChatInputsBar(
      {required this.messageController,
      this.icon,
      this.onPressed,
      required this.chatData,
      required this.focusNode,
      required this.replyMessages,
      required this.onCancelReply,
      required this.closedController
      // this.controller,
      });

  @override
  State<ChatInputsBar> createState() => _ChatInputsBarState();
}

class _ChatInputsBarState extends State<ChatInputsBar> {
  int popTime = 0;
  var sendButton = false.obs;
  late ChatsInputsController controllers;

  @override
  void initState() {
    super.initState();
    controllers = ChatsInputsController(
        chatData: widget.chatData,
        messageController: widget.messageController,
        focusNode: widget.focusNode,
        onCancelReply: widget.onCancelReply,
        closedController: widget.closedController);
  }

  @override
  Widget build(BuildContext context) {
    final isReplying = widget.replyMessages != null;
    return SafeArea(
      child: Container(
        height: getVerticalSize(58),
        margin: getMargin(right: 10),
        decoration: AppDecoration.outlineIndigo505,
        child: Row(
          children: [
            if (isReplying && widget.replyMessages.value != null)
              BuildReply(
                replyMessage: widget.replyMessages.value!,
                onCancelReply: widget.onCancelReply,
              ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                right: BorderSide(
                  width: 1,
                  color: ColorConstant.gray600Ab,
                ),
              )),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                ),
                child: IconButton(
                  icon: Icon(
                    widget.icon,
                    size: 30,
                  ),
                  onPressed: widget.onPressed,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 6),
                child: Center(
                  child: CustomTextFormField(
                    width: getHorizontalSize(334),
                    focusNode: widget.focusNode,
                    autofocus: true,
                    onChanged: (value) {
                      sendButton.value = value.isNotEmpty;
                    },
                    hintText: "lbl_write_a_message".tr,
                    onSubmitted: (_) => controllers.sendMessage(
                        context, controllers.messageController.text),
                    padding: TextFormFieldPadding.PaddingT11,
                    fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                    textInputAction: TextInputAction.done,
                    controller: controllers.messageController,
                    alignment: Alignment.center,
                    suffix: Obx(() {
                      return Container(
                        // margin: getMargin(left: 30, top: 10, right: 16, bottom: 10),
                        child: IconButton(
                          onPressed: sendButton.value
                              ? () async {
                                  await controllers.sendMessage(context,
                                      controllers.messageController.text);
                                }
                              : null,
                          icon: sendButton.value
                              ? Icon(
                                  Icons.send,
                                  color: ColorConstant.black900,
                                  size: 24.0,
                                )
                              : CustomImageView(
                                  onTap: () {
                                    popTime = 3;
                                    Get.to(CameraScreen());
                                  },
                                  height: 24,
                                  width: 24,
                                  svgPath: ImageConstant.imgCamera,
                                  // Add any other necessary properties and styling for CustomImageView
                                ),
                        ),
                      );
                    }),
                    suffixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(42)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatsInputsController extends GetxController {
  final ChatData chatData;
  final TextEditingController messageController;
  final FocusNode focusNode;
  final VoidCallback onCancelReply;
  final ChatsInfluencerController closedController;

  ChatsInputsController(
      {required this.chatData,
      required this.messageController,
      required this.focusNode,
      required this.onCancelReply,
      required this.closedController});

  RxList<Message> messageModelObjs = <Message>[].obs;
  var message = "".obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final storage = FlutterSecureStorage();
  final ScrollController _scrollController = ScrollController();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;

  @override
  void onInit() {
    super.onInit();

    socketClient.connect();

    socketClient.socket.on('receive_message', (data) {
      messageModelObjs.add(data);
      update();
    });

    socketClient.socket.on('error', (errorData) {
      print('Socket Error: $errorData');
    });
    scrollToBottom();
  }

  Future<void> sendMessage(BuildContext context, String messageText) async {
    FocusScope.of(context).unfocus();
    onCancelReply();
    try {
      messageText = messageText.trim();

      final now = DateTime.now();
      final formattedTime = DateFormat('HH:mm').format(now);
      final createdAt = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(formattedTime.substring(0, 2)),
        int.parse(formattedTime.substring(3)),
        0,
      );

      final messageId = Uuid().v4();

      final newMessage = Message(
        id: chatData.id,
        chatId: chatData.chatId,
        authorId: chatData.influencerId,
        text: messageText,
        authorUserId: chatData.influencerUserId,
        blockedByRecipient: chatData.blockedByCreator,
        messageId: messageId,
        createdAt: createdAt,
        updatedAt: createdAt,
      );

      final token = await storage.read(key: "token");

      if (token == null) {
        print("Authorization token is not available");
        return;
      }
      final response = await apiClient.sendMessage(newMessage, token);

      if (response.isOk) {
         UpdateList(newMessage);
        print('Message sent and stored successfully');
      //  messageModelObjs.add(newMessage);

        update();

        messageController.clear();

        if (_scrollController.hasClients) {
          scrollToBottom();
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              scrollToBottom();
            }
          });
        }
      } else {
        print('Failed to send message: ${response.statusText}');
        print('Sent Message: $messageText');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }


  
  void UpdateList(Message message) {
    messageModelObjs.insert(0, message);
    update();
  }


  

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void onClose() {
    _scrollController.dispose();
    socketClient.disconnect();
    super.onClose();
  }
}
 */

class ChatInputsBar extends StatefulWidget {
  final TextEditingController messageController;
  IconData? icon;
  VoidCallback? onPressed;
  final ChatData chatData;
  final FocusNode focusNode;
  Rx<Message?> replyMessages = Rx<Message?>(null);
  final VoidCallback onCancelReply;
  final ChatsInfluencerController closedController;

  ChatInputsBar(
      {required this.messageController,
      this.icon,
      this.onPressed,
      required this.chatData,
      required this.focusNode,
      required this.replyMessages,
      required this.onCancelReply,
      required this.closedController
      // this.controller,
      });

  @override
  State<ChatInputsBar> createState() => _ChatInputsBarState();
}

class _ChatInputsBarState extends State<ChatInputsBar> {
  int popTime = 0;
  var sendButton = false.obs;
  late ChatsInputsController controllers;

  @override
  void initState() {
    super.initState();
    controllers = ChatsInputsController(
        chatData: widget.chatData,
        messageController: widget.messageController,
        focusNode: widget.focusNode,
        onCancelReply: widget.onCancelReply,
        closedController: widget.closedController);
  }

  @override
  Widget build(BuildContext context) {
    final isReplying = widget.replyMessages != null;
    return SafeArea(
      child: Container(
        height: getVerticalSize(58),
        margin: getMargin(right: 10),
        decoration: AppDecoration.outlineIndigo505,
        child: Row(
          children: [
            if (isReplying && widget.replyMessages.value != null)
              BuildReply(
                replyMessage: widget.replyMessages.value!,
                onCancelReply: widget.onCancelReply,
              ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                right: BorderSide(
                  width: 1,
                  color: ColorConstant.gray600Ab,
                ),
              )),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                ),
                child: IconButton(
                  icon: Icon(
                    widget.icon,
                    size: 30,
                  ),
                  onPressed: widget.onPressed,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 6),
                child: Center(
                  child: CustomTextFormField(
                    width: getHorizontalSize(334),
                    focusNode: widget.focusNode,
                    autofocus: true,
                    onChanged: (value) {
                      sendButton.value = value.isNotEmpty;
                    },
                    hintText: "lbl_write_a_message".tr,
                    onSubmitted: (_) => widget.closedController.sendMessage(
                        context, widget.messageController.text),
                    padding: TextFormFieldPadding.PaddingT11,
                    fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                    textInputAction: TextInputAction.done,
                    controller: controllers.messageController,
                    alignment: Alignment.center,
                    suffix: Obx(() {
                      return Container(
                        // margin: getMargin(left: 30, top: 10, right: 16, bottom: 10),
                        child: IconButton(
                          onPressed: sendButton.value
                              ? () async {
                                  await widget.closedController.sendMessage(context,
                                      widget.messageController.text);
                                }
                              : null,
                          icon: sendButton.value
                              ? Icon(
                                  Icons.send,
                                  color: ColorConstant.black900,
                                  size: 24.0,
                                )
                              : CustomImageView(
                                  onTap: () {
                                    popTime = 3;
                                    Get.to(CameraScreen());
                                  },
                                  height: 24,
                                  width: 24,
                                  svgPath: ImageConstant.imgCamera,
                                  // Add any other necessary properties and styling for CustomImageView
                                ),
                        ),
                      );
                    }),
                    suffixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(42)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatsInputsController extends GetxController {
  final ChatData chatData;
  final TextEditingController messageController;
  final FocusNode focusNode;
  final VoidCallback onCancelReply;
  final ChatsInfluencerController closedController;

  ChatsInputsController(
      {required this.chatData,
      required this.messageController,
      required this.focusNode,
      required this.onCancelReply,
      required this.closedController});

  RxList<Message> messageModelObjs = <Message>[].obs;
   var message = "".obs;
   bool empty = false;
   var token;
   var error = ''.obs;
   final UserController user = Get.find();
   final storage = FlutterSecureStorage();
   final ScrollController _scrollController = ScrollController();
   final ApiClients apiClient = ApiClients();
   final SocketClient socketClient = SocketClient.to;
   RxBool isConnected = false.obs;
   var messages = <String>[].obs;
   final SocketClient _socketClient = Get.find();
   Rx<bool> isLoading = false.obs;
   Rx<bool> isTrendLoading = false.obs;
   late final RxBool isDeleted = false.obs;
   RxBool isEmojiWidgetShown = false.obs;

  @override
  void onInit() {
    super.onInit();

    socketClient.connect();
    
    scrollToBottom();
  }

/*   Future<void> sendMessage(BuildContext context, String messageText) async {
    FocusScope.of(context).unfocus();
    onCancelReply();
    try {
      messageText = messageText.trim();

      final now = DateTime.now();
      final formattedTime = DateFormat('HH:mm').format(now);
      final createdAt = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(formattedTime.substring(0, 2)),
        int.parse(formattedTime.substring(3)),
        0,
      );

      final messageId = Uuid().v4();

      final newMessage = Message(
        id: chatData.id,
        chatId: chatData.chatId,
        authorId: chatData.influencerId,
        text: messageText,
        authorUserId: chatData.influencerUserId,
        blockedByRecipient: chatData.blockedByCreator,
        messageId: messageId,
        createdAt: createdAt,
        updatedAt: createdAt,
      );

      final token = await storage.read(key: "token");

      if (token == null) {
        print("Authorization token is not available");
        return;
      }
      final response = await apiClient.sendMessage(newMessage, token);

      if (response.isOk) {
         UpdateList(newMessage);
         print('Message sent and stored successfully');

        update();

        messageController.clear();

        if (_scrollController.hasClients) {
          scrollToBottom();
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              scrollToBottom();
            }
          });
        }
      } else {
        print('Failed to send message: ${response.statusText}');
        print('Sent Message: $messageText');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  } */



  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

   @override
  void onClose() {
    super.onClose();
    _socketClient.socket.off('newMessage');
    _socketClient.socket.off('error');
    _socketClient.disconnect();
  //  messageController.dispose();
  }
}
