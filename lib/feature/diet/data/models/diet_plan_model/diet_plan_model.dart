import 'meal.dart';

class DietPlanModel {
  String? day;
  List<Meal>? meals;

  DietPlanModel({this.day, this.meals});

  factory DietPlanModel.fromJson(Map<String, dynamic> json) => DietPlanModel(
        day: json['day'] as String?,
        meals: (json['meals'] as List<dynamic>?)
            ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'meals': meals?.map((e) => e.toJson()).toList(),
      };
}
