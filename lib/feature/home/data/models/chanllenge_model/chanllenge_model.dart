import 'level.dart';

class ChallengeModel {
  String? challengeTitle;
  String? description;
  bool? isStarted;
  DateTime? startedAt;
  dynamic completedAt;
  int? currentDay;
  int? currentLevel;
  int? totalDays;
  int? completedDaysCount;
  double? progressPercentage;
  bool? isChallengeCompleted;
  List<Level>? levels;

  ChallengeModel({
    this.challengeTitle,
    this.description,
    this.isStarted,
    this.startedAt,
    this.completedAt,
    this.currentDay,
    this.currentLevel,
    this.totalDays,
    this.completedDaysCount,
    this.progressPercentage,
    this.isChallengeCompleted,
    this.levels,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      challengeTitle: json['challengeTitle'] as String?,
      description: json['description'] as String?,
      isStarted: json['isStarted'] as bool?,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] as dynamic,
      currentDay: json['currentDay'] as int?,
      currentLevel: json['currentLevel'] as int?,
      totalDays: json['totalDays'] as int?,
      completedDaysCount: json['completedDaysCount'] as int?,
      progressPercentage: (json['progressPercentage'] as num?)?.toDouble(),
      isChallengeCompleted: json['isChallengeCompleted'] as bool?,
      levels: (json['levels'] as List<dynamic>?)
          ?.map((e) => Level.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'challengeTitle': challengeTitle,
        'description': description,
        'isStarted': isStarted,
        'startedAt': startedAt?.toIso8601String(),
        'completedAt': completedAt,
        'currentDay': currentDay,
        'currentLevel': currentLevel,
        'totalDays': totalDays,
        'completedDaysCount': completedDaysCount,
        'progressPercentage': progressPercentage,
        'isChallengeCompleted': isChallengeCompleted,
        'levels': levels?.map((e) => e.toJson()).toList(),
      };
}
