import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/core/networking/end_points.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/daily_plan.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/exercise.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo.dart';

class WorkoutRepoImpl implements WorkoutRepo {
  final ApiService apiService;
  List<WorkoutPlanModel> workoutPlansList = [];
  WorkoutRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<WorkoutPlanModel>>> getWorkoutPlans() async {
    try {
      var result = await apiService.get(endPoints: specializationEndPoints);

      for (var workout in result['plan']['DailyPlans']) {
        workoutPlansList.add(WorkoutPlanModel.fromJson(workout));
      }
      return right(workoutPlansList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<WorkoutExerciseModel>>> getDailyWorkout(
      {required String day}) async {
    try {
      List<WorkoutExerciseModel> exerciseList = getWorkoutByDay(day: day);
      return right(exerciseList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  getWorkoutByDay({required String day}) {
    return workoutPlansList
        .firstWhere(
          (exercise) => exercise.day == day,
        )
        .exercises;
  }
}
