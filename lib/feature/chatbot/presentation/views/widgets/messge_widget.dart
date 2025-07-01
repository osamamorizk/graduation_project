import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.messageModel});
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final messageDate = messageModel.timestamp;
    final isToday =
        now.month == messageDate.month && now.day == messageDate.day;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final messageColor =
        isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue;
    return Column(
      crossAxisAlignment: messageModel.isUserMessage
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          // width: MediaQuery.of(context).size.width / 1.8,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: messageModel.isUserMessage
                ? messageColor
                : Colors.grey.shade200,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(messageModel.isUserMessage ? 12 : 0),
                topRight: Radius.circular(messageModel.isUserMessage ? 0 : 12),
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12)),
          ),
          child: Text(
            messageModel.content,
            style: messageModel.isUserMessage
                ? TextStyles.font14WhiteBold
                : TextStyles.font14BlackBold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: messageModel.isUserMessage ? 4 : 0,
              left: messageModel.isUserMessage ? 0 : 4),
          child: Text(
            isToday
                ? DateFormat('hh:mm a').format(messageDate)
                : DateFormat('dd/MM hh:mm a').format(messageDate),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorsManger.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
