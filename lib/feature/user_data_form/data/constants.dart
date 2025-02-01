import 'package:flutter/material.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/about_user_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/work_out_views/activity_goal_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/diet_views/dietary_restrictions_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/diet_views/dite_kind_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/work_out_views/fitness_level_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/work_out_views/goal_selection_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/diet_views/health_concerns_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/work_out_views/type_of_exercise_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/user_motivations_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/work_out_views/work_out_time_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/work_out_views/workout_day_number_view.dart';

List<Widget> formScreens = <Widget>[
  const AboutUser(),
  const GoalSelectionScreen(),
  const ActivityGoalView(),
  const DietaryRestrictionsView(),
  const DiteKindView(),
  const HealthConcernsView(),
  const FitnessLevelView(),
  const WorkoutDayNumberView(),
  const WorkoutTimeView(),
  const TypeOfExerciseView(),
  const UserMotivationsView(),
];

List<Widget> dietScreens = <Widget>[
  const GoalSelectionScreen(),
  const DietaryRestrictionsView(),
  const DiteKindView(),
  const HealthConcernsView(),
];

List<Widget> workoutScreens = <Widget>[
  const GoalSelectionScreen(),
  const ActivityGoalView(),
  const HealthConcernsView(),
  const FitnessLevelView(),
  const WorkoutDayNumberView(),
  const WorkoutTimeView(),
  const TypeOfExerciseView(),
];
