import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:graduation_project/feature/chatbot/presentation/views/widgets/messge_widget.dart';

class ChatbotBody extends StatefulWidget {
  const ChatbotBody({
    super.key,
    required this.messages,
    required this.messageController,
  });

  final List<MessageModel> messages;
  final TextEditingController messageController;

  @override
  State<ChatbotBody> createState() => _ChatbotBodyState();
}

class _ChatbotBodyState extends State<ChatbotBody> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.messages.length,
            itemBuilder: (context, index) {
              return MessageWidget(
                messageModel: MessageModel(
                  content: widget.messages[index].content,
                  timestamp: widget.messages[index].timestamp,
                  isUserMessage: widget.messages[index].isUserMessage,
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: CustomTextFormField(
                  controller: widget.messageController,
                  validator: null,
                  hintText: 'Type your message here...',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.messageController.text.isEmpty) return;
                  widget.messages.add(MessageModel(
                    content: widget.messageController.text,
                    timestamp: DateTime.now(),
                    isUserMessage: true,
                  ));
                });

                widget.messageController.clear();
              },
              tooltip: 'Send message',
              icon: Icon(
                size: 28,
                FontAwesomeIcons.paperPlane,
                color: isDarkMode
                    ? ColorsManger.neonPurple
                    : ColorsManger.darkBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
