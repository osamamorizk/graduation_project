import 'alternative.model.dart';
import 'macronutrients.model.dart';

class Item {
  String? name;
  String? portionSize;
  int? calories;
  Macronutrients? macronutrients;
  List<Alternative>? alternatives;

  Item({
    this.name,
    this.portionSize,
    this.calories,
    this.macronutrients,
    this.alternatives,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json['Name'] as String?,
        portionSize: json['PortionSize'],
        calories: json['Calories'] as int?,
        macronutrients: json['Macronutrients'] == null
            ? null
            : Macronutrients.fromJson(
                json['Macronutrients'] as Map<String, dynamic>),
        alternatives: (json['Alternatives'] as List<dynamic>?)
            ?.map((e) => Alternative.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'PortionSize': portionSize,
        'Calories': calories,
        'Macronutrients': macronutrients?.toJson(),
        'Alternatives': alternatives?.map((e) => e.toJson()).toList(),
      };
}
