import 'macronutrients.dart';

class Alternative {
  String? name;
  String? portion;
  int? calories;
  Macronutrients? macronutrients;

  Alternative({
    this.name,
    this.portion,
    this.calories,
    this.macronutrients,
  });

  factory Alternative.fromJson(Map<String, dynamic> json) => Alternative(
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
