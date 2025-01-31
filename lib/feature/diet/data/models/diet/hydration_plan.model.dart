class HydrationPlan {
  String? time;
  String? instruction;

  HydrationPlan({this.time, this.instruction});

  factory HydrationPlan.fromJson(Map<String, dynamic> json) => HydrationPlan(
        time: json['Time'] as String?,
        instruction: json['Instruction'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Time': time,
        'Instruction': instruction,
      };
}
