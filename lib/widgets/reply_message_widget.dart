import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';

class ReplyMessageWidget extends StatelessWidget {
  final Message message;
  final VoidCallback onCancelReply;

  const ReplyMessageWidget({
    required this.message,
    required this.onCancelReply,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return IntrinsicHeight(
        child: Row(
          children: [
            Container(
              color: ColorConstant.cyan100,
              width: 4,
            ),
            const SizedBox(width: 8),
            Expanded(child: BuildReplyMessage(
              message:message,
              onCancelReply: onCancelReply,
            )),
          ],
        ),
      );
  }
}


class BuildReplyMessage extends StatelessWidget {
   final Message message;
  final VoidCallback onCancelReply;

  const BuildReplyMessage({
    Key? key,
    required this.message,
    required this.onCancelReply,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
              DateFormat.jm('en_US')
                 .format(message.createdAt);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${formattedDateTime}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              if (onCancelReply != null)
                GestureDetector(
                  child: Icon(Icons.close, size: 16),
                  onTap: onCancelReply,
                )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            message.text, 
          style: TextStyle(color: Colors.black54)),
        ],
      );
  }
}


class BuildReply extends StatefulWidget {
   final Message replyMessage;
  final VoidCallback onCancelReply;
  const BuildReply({
    Key? key,
    required this.replyMessage,
    required this.onCancelReply,
    }) : super(key: key);

  @override
  State<BuildReply> createState() => _BuildReplyState();
}

class _BuildReplyState extends State<BuildReply> {
  static final inputTopRadius = Radius.circular(12);
  static final inputBottomRadius = Radius.circular(24);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: inputTopRadius,
            topRight: inputTopRadius,
          ),
        ),
        child: ReplyMessageWidget(
          message: widget.replyMessage,
          onCancelReply: widget.onCancelReply,
        ),
      );
  }
}