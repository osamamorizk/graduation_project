import 'macronutrients.model.dart';

class Alternative {
  String? name;
  String? portionSize;
  int? calories;
  Macronutrients? macronutrients;
  List<dynamic>? alternatives;

  Alternative({
    this.name,
    this.portionSize,
    this.calories,
    this.macronutrients,
    this.alternatives,
  });

  factory Alternative.fromJson(Map<String, dynamic> json) => Alternative(
        name: json['Name'] as String?,
        portionSize: json['PortionSize'] as String?,
        calories: json['Calories'] as int?,
        macronutrients: json['Macronutrients'] == null
            ? null
            : Macronutrients.fromJson(
                json['Macronutrients'] as Map<String, dynamic>),
        alternatives: json['Alternatives'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'PortionSize': portionSize,
        'Calories': calories,
        'Macronutrients': macronutrients?.toJson(),
        'Alternatives': alternatives,
      };
}
