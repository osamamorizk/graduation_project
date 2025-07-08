import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:graduation_project/feature/chatbot/presentation/manger/chatboot_cubit/chatboot_cubit.dart';
import 'package:graduation_project/feature/chatbot/presentation/views/widgets/empty_chat_body.dart';
import 'package:graduation_project/feature/chatbot/presentation/views/widgets/messge_widget.dart';

class ChatbotBody extends StatefulWidget {
  const ChatbotBody({
    super.key,
    required this.messages1,
  });
  final List<MessageModel> messages1;
  @override
  State<ChatbotBody> createState() => _ChatbotBodyState();
}

class _ChatbotBodyState extends State<ChatbotBody> {
  late List<MessageModel> messages;
  late final TextEditingController _messageController;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _messageController = TextEditingController();
    messages = widget.messages1;
    scrollToLastMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    const String typingIndicatorText = 'typingIndicatorText';
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocListener<ChatbootCubit, ChatbootState>(
              listener: (context, state) {
                if (state is ChatbootMessagesLoaded) {
                  setState(() {
                    messages = state.messages;
                  });
                }
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
                } else if (state is ChatbootResponseSuccess) {
                  setState(() {
                    messages.removeWhere(
                        (msg) => msg.content == typingIndicatorText);
                    messages.add(
                      MessageModel(
                        content: state.text,
                        timestamp: DateTime.now(),
                        isUserMessage: false,
                      ),
                    );
                    scrollToLastMessage();
                  });
                } else if (state is ChatbootError) {
                  setState(() {
                    messages.removeWhere(
                        (msg) => msg.content == typingIndicatorText);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: messages.isEmpty
                  ? EmptyChatBody(
                      isDarkMode: isDarkMode,
                      onNutritionTap: () {
                        addRole(context,
                            'You are a licensed nutritionist. Only respond with advice related to nutrition, healthy eating, and diet planning. Do not answer questions outside this role. Start by introducing yourself as a nutritionist.');
                      },
                      onFitnessTap: () {
                        addRole(context,
                            'You are a certified fitness coach. Only provide guidance related to fitness, workouts, and physical training. Do not respond to unrelated topics. Start by introducing yourself as a fitness coach.');
                      },
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: index == 0
                              ? null
                              : (msg.content == typingIndicatorText
                                  ? const TypingIndicator(
                                      dotColor: ColorsManger.neonPurple,
                                      dotSize: 9.0,
                                      padding: 12.0,
                                    )
                                  : MessageWidget(messageModel: msg)),
                        );
                      },
                    ),
            ),
          ),
          Divider(
            thickness: .02,
            color: isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
          ),
        ],
      ),
      bottomNavigationBar: Row(
        spacing: 8,
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: _messageController,
              validator: null,
              hintText: 'Ask me anything...',
            ),
          ),
          CircleAvatar(
            backgroundColor:
                isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
            radius: 22,
            child: IconButton(
              onPressed: () {
                sendMessage(context);

                _messageController.clear();
              },
              tooltip: 'Send message',
              icon: const Icon(
                size: 27, Icons.send_rounded, color: Colors.white,
                //  isDarkMode
                //     ? ColorsManger.neonPurple
                //     : ColorsManger.darkBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(BuildContext context) {
    return setState(() {
      if (_messageController.text.isEmpty) return;

      context.read<ChatbootCubit>().getAiResponse(
            _messageController.text,
          );
      messages.add(
        MessageModel(
          content: _messageController.text,
          timestamp: DateTime.now(),
          isUserMessage: true,
        ),
      );
      scrollToLastMessage();
    });
  }

  void scrollToLastMessage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent,
        );
      } else {
        log('⚠️ ScrollController has no attached clients yet.');
      }
    });
  }

  void addRole(BuildContext context, String message) {
    return setState(() {
      context.read<ChatbootCubit>().getAiResponse(
            message,
          );
      messages.add(
        MessageModel(
          content: _messageController.text,
          timestamp: DateTime.now(),
          isUserMessage: true,
        ),
      );
      scrollToLastMessage();
    });
  }
}

// List<MessageModel> getMessages() {
//   var box = Hive.box<MessageModel>(kChatMessages);
//   List<MessageModel> messages = box.values.toList();
//   if (messages.isEmpty) {
//     return [];
//   }
//   return messages;
// }
