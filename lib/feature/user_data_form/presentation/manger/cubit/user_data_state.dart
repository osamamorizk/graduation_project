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

// States for updating diet plan
final class PutDietPlanLoading extends UserDataState {}

final class PutDietPlanSuccess extends UserDataState {
  final UserDataFormModel userDataFormModel;

  PutDietPlanSuccess({required this.userDataFormModel});
}

final class PutDietPlanFailure extends UserDataState {
  final String errorMessage;

  PutDietPlanFailure({required this.errorMessage});
}

// States for updating workout plan
final class PutWorkoutPlanLoading extends UserDataState {}

final class PutWorkoutPlanSuccess extends UserDataState {
  final UserDataFormModel userDataFormModel;

  PutWorkoutPlanSuccess({required this.userDataFormModel});
}

final class PutWorkoutPlanFailure extends UserDataState {
  final String errorMessage;

  PutWorkoutPlanFailure({required this.errorMessage});
}
