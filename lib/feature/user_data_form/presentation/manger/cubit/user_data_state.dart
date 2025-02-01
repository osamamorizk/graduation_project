part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class PostUserDataLoading extends UserDataState {}

final class PostUserDataSuccess extends UserDataState {
  final UserDataFormModel userDataFormModel;

  PostUserDataSuccess({required this.userDataFormModel});
}

final class PostUserDataFailure extends UserDataState {
  final String errorMessage;

  PostUserDataFailure({required this.errorMessage});
}
