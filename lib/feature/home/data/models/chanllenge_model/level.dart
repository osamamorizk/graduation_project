class Level {
  int? levelId;
  String? title;
  String? description;
  bool? isUnlocked;
  bool? isCompleted;
  int? completedDaysCount;
  int? totalDaysCount;
  double? progressPercentage;
  int? startDay;
  int? endDay;

  Level({
    this.levelId,
    this.title,
    this.description,
    this.isUnlocked,
    this.isCompleted,
    this.completedDaysCount,
    this.totalDaysCount,
    this.progressPercentage,
    this.startDay,
    this.endDay,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        levelId: json['levelId'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        isUnlocked: json['isUnlocked'] as bool?,
        isCompleted: json['isCompleted'] as bool?,
        completedDaysCount: json['completedDaysCount'] as int?,
        totalDaysCount: json['totalDaysCount'] as int?,
        progressPercentage: (json['progressPercentage'] as num?)?.toDouble(),
        startDay: json['startDay'] as int?,
        endDay: json['endDay'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'levelId': levelId,
        'title': title,
        'description': description,
        'isUnlocked': isUnlocked,
        'isCompleted': isCompleted,
        'completedDaysCount': completedDaysCount,
        'totalDaysCount': totalDaysCount,
        'progressPercentage': progressPercentage,
        'startDay': startDay,
        'endDay': endDay,
      };
}
