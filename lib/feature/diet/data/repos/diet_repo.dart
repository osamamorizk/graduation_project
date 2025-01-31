import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/diet/data/models/diet/daily_plan.model.dart';
import 'package:graduation_project/feature/diet/data/models/diet/meal.model.dart';

abstract class DietRepo {
  Future<Either<Failure, List<DailyPlan>>> getAllDiet();
  Future<Either<Failure, List<Meal>>> getMealsByDay({required String day});
}
