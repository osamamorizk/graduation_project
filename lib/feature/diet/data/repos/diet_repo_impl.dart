import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/core/networking/end_points.dart';

import 'package:graduation_project/feature/diet/data/models/diet_plan_model/diet_plan_model.dart';
import 'package:graduation_project/feature/diet/data/models/diet_plan_model/meal.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_repo.dart';

class DietRepoImpl implements DietRepo {
  final ApiService apiService;

  DietRepoImpl(this.apiService);
  List<DietPlanModel> daysDietList = [];
  @override
  Future<Either<Failure, List<DietPlanModel>>> getAllDiet() async {
    try {
      // var result = await apiService.get(endPoints: dietPlanEndPoint);
      var result = await rootBundle.loadString('assets/diet_meal_json.json');
      daysDietList.clear();
      final Map<String, dynamic> jsonMap = jsonDecode(result);

      final List<Map<String, dynamic>> transformedResponse =
          convertToDesiredStructure(jsonMap);
      for (var dietDay in transformedResponse) {
        daysDietList.add(DietPlanModel.fromJson(dietDay));
      }
      return right(daysDietList);
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
  Future<Either<Failure, List<DietPlanModel>>> changeDit() async {
    try {
      var result =
          await apiService.post(endPoints: dietPlanEndPoint, data: null);
      daysDietList.clear();
      final List<Map<String, dynamic>> transformedResponse =
          convertToDesiredStructure(result);
      for (var dietDay in transformedResponse) {
        daysDietList.add(DietPlanModel.fromJson(dietDay));
      }
      return right(daysDietList);
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
  Future<Either<Failure, List<Meal>>> getMealsByDay(
      {required String day}) async {
    try {
      List<Meal> mealsList = filterMealsByDay(day: day);

      return right(mealsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }

  filterMealsByDay({required String day}) {
    return daysDietList
        .firstWhere(
          (dayMeals) => dayMeals.day == day,
        )
        .meals;
  }
}

List<Map<String, dynamic>> convertToDesiredStructure(
    Map<String, dynamic> originalResponse) {
  final List<Map<String, dynamic>> result = [];

  final dailyPlans = originalResponse['plan']?['daily_plans'];
  if (dailyPlans is List) {
    for (var dayPlan in dailyPlans) {
      final String day = dayPlan['day'];
      final meals = dayPlan['meals'];

      final List<Map<String, dynamic>> mealList = [];

      meals?.forEach((mealType, mealDetails) {
        mealList.add({
          "mealType": mealType,
          "main": mealDetails["main"],
          "alternatives": mealDetails["alternatives"],
        });
      });

      result.add({
        "day": day,
        "meals": mealList,
      });
    }
  }

  return result;
}
