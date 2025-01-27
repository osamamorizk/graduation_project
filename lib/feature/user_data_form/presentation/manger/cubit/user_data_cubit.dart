import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  int currentstep = 0;
  String gender = 'Male';
  num tall = 160;
  int age = 25;

  num weight = 60;
  String heightUnit = 'cm';
  String weightUnit = 'KG';
  List<String> userGoals = [];
  List<String> dietaryRestrictions = [];
  String activityLevel = '';
  TextEditingController otherDietaryRestrictionsController =
      TextEditingController();
  String dietKind = '';
  List<String> helthConcerns = [];
  TextEditingController otherHelthConcernsController = TextEditingController();
  String fitnessLevel = '';
  String workoutDays = '';
  List<String> preferedExercise = [];
  TextEditingController preferedExerciseController = TextEditingController();

  List<String> userMotivation = [];
}
