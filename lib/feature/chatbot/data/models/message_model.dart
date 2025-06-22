import 'package:hive/hive.dart';
part 'message_model.g.dart';

@HiveType(typeId: 10)
class MessageModel {
  @HiveField(0)
  final String content;
  @HiveField(1)
  final DateTime timestamp;
  @HiveField(2)
  final bool isUserMessage;

  MessageModel({
    required this.content,
    required this.timestamp,
    required this.isUserMessage,
  });
}
