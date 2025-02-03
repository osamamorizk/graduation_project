import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';

import 'package:graduation_project/feature/diet/data/models/diet_plan_model/diet_plan_model.dart';
import 'package:graduation_project/feature/diet/data/models/diet_plan_model/meal.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_repo.dart';

class DietRepoImpl implements DietRepo {
  final ApiService apiService;

  DietRepoImpl(this.apiService);
  List<DietPlanModel> daysDietList = [];
  @override
  Future<Either<Failure, List<DietPlanModel>>> getAllDiet(
      {required int id}) async {
    try {
      // var result =
      //     await apiService.get(endPoints: 'endPoints', queryParams: {'id': id});
      // Convert the map to the desired list structure
      final List<Map<String, dynamic>> transformedResponse =
          convertToDesiredStructure(originalResponse);
      for (var dietDay in transformedResponse) {
        daysDietList.add(DietPlanModel.fromJson(dietDay));
      }
      return right(daysDietList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log(e.toString());
        return left(ServerFailure(errorMessage: e.toString()));
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
        return left(ServerFailure(errorMessage: e.toString()));
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

// Original JSON response (map)
final Map<String, dynamic> originalResponse = {
  "saturday": {
    "breakfast": {
      "main": {
        "name": "Foul Medames",
        "portion": "1 bowl",
        "calories": 350,
        "macronutrients": {"carbs": 45, "protein": 15, "fat": 10}
      },
      "alternatives": [
        {
          "name": "Taameya Sandwich",
          "portion": "1 pita sandwich",
          "calories": 290,
          "macronutrients": {"carbs": 40, "protein": 10, "fat": 8}
        }
      ]
    },
    "lunch": {
      "main": {
        "name": "Grilled Chicken with Rice",
        "portion": "1 chicken breast with 1 cup of rice",
        "calories": 500,
        "macronutrients": {"carbs": 60, "protein": 35, "fat": 8}
      },
      "alternatives": [
        {
          "name": "Koshari",
          "portion": "1 serving",
          "calories": 600,
          "macronutrients": {"carbs": 95, "protein": 20, "fat": 10}
        }
      ]
    },
    "dinner": {
      "main": {
        "name": "Lentil Soup",
        "portion": "1 bowl",
        "calories": 250,
        "macronutrients": {"carbs": 30, "protein": 15, "fat": 5}
      },
      "alternatives": [
        {
          "name": "Molokhia with Beef",
          "portion": "1 serving",
          "calories": 400,
          "macronutrients": {"carbs": 20, "protein": 35, "fat": 15}
        }
      ]
    }
  },
  "sunday": {
    "breakfast": {
      "main": {
        "name": "Cheese with Tomatoes and Cucumbers",
        "portion": "1 plate",
        "calories": 280,
        "macronutrients": {"carbs": 15, "protein": 12, "fat": 18}
      },
      "alternatives": [
        {
          "name": "Oats with Honey",
          "portion": "1 bowl",
          "calories": 320,
          "macronutrients": {"carbs": 60, "protein": 10, "fat": 6}
        }
      ]
    },
    "lunch": {
      "main": {
        "name": "Stuffed Bell Peppers",
        "portion": "2 peppers",
        "calories": 400,
        "macronutrients": {"carbs": 50, "protein": 20, "fat": 10}
      },
      "alternatives": [
        {
          "name": "Fattah",
          "portion": "1 serving",
          "calories": 550,
          "macronutrients": {"carbs": 70, "protein": 20, "fat": 20}
        }
      ]
    },
    "dinner": {
      "main": {
        "name": "Roasted Vegetables with Quinoa",
        "portion": "1 plate",
        "calories": 300,
        "macronutrients": {"carbs": 50, "protein": 10, "fat": 5}
      },
      "alternatives": [
        {
          "name": "Shakshuka",
          "portion": "1 skillet",
          "calories": 350,
          "macronutrients": {"carbs": 25, "protein": 20, "fat": 15}
        }
      ]
    }
  }
};

// Print the transformed response
// print(transformedResponse);

List<Map<String, dynamic>> convertToDesiredStructure(
    Map<String, dynamic> originalResponse) {
  final List<Map<String, dynamic>> result = [];

  originalResponse.forEach((day, meals) {
    final List<Map<String, dynamic>> mealList = [];

    meals.forEach((mealType, mealDetails) {
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
  });

  return result;
}
