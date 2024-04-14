import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';

class ChatMessageBubble extends StatelessWidget {
  final String messageText;
  final bool isReceived;
  final String timestamp;
  final String? leadingImagePath;
  final String? trailingImagePath;

  const ChatMessageBubble({
    required this.messageText,
    required this.isReceived,
    this.timestamp = '',
    this.leadingImagePath,
    this.trailingImagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bubbleColor = isReceived
        ? ColorConstant.gray200
        : ColorConstant.cyan100; // Retaining your original colors
    return Column(
      crossAxisAlignment:
      isReceived ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment:
          isReceived ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            // if (isReceived && leadingImagePath != null)
            //   CustomImageView(
            //     svgPath: leadingImagePath!,
            //     height: getVerticalSize(61),
            //     width: getHorizontalSize(24),
            //   ),
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
                  bottomLeft:
                  isReceived ? Radius.circular(0) : Radius.circular(20),
                  bottomRight:
                  isReceived ? Radius.circular(20) : Radius.circular(0),
                ),
              ),
              child: Text(messageText,style: TextStyle(color: isReceived? Colors.black87:Colors.white),),
            ),
            // if (!isReceived && trailingImagePath != null)
            //   CustomImageView(
            //     svgPath: trailingImagePath!,
            //     height: getVerticalSize(61),
            //     width: getHorizontalSize(24),
            //   ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(
            right: isReceived ? 0 : 16,
            left: isReceived ? 16 : 0,
          ),
          child: Text(
            timestamp,
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
