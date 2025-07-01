import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/core/networking/end_points.dart';
import 'package:graduation_project/feature/workout/data/models/exercise_model.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/workout_plan_model.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/exercise.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo/workout_repo.dart';

class WorkoutRepoImpl implements WorkoutRepo {
  final ApiService apiService;
  List<WorkoutPlanModel> workoutPlansList = [];
  WorkoutRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<WorkoutPlanModel>>> getAllWorkoutPlans() async {
    try {
      var result = await apiService.get(endPoints: workoutPlanEndPoint);
      workoutPlansList.clear();

      for (var workout in result['plan']['daily_plans']) {
        workoutPlansList.add(WorkoutPlanModel.fromJson(workout));
      }
      return right(workoutPlansList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log(e.toString());
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, List<WorkoutPlanModel>>> changeWorkoutPlan() async {
    try {
      var result =
          await apiService.post(endPoints: workoutPlanEndPoint, data: null);
      workoutPlansList.clear();

      for (var workout in result['plan']['daily_plans']) {
        workoutPlansList.add(WorkoutPlanModel.fromJson(workout));
      }
      return right(workoutPlansList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log(e.toString());
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, List<WorkoutExerciseModel>>> getWorkoutByDay(
      {required String day}) async {
    try {
      List<WorkoutExerciseModel> exerciseList = filterWorkoutByDay(day: day);
      return right(exerciseList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }

  filterWorkoutByDay({required String day}) {
    return workoutPlansList
        .firstWhere(
          (exercise) => exercise.day == day,
        )
        .exercises;
  }

  @override
  Future<Either<Failure, List<ExerciseModel>>> getExerciseList(
      {required int id}) async {
    List<ExerciseModel> exerciseList = [];
    try {
      var result = await apiService.get(endPoints: 'Exercises/$id');
      for (var exercise in result) {
        exerciseList.add(ExerciseModel.fromJson(exercise));
      }

      return right(exerciseList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }
}
