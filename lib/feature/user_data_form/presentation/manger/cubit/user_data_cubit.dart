import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  int gender = 0;
  int tall = 160;
  int age = 25;

  int weight = 60;

  int userGoals = 100;
  String dietaryRestrictions = '';
  String activityLevel = '';
  TextEditingController otherDietaryRestrictionsController =
      TextEditingController();
  String dietKind = '';
  String helthConcerns = '';
  TextEditingController otherHelthConcernsController = TextEditingController();
  int fitnessLevel = 100;
  int workoutDays = 100;
  String workoutTime = '';
  // List<String> preferedExercise = [];

  // List<String> userMotivation = [];
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

    if (dietKind.isEmpty) {
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
