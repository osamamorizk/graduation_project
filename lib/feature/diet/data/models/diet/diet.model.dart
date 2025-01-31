import 'hydration_plan.model.dart';
import 'progress_tracking.model.dart';
import 'shopping_list.model.dart';
import 'weekly_plan.model.dart';

class Diet {
  String? duration;
  int? dailyCalories;
  String? macronutrientDistribution;
  List<WeeklyPlan>? weeklyPlans;
  List<ShoppingList>? shoppingList;
  List<HydrationPlan>? hydrationPlan;
  List<ProgressTracking>? progressTracking;
  List<String>? notes;

  Diet({
    this.duration,
    this.dailyCalories,
    this.macronutrientDistribution,
    this.weeklyPlans,
    this.shoppingList,
    this.hydrationPlan,
    this.progressTracking,
    this.notes,
  });

  factory Diet.fromJson(Map<String, dynamic> json) => Diet(
        duration: json['Duration'] as String?,
        dailyCalories: json['DailyCalories'] as int?,
        macronutrientDistribution: json['MacronutrientDistribution'] as String?,
        weeklyPlans: (json['WeeklyPlans'] as List<dynamic>?)
            ?.map((e) => WeeklyPlan.fromJson(e as Map<String, dynamic>))
            .toList(),
        shoppingList: (json['ShoppingList'] as List<dynamic>?)
            ?.map((e) => ShoppingList.fromJson(e as Map<String, dynamic>))
            .toList(),
        hydrationPlan: (json['HydrationPlan'] as List<dynamic>?)
            ?.map((e) => HydrationPlan.fromJson(e as Map<String, dynamic>))
            .toList(),
        progressTracking: (json['ProgressTracking'] as List<dynamic>?)
            ?.map((e) => ProgressTracking.fromJson(e as Map<String, dynamic>))
            .toList(),
        notes: json['Notes'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'Duration': duration,
        'DailyCalories': dailyCalories,
        'MacronutrientDistribution': macronutrientDistribution,
        'WeeklyPlans': weeklyPlans?.map((e) => e.toJson()).toList(),
        'ShoppingList': shoppingList?.map((e) => e.toJson()).toList(),
        'HydrationPlan': hydrationPlan?.map((e) => e.toJson()).toList(),
        'ProgressTracking': progressTracking?.map((e) => e.toJson()).toList(),
        'Notes': notes,
      };
}
