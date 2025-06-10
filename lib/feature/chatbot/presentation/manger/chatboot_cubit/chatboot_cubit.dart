import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:graduation_project/feature/chatbot/data/repos/chat_bot_repo.dart';
import 'package:meta/meta.dart';

part 'chatboot_state.dart';

class ChatbootCubit extends Cubit<ChatbootState> {
  ChatbootCubit(this.chatBotRepo) : super(ChatbootInitial());

  final ChatBotRepo chatBotRepo;

  Future<void> getText(String message) async {
    emit(ChatbootLoading());
    final result = await chatBotRepo.getText(message);
    result.fold((failure) => emit(ChatbootError(failure.errorMessage)), (text) {
      emit(ChatbootSuccess(text));
      saveMessage(
        MessageModel(
          content: text,
          timestamp: DateTime.now(),
          isUserMessage: false,
        ),
      );
    });
  }

  void getMessages() {
    final messages = chatBotRepo.getMessages();
    if (messages.isEmpty) {
      return emit(ChatbootMessagesLoaded(const []));
    }
    return emit(ChatbootMessagesLoaded(messages));
  }

  Future<void> saveMessage(MessageModel message) async {
    await chatBotRepo.saveMessage(message);

    emit(ChatbootMessageSaved(message));
    getMessages();
  }
}
