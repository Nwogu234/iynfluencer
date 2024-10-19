import 'package:flutter/widgets.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/controller/chats_opened_controller.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:iynfluencer/presentation/creator_mark_job_details_screen/creator_mark_job_detail_screen.dart';
import 'package:swipe_to/swipe_to.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';

class ChatMessageBubble extends StatefulWidget {
  final String messageModelObj;
  final String messageText;
  final ChatsOpenedController controller;
  final bool isReceived;
  final String timestamp;
  final String? leadingImagePath;
  final String? trailingImagePath;
   final Rx<MessageStatus> messageStatus;
  ChatData? chatData;
  final ValueChanged<Message> onSwipedMessage;
  final bool isCompleteMessage;

  ChatMessageBubble({
    required this.messageModelObj,
    required this.messageText,
    required this.controller,
    required this.isReceived,
    required this.onSwipedMessage,
    this.timestamp = '',
    this.leadingImagePath,
    this.trailingImagePath,
    required this.messageStatus,
    this.chatData,
    required this.isCompleteMessage,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatMessageBubble> createState() => _ChatMessageBubbleState();
}

class _ChatMessageBubbleState extends State<ChatMessageBubble> {
  late final RxBool isDeleted = false.obs;

  @override
  Widget build(BuildContext context) {
    Color bubbleColor =
        widget.isReceived ? ColorConstant.gray200 : ColorConstant.cyan100;

     ValueNotifier<MessageStatus> messageStatusNotifier = ValueNotifier<MessageStatus>(MessageStatus.sending);
    if (isDeleted.value == true) {
      return Obx(() {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft:
                  widget.isReceived ? Radius.circular(0) : Radius.circular(20),
              bottomRight:
                  widget.isReceived ? Radius.circular(20) : Radius.circular(0),
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Text(
            'This message has been deleted',
            style: TextStyle(color: Colors.black87),
          ),
        );
      });
    } else {
      return Column(
        crossAxisAlignment: widget.isReceived
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          SwipeTo(
            onRightSwipe: (details) {
              widget.onSwipedMessage;
            },
            child: Row(
              mainAxisAlignment: widget.isReceived
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                if (widget.isReceived && widget.leadingImagePath != null)
                  GestureDetector(
                    onTap: () {
                      _showPopupMenu(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, top: 20),
                      child: CustomImageView(
                        svgPath: widget.leadingImagePath!,
                        height: getVerticalSize(30),
                        width: getHorizontalSize(10),
                      ),
                    ),
                  ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: bubbleColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: widget.isReceived
                            ? Radius.circular(0)
                            : Radius.circular(20),
                        bottomRight: widget.isReceived
                            ? Radius.circular(20)
                            : Radius.circular(0),
                      ),
                    ),
                    child: Text(widget.messageText,
                        style: TextStyle(
                            color: widget.isReceived
                                ? Colors.black87
                                : Colors.white))),
                     Padding(
                  padding: const EdgeInsets.only(top: 35, left: 5),
                  child: widget.isReceived
                      ? SizedBox.shrink()
                      : _buildMessageStatusIcon(widget.controller)
                ), 
                                 
                if (!widget.isReceived && widget.trailingImagePath != null)
                  GestureDetector(
                    onTap: () {
                      _showPopupMenu(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: CustomImageView(
                        svgPath: widget.trailingImagePath!,
                        height: getVerticalSize(30),
                        width: getHorizontalSize(10),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(
              right: widget.isReceived ? 0 : 16,
              left: widget.isReceived ? 16 : 0,
            ),
            child: Text(
              widget.timestamp,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      );
    }
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset tapPosition = box.localToGlobal(Offset.zero);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        tapPosition,
        widget.isReceived && widget.leadingImagePath != null
            ? overlay.size.bottomLeft(tapPosition)
            : overlay.size.bottomRight(tapPosition),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Reply',
          child: Text(
            'Reply',
            // style: AppStyle.txtSatoshiBold125Gray900a7
          ),
        ),
        PopupMenuItem<String>(
          value: 'Delete',
          child: Text(
            'Delete',
            // style: AppStyle.txtSatoshiBold125Gray900a7
          ),
        ),
      ],
    ).then((String? value) {
      if (value == 'Delete') {
        widget.controller.deleteIdMessage(widget.messageModelObj);
      }
    });
  }

  /*  Widget _buildMessageStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sending:
        return Icon(Icons.access_time, size: 10, color: Colors.grey);
      case MessageStatus.sent:
        return Icon(Icons.done_all, size: 10, color: Colors.grey);
      case MessageStatus.failed:
        return Icon(Icons.error, size: 10, color: Colors.grey);
      default:
        return SizedBox.shrink();
    }
  } */


 Widget _buildMessageStatusIcon(ChatsOpenedController controller) {
  return Obx(() {
    return controller.isSent.value
        ? Icon(Icons.done_all, size: 17, color: Colors.grey)
        : Icon(Icons.error, size: 17, color: Colors.red);
  });
}
}

