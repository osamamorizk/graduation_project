class MessageModel {
  final String content;
  final DateTime timestamp;
  final bool isUserMessage;

  MessageModel({
    required this.content,
    required this.timestamp,
    required this.isUserMessage,
  });
}
