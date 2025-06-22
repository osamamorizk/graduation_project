import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';

import 'package:graduation_project/feature/diet/data/models/diet_plan_model/diet_plan_model.dart';
import 'package:graduation_project/feature/diet/data/models/diet_plan_model/meal.dart';

abstract class DietRepo {
  Future<Either<Failure, List<DietPlanModel>>> getAllDiet();
  Future<Either<Failure, List<Meal>>> getMealsByDay({required String day});
}
