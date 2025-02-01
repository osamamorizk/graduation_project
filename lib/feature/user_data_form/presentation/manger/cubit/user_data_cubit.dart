import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/user_data_form/data/models/user_data_form_model.dart';
import 'package:graduation_project/feature/user_data_form/data/repos/user_data_form_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userDataFormRepo) : super(UserDataInitial());
  final UserDataFormRepo userDataFormRepo;
  int gender = 0;
  int tall = 160;
  int age = 25;
  int weight = 60;
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
