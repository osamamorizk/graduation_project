import 'macronutrients.dart';

class FoodMealModel {
  String? name;
  String? portion;
  int? calories;
  Macronutrients? macronutrients;

  FoodMealModel({this.name, this.portion, this.calories, this.macronutrients});

  factory FoodMealModel.fromJson(Map<String, dynamic> json) => FoodMealModel(
        name: json['name'] as String?,
        portion: json['portion'] as String?,
        calories: json['calories'] as int?,
        macronutrients: json['macronutrients'] == null
            ? null
            : Macronutrients.fromJson(
                json['macronutrients'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'portion': portion,
        'calories': calories,
        'macronutrients': macronutrients?.toJson(),
      };
}
