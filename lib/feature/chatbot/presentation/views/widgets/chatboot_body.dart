import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:graduation_project/feature/chatbot/presentation/manger/chatboot_cubit/chatboot_cubit.dart';
import 'package:graduation_project/feature/chatbot/presentation/views/widgets/messge_widget.dart';

class ChatbotBody extends StatefulWidget {
  const ChatbotBody({
    super.key,
  });

  @override
  State<ChatbotBody> createState() => _ChatbotBodyState();
}

class _ChatbotBodyState extends State<ChatbotBody> {
  late List<MessageModel> messages = [];
  late final TextEditingController _messageController;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _messageController = TextEditingController();

    super.initState();
    // BlocProvider.of<ChatbootCubit>(context).getMessages();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    const String typingIndicatorText = 'typingIndicatorText';
    return Column(
      children: [
        Expanded(
          child: BlocListener<ChatbootCubit, ChatbootState>(
            listener: (context, state) {
              if (state is ChatbootLoading) {
                setState(() {
                  messages.add(
                    MessageModel(
                      content: typingIndicatorText,
                      timestamp: DateTime.now(),
                      isUserMessage: false,
                    ),
                  );
                });
              } else if (state is ChatbootSuccess) {
                setState(() {
                  messages
                      .removeWhere((msg) => msg.content == typingIndicatorText);
                  messages.add(
                    MessageModel(
                      content: state.text,
                      timestamp: DateTime.now(),
                      isUserMessage: false,
                    ),
                  );
                });
              } else if (state is ChatbootError) {
                setState(() {
                  messages
                      .removeWhere((msg) => msg.content == typingIndicatorText);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: msg.content == typingIndicatorText
                      ? const TypingIndicator(
                          dotColor: ColorsManger.neonPurple,
                          dotSize: 9.0,
                          padding: 12.0,
                        )
                      : MessageWidget(messageModel: msg),
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
                  controller: _messageController,
                  validator: null,
                  hintText: 'Ask me anything...',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                sendMessage(context);

                _messageController.clear();
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

  void sendMessage(BuildContext context) {
    return setState(() {
      if (_messageController.text.isEmpty) return;
      messages.add(
        MessageModel(
          content: _messageController.text,
          timestamp: DateTime.now(),
          isUserMessage: true,
        ),
      );
      context.read<ChatbootCubit>().getText(
            _messageController.text,
          );
      context.read<ChatbootCubit>().saveMessage(
            MessageModel(
              content: _messageController.text,
              timestamp: DateTime.now(),
              isUserMessage: true,
            ),
          );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
  }
}
