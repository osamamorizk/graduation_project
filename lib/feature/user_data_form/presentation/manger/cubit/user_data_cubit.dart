import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/work_out_views/type_of_exercise_view.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  String gender = 'Male';
  int tall = 160;
  int age = 25;

  int weight = 60;

  int userGoals = 0;
  String dietaryRestrictions = '';
  String activityLevel = '';
  TextEditingController otherDietaryRestrictionsController =
      TextEditingController();
  String dietKind = '';
  String helthConcerns = '';
  TextEditingController otherHelthConcernsController = TextEditingController();
  int fitnessLevel = 0;
  int workoutDays = 2;
  String workoutTime = '';
  List<String> preferedExercise = [];
  TextEditingController preferedExerciseController = TextEditingController();

  List<String> userMotivation = [];
  bool validateAllData() {
    return validateDietData() && validateWorkoutData() && validateGeneralData();
  }

  bool validateDietData() {
    if (dietaryRestrictions.isEmpty) {
      return false;
    }
    if (dietaryRestrictions.contains('Other health concerns') &&
        otherDietaryRestrictionsController.text.isEmpty) {
      return false;
    }
    if (dietKind.isEmpty) {
      return false;
    }
    if (helthConcerns.isEmpty) {
      return false;
    }
    if (helthConcerns.contains('Other health concerns') &&
        otherHelthConcernsController.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateWorkoutData() {
    if (typeOfPreferedExercise.isEmpty) {
      return false;
    }
    if (typeOfPreferedExercise.contains('Other') &&
        preferedExerciseController.text.isEmpty) {
      return false;
    }
    if (activityLevel.isEmpty) {
      return false;
    }
    // if (fitnessLevel.isEmpty) {
    //   return false;
    // }
    // if (workoutDays.isEmpty) {
    //   return false;
    // }
    if (workoutTime.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateGeneralData() {
    // if (userGoals.isEmpty) {
    //   return false;
    // }
    if (userMotivation.isEmpty) {
      return false;
    }
    return true;
  }
}
