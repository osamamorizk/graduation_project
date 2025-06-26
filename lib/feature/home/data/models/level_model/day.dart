class Day {
  int? dayNumber;
  String? title;
  String? description;
  String? tip;
  bool? isCompleted;
  bool? isUnlocked;
  DateTime? completedAt;

  Day({
    this.dayNumber,
    this.title,
    this.description,
    this.tip,
    this.isCompleted,
    this.isUnlocked,
    this.completedAt,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        dayNumber: json['dayNumber'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        tip: json['tip'] as String?,
        isCompleted: json['isCompleted'] as bool?,
        isUnlocked: json['isUnlocked'] as bool?,
        completedAt: json['completedAt'] == null
            ? null
            : DateTime.parse(json['completedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'dayNumber': dayNumber,
        'title': title,
        'description': description,
        'tip': tip,
        'isCompleted': isCompleted,
        'isUnlocked': isUnlocked,
        'completedAt': completedAt?.toIso8601String(),
      };
}
