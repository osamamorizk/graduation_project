import 'shopping_list.model.dart';

class Diet {
  String? duration;
  int? dailyCalories;
  String? macronutrientDistribution;

  List<ShoppingList>? shoppingList;

  List<String>? notes;

  Diet({
    this.duration,
    this.dailyCalories,
    this.macronutrientDistribution,
    this.shoppingList,
    this.notes,
  });

  factory Diet.fromJson(Map<String, dynamic> json) => Diet(
        duration: json['Duration'] as String?,
        dailyCalories: json['DailyCalories'] as int?,
        macronutrientDistribution: json['MacronutrientDistribution'] as String?,
        shoppingList: (json['ShoppingList'] as List<dynamic>?)
            ?.map((e) => ShoppingList.fromJson(e as Map<String, dynamic>))
            .toList(),
        notes: json['Notes'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'Duration': duration,
        'DailyCalories': dailyCalories,
        'MacronutrientDistribution': macronutrientDistribution,
        'ShoppingList': shoppingList?.map((e) => e.toJson()).toList(),
        'Notes': notes,
      };
}
