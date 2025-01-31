import 'meal.model.dart';

class DailyPlan {
  String? day;
  List<Meal>? meals;

  DailyPlan({this.day, this.meals});

  factory DailyPlan.fromJson(Map<String, dynamic> json) => DailyPlan(
        day: json['Day'] as String?,
        meals: (json['Meals'] as List<dynamic>?)
            ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Day': day,
        'Meals': meals?.map((e) => e.toJson()).toList(),
      };
}
