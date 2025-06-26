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

final class GeneralWorkoutPlanDetailsLoading extends WorkoutGeneralPlanState {
  GeneralWorkoutPlanDetailsLoading();
}

final class GeneralWorkoutPlanDetailsSuccess extends WorkoutGeneralPlanState {
  final GeneralWorkoutPlanDetailsModel genralPlanDetails;
  GeneralWorkoutPlanDetailsSuccess(this.genralPlanDetails);
}

final class GeneralWorkoutPlanDetailsFailure extends WorkoutGeneralPlanState {
  final String error;

  GeneralWorkoutPlanDetailsFailure({required this.error});
}

final class GeneralWorkoutExerciseDetailsLoading
    extends WorkoutGeneralPlanState {
  GeneralWorkoutExerciseDetailsLoading();
}

final class GeneralWorkoutExerciseDetailsSuccess
    extends WorkoutGeneralPlanState {
  final GeneralWorkoutExerciseDetailsModel genralPlanDetails;
  GeneralWorkoutExerciseDetailsSuccess(this.genralPlanDetails);
}

final class GeneralWorkoutExerciseDetailsFailure
    extends WorkoutGeneralPlanState {
  final String error;

  GeneralWorkoutExerciseDetailsFailure({required this.error});
}
