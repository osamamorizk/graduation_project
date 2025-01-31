class ProgressTracking {
  String? instruction;

  ProgressTracking({this.instruction});

  factory ProgressTracking.fromJson(Map<String, dynamic> json) {
    return ProgressTracking(
      instruction: json['Instruction'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Instruction': instruction,
      };
}
