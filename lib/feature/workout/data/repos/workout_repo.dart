import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/daily_plan.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/exercise.dart';

abstract class WorkoutRepo {
  Future<Either<Failure, List<WorkoutPlanModel>>> getWorkoutPlans();
  Future<Either<Failure, List<WorkoutExerciseModel>>> getDailyWorkout(
      {required String day});
}
