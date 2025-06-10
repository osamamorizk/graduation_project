part of 'chatboot_cubit.dart';

@immutable
sealed class ChatbootState {}

final class ChatbootInitial extends ChatbootState {}

final class ChatbootLoading extends ChatbootState {}

final class ChatbootSuccess extends ChatbootState {
  final String text;

  ChatbootSuccess(this.text);
}

final class ChatbootError extends ChatbootState {
  final String errorMessage;

  ChatbootError(this.errorMessage);
}
