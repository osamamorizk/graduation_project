import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/diet/data/models/diet_gp_model.dart';

abstract class DietGeneralPlanRepo {
  Future<Either<Failure, List<DietGpModel>>> getGeneralDietPlans();

  // Future<Either<Failure, GeneralDietPlanDetailsModel>>
  //     getGeneralDietPlanDetails({required int id});

  // Future<Either<Failure, GeneralDietMealDetailsModel>>
  //     getDietMealDetails({required int id});
}
