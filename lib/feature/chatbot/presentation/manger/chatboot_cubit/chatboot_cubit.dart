import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/chatbot/data/repos/chat_bot_repo.dart';
import 'package:meta/meta.dart';

part 'chatboot_state.dart';

class ChatbootCubit extends Cubit<ChatbootState> {
  ChatbootCubit(this.chatBotRepo) : super(ChatbootInitial());

  final ChatBotRepo chatBotRepo;

  Future<void> getText(String message) async {
    emit(ChatbootLoading());
    final result = await chatBotRepo.getText(message);
    result.fold(
      (failure) => emit(ChatbootError(failure.errorMessage)),
      (text) => emit(ChatbootSuccess(text)),
    );
  }
}
