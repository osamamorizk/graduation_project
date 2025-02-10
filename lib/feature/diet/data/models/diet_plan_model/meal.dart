import 'food_meal_model.dart';

class Meal {
  String? mealType;
  FoodMealModel? foodMealModel;
  List<FoodMealModel>? alternatives;

  Meal({this.mealType, this.foodMealModel, this.alternatives});

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        mealType: json['mealType'] as String?,
        foodMealModel: json['main'] == null
            ? null
            : FoodMealModel.fromJson(json['main'] as Map<String, dynamic>),
        alternatives: (json['alternatives'] as List<dynamic>?)
            ?.map((e) => FoodMealModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'mealType': mealType,
        'main': foodMealModel?.toJson(),
        'alternatives': alternatives?.map((e) => e.toJson()).toList(),
      };
}
