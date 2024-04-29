import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/controller/chats_opened_controller.dart';
import 'package:iynfluencer/widgets/reply_message_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/camera_screen/camera_scree.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_text_form_field.dart';

class ChatInputBar extends StatefulWidget {
  final TextEditingController messageController;
  IconData? icon;
  VoidCallback? onPressed;
  final ChatData chatData;
  final FocusNode focusNode;
  Rx<Message?> replyMessage = Rx<Message?>(null);
  final VoidCallback onCancelReply;
  final ChatsOpenedController openedController;

  ChatInputBar(
      {required this.messageController,
      this.icon,
      this.onPressed,
      required this.chatData,
      required this.focusNode,
      required this.replyMessage,
      required this.onCancelReply,
      required this.openedController});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  int popTime = 0;
  var sendButton = false.obs;
  late ChatsInputController controller;
  bool isEmojiWidgetShown = false;
  bool EmojiWidgetShown = true;   

  @override
  void initState() {
    super.initState();
    controller = ChatsInputController(
        chatData: widget.chatData,
        messageController: widget.messageController,
        focusNode: widget.focusNode,
        onCancelReply: widget.onCancelReply,
        openController: widget.openedController);

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        widget.openedController.hideEmojiWidget();
      }
    });
  }

  //  controller.sendMessage(context, widget.messageController.text);

  @override
  Widget build(BuildContext context) {
    final isReplying = widget.replyMessage != null;

    return SafeArea(
        child: Container(
      height: getVerticalSize(58),
      margin: getMargin(right: 10),
      decoration: AppDecoration.outlineIndigo505,
      child: Row(
        children: [
          if (isReplying && widget.replyMessage.value != null)
            BuildReply(
              replyMessage: widget.replyMessage.value!,
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
                  focusNode: EmojiWidgetShown ? null : widget.focusNode,
                  autofocus: true,
                  onChanged: (value) {
                    sendButton.value = value.isNotEmpty;
                  },
                  hintText: "lbl_write_a_message".tr,
                  onSubmitted: (_) => controller.sendMessage(
                      context, controller.messageController.text),
                  padding: TextFormFieldPadding.PaddingT11,
                  fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                  textInputAction: TextInputAction.done,
                  controller: controller.messageController,
                  alignment: Alignment.center,
                  suffix: Obx(() {
                    return Container(
                      // margin: getMargin(left: 30, top: 10, right: 16, bottom: 10),
                      child: IconButton(
                        onPressed: sendButton.value
                            ? () async {
                                await controller.sendMessage(
                                    context, controller.messageController.text);
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
    ));
  }
}

class ChatsInputController extends GetxController {
  final ChatData chatData;
  final TextEditingController messageController;
  final FocusNode focusNode;
  final VoidCallback onCancelReply;
  final ChatsOpenedController openController;

  ChatsInputController(
      {required this.chatData,
      required this.messageController,
      required this.focusNode,
      required this.onCancelReply,
      required this.openController});

  RxList<Message> messageModelObj = <Message>[].obs;
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

  @override
  void onInit() {
    super.onInit();

    socketClient.connect();

    socketClient.handleReceivedMessage();

    socketClient.socket.on('connected', (data) {
      messageModelObj.add(data);
      isConnected.value = true;
      update();
    });

    socketClient.socket.on('error', (errorData) {
      print('Socket Error: $errorData');
      isConnected.value = false;
      update();
    });
    scrollToBottom();
  }

  Future<void> addMessage(Message message, String chatId) async {
    List<Message> messages = await loadMessages(chatId);
    messages.add(message);
    await saveMessages(messages, chatId);
  }

  
 Future<void> saveMessages(List<Message> messages, String chatId) async {
  try {
    final List<String> serializedMessages = messages.map((message) => jsonEncode(message.toJson())).toList();
    final String serializedMessagesString = jsonEncode(serializedMessages);
    await storage.write(key: 'messages_$chatId', value: serializedMessagesString);
    print('Messages saved successfully for chat ID: $chatId');
  } catch (e) {
    print('Error saving messages: $e');
    // Handle error as needed
  }
}
   Future<List<Message>> loadMessages(String chatId) async {
  final serializedMessagesString = await storage.read(key: 'messages_$chatId');
  
  if (serializedMessagesString != null && serializedMessagesString.isNotEmpty) {
    final List<dynamic> decodedList = jsonDecode(serializedMessagesString);
    
    // Check if the decoded data is a list
    if (decodedList is List) {
      final List<Map<String, dynamic>> serializedMessages =
          decodedList.cast<Map<String, dynamic>>();
      
      // Map each Map<String, dynamic> to a Message object using Message.fromJson
      final List<Message> messages = serializedMessages
          .map((map) => Message.fromJson(map))
          .toList();
      
      return messages;
    } else {
      print('Invalid JSON format: $serializedMessagesString');
      return [];
    }
  } else {
    print('No messages found for chatId: $chatId');
    return [];
  }
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
        authorId: chatData.creatorId,
        text: messageText,
        authorUserId: chatData.creatorUserId,
        blockedByRecipient: chatData.blockedByInfluencer,
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
        print('Message sent and stored successfully');

        messageModelObj.add(newMessage);

        update();

        Message newsMessage = Message(
          id: chatData.id,
          chatId: chatData.chatId,
          authorId: chatData.creatorId,
          text: messageText,
          authorUserId: chatData.creatorUserId,
          blockedByRecipient: chatData.blockedByInfluencer,
          messageId: messageId,
          createdAt: createdAt,
          updatedAt: createdAt,
        );
      //  addMessage(newsMessage, chatData.chatId);

     //   openController.getUser(chatData.chatId);

        socketClient.sendMessage(messageText);

        socketClient.socket.emit('message.create', newMessage.toJson());
        update();
        messageController.clear();

         focusNode.requestFocus();

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
