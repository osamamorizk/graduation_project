import 'daily_plan.model.dart';

class WeeklyPlan {
  int? weekNumber;
  List<DailyPlan>? dailyPlans;

  WeeklyPlan({this.weekNumber, this.dailyPlans});

  factory WeeklyPlan.fromJson(Map<String, dynamic> json) => WeeklyPlan(
        weekNumber: json['WeekNumber'] as int?,
        dailyPlans: (json['DailyPlans'] as List<dynamic>?)
            ?.map((e) => DailyPlan.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'WeekNumber': weekNumber,
        'DailyPlans': dailyPlans?.map((e) => e.toJson()).toList(),
      };
}
