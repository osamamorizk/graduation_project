import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/user_data_form/data/models/user_data_form_model.dart';
import 'package:graduation_project/feature/user_data_form/data/repos/user_data_form_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userDataFormRepo) : super(UserDataInitial());
  final UserDataFormRepo userDataFormRepo;
  int gender = 0;
  double tall = 140;
  double age = 25;
  double weight = 60;
  int userGoals = 100;
  String dietaryRestrictions = '';
  String activityLevel = '';
  TextEditingController otherDietaryRestrictionsController =
      TextEditingController();
  int dietKind = 100;
  String helthConcerns = '';
  TextEditingController otherHelthConcernsController = TextEditingController();
  int fitnessLevel = 100;
  int workoutDays = 100;
  String workoutTime = '';

  Future<void> postUserData(
      {required UserDataFormModel userDataFormModel}) async {
    emit(PostUserDataLoading());
    var result = await userDataFormRepo.postUserData(
        userDataFormModel: userDataFormModel);
    result.fold(
      (failure) {
        emit(PostUserDataFailure(errorMessage: failure.errorMessage));
      },
      (userData) {
        Future.delayed(
          const Duration(seconds: 20),
          () => emit(PostUserDataSuccess(userDataFormModel: userDataFormModel)),
        );
      },
    );
  }

  Future<void> putWorkout(
      {required UserDataFormModel userDataFormModel}) async {
    emit(PostUserDataLoading());
    var result =
        await userDataFormRepo.putWorkout(userDataFormModel: userDataFormModel);
    result.fold(
      (failure) {
        emit(PostUserDataFailure(errorMessage: failure.errorMessage));
      },
      (userData) {
        emit(PostUserDataSuccess(userDataFormModel: userDataFormModel));
      },
    );
  }

  Future<void> putDiet({required UserDataFormModel userDataFormModel}) async {
    emit(PostUserDataLoading());
    var result =
        await userDataFormRepo.putDiet(userDataFormModel: userDataFormModel);
    result.fold(
      (failure) {
        emit(PostUserDataFailure(errorMessage: failure.errorMessage));
      },
      (userData) {
        emit(PostUserDataSuccess(userDataFormModel: userDataFormModel));
      },
    );
  }

  bool validateAllData() {
    return validateDietData() && validateWorkoutData();
  }

  bool validateDietData() {
    if (dietaryRestrictions.isEmpty) {
      return false;
    }

    if (helthConcerns.isEmpty) {
      return false;
    }

    return true;
  }

  bool validateWorkoutData() {
    if (userGoals == 100) {
      return false;
    }
    if (dietaryRestrictions.isEmpty) {
      return false;
    }

    if (dietKind == 100) {
      return false;
    }
    if (helthConcerns.isEmpty) {
      return false;
    }
    if (fitnessLevel == 100) {
      return false;
    }
    if (workoutDays == 100) {
      return false;
    }
    if (workoutTime.isEmpty) {
      return false;
    }
    return true;
  }
}
