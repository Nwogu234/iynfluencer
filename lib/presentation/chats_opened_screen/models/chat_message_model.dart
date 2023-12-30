class ChatMessageModel {
  final String messageText;
  final bool isReceived;
  final String timestamp;

  ChatMessageModel({
    required this.messageText,
    required this.isReceived,
    required this.timestamp,
  });
}
