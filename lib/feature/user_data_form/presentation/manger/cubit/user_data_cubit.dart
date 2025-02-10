import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/user_data_form/data/models/user_data_form_model.dart';
import 'package:graduation_project/feature/user_data_form/data/repos/user_data_form_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userDataFormRepo) : super(UserDataInitial());
  final UserDataFormRepo userDataFormRepo;
  int duration = 15;
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

  Future<void> postUserData({
    required Map data,
  }) async {
    emit(PostUserDataLoading());
    var result = await userDataFormRepo.postUserData(data: data);
    result.fold(
      (failure) {
        emit(PostUserDataFailure(errorMessage: failure.errorMessage));
      },
      (userData) {
        Future.delayed(
          Duration(seconds: duration),
          () => emit(PostUserDataSuccess(userDataFormModel: userData)),
        );
      },
    );
  }

  Future<void> putWorkout({required Map data, required int id}) async {
    emit(PutWorkoutPlanLoading());
    var result = await userDataFormRepo.putWorkout(data: data, id: id);
    result.fold(
      (failure) {
        emit(PutWorkoutPlanFailure(errorMessage: failure.errorMessage));
      },
      (userData) {
        Future.delayed(
          Duration(seconds: duration),
          () => emit(PutWorkoutPlanSuccess(userDataFormModel: userData)),
        );
      },
    );
  }

  Future<void> putDiet({required Map data, required int id}) async {
    emit(PutDietPlanLoading());
    var result = await userDataFormRepo.putDiet(data: data, id: id);
    result.fold(
      (failure) {
        emit(PutDietPlanFailure(errorMessage: failure.errorMessage));
      },
      (userData) {
        Future.delayed(
          Duration(seconds: duration),
          () => emit(PutDietPlanSuccess(userDataFormModel: userData)),
        );
      },
    );
  }

  Future<void> putUser(
      {required Map<String, dynamic> data, required int id}) async {
    emit(PutUserLoading());
    var result = await userDataFormRepo.putUser(data: data, id: id);
    result.fold(
      (failure) {
        emit(PutUserFailure(errorMessage: failure.errorMessage));
      },
      (userData) {
        Future.delayed(
          Duration(seconds: duration),
          () => emit(PutUserSuccess(userDataFormModel: userData)),
        );
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
