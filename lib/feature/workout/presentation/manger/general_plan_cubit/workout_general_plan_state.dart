part of 'workout_general_plan_cubit.dart';

@immutable
sealed class WorkoutGeneralPlanState {}

final class WorkoutGeneralPlanInitial extends WorkoutGeneralPlanState {}

final class WorkoutGeneralPlanLoading extends WorkoutGeneralPlanState {}

final class WorkoutGeneralPlanSuccess extends WorkoutGeneralPlanState {
  final List<GeneralWorkoutPLanModel> genralPlanList;
  WorkoutGeneralPlanSuccess(this.genralPlanList);
}

final class WorkoutGeneralPlanFailure extends WorkoutGeneralPlanState {
  final String error;

  WorkoutGeneralPlanFailure({required this.error});
}
