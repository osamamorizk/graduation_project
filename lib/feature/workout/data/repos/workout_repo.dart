import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/workout/data/models/exercise_model.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/workout_plan_model.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/exercise.dart';

abstract class WorkoutRepo {
  Future<Either<Failure, List<WorkoutPlanModel>>> getAllWorkoutPlans();
  Future<Either<Failure, List<WorkoutExerciseModel>>> getWorkoutByDay(
      {required String day});

  Future<Either<Failure, List<ExerciseModel>>> getExerciseList(
      {required int id});
}
