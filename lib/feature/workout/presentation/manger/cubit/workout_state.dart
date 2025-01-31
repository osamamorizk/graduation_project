part of 'workout_cubit.dart';

@immutable
sealed class WorkoutState {}

final class WorkoutInitial extends WorkoutState {}

// states for all workout plans
final class AllWorkoutLoading extends WorkoutState {}

final class AllWorkoutSuccess extends WorkoutState {
  final List<WorkoutPlanModel> workoutPlansList;

  AllWorkoutSuccess({required this.workoutPlansList});
}

final class AllWorkoutFailure extends WorkoutState {
  final String errorMessage;

  AllWorkoutFailure({required this.errorMessage});
}

// states for filter workout by day
final class WorkoutByDayLoading extends WorkoutState {}

final class WorkoutByDaySuccess extends WorkoutState {
  final List<WorkoutExerciseModel> dailyWorkoutExercise;

  WorkoutByDaySuccess({required this.dailyWorkoutExercise});
}

final class WorkoutByDayFailure extends WorkoutState {
  final String errorMessage;

  WorkoutByDayFailure({required this.errorMessage});
}
