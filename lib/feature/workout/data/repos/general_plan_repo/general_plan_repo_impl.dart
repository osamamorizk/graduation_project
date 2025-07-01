import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/core/networking/end_points.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_details_model/general_plan_details_model.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_exercise_details_model.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_workout_plan_model.dart';
import 'package:graduation_project/feature/workout/data/repos/general_plan_repo/general_plan_repo.dart';

class GeneralWorkoutPlanRepoImpl implements GeneralPlanRepo {
  final ApiService apiService;

  GeneralWorkoutPlanRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<GeneralWorkoutPLanModel>>>
      getGeneralWorkoutPlans() async {
    try {
      var result = await apiService.get(endPoints: generalWorkoutEndPoints);
      List<GeneralWorkoutPLanModel> generalWorkoutPlansList = [];
      for (var plan in result) {
        generalWorkoutPlansList.add(GeneralWorkoutPLanModel.fromJson(plan));
      }
      return right(generalWorkoutPlansList.reversed.toList());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(errorMessage: e.message ?? 'Unknown error'));
      } else {
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, GeneralWorkoutPlanDetailsModel>>
      getGeneralWorkoutPlanDetails({required int id}) async {
    try {
      var result = await apiService.get(endPoints: 'GeneralPlans/workout/$id');

      return right(GeneralWorkoutPlanDetailsModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(errorMessage: e.message ?? 'Unknown error'));
      } else {
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, GeneralWorkoutExerciseDetailsModel>>
      getWorkoutExerciseDetails({required int id}) async {
    try {
      var result =
          await apiService.get(endPoints: 'GeneralPlans/workout/exercise/$id');

      return right(GeneralWorkoutExerciseDetailsModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(errorMessage: e.message ?? 'Unknown error'));
      } else {
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }
}
