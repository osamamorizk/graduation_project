import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:graduation_project/feature/chatbot/presentation/manger/chatboot_cubit/chatboot_cubit.dart';
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
          child: BlocListener<ChatbootCubit, ChatbootState>(
            listener: (context, state) {
              if (state is ChatbootSuccess) {
                setState(() {
                  widget.messages.add(
                    MessageModel(
                      content: state.text,
                      timestamp: DateTime.now(),
                      isUserMessage: false,
                    ),
                  );
                });
              } else if (state is ChatbootError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: ListView.builder(
              itemCount: widget.messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: MessageWidget(
                    messageModel: MessageModel(
                      content: widget.messages[index].content,
                      timestamp: widget.messages[index].timestamp,
                      isUserMessage: widget.messages[index].isUserMessage,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Divider(
          thickness: .05,
          color: isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: CustomTextFormField(
                  controller: widget.messageController,
                  validator: null,
                  hintText: 'Ask me anything...',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.messageController.text.isEmpty) return;
                  widget.messages.add(
                    MessageModel(
                      content: widget.messageController.text,
                      timestamp: DateTime.now(),
                      isUserMessage: true,
                    ),
                  );

                  context.read<ChatbootCubit>().getText(
                        widget.messageController.text,
                      );
                });

                widget.messageController.clear();
              },
              tooltip: 'Send message',
              icon: Icon(
                size: 30,
                Icons.send,
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
