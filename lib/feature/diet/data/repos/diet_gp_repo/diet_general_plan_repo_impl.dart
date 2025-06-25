import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/diet/data/models/diet_gp_model.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_gp_repo/diet_general_plan_repo.dart';

class DietGeneralPlanRepoImpl implements DietGeneralPlanRepo {
  final ApiService apiService;

  DietGeneralPlanRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<DietGpModel>>> getGeneralDietPlans() async {
    try {
      final response = await apiService.get(endPoints: 'GeneralPlans/diet');
      List<DietGpModel> dietPlans = [];
      for (var plan in response) {
        dietPlans.add(DietGpModel.fromJson(plan));
      }
      return right(dietPlans);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
