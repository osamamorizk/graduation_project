import 'macros.dart';

class Item {
  String? foodName;
  String? servingSize;
  int? calories;
  Macros? macros;

  Item({this.foodName, this.servingSize, this.calories, this.macros});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        foodName: json['food_name'] as String?,
        servingSize: json['serving_size'] as String?,
        calories: json['calories'] as int?,
        macros: json['macros'] == null
            ? null
            : Macros.fromJson(json['macros'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'food_name': foodName,
        'serving_size': servingSize,
        'calories': calories,
        'macros': macros?.toJson(),
      };
}
