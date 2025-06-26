import 'day.dart';

class LevelModel {
  int? levelId;
  String? title;
  String? description;
  bool? isUnlocked;
  bool? isCompleted;
  int? startDay;
  int? endDay;
  List<Day>? days;

  LevelModel({
    this.levelId,
    this.title,
    this.description,
    this.isUnlocked,
    this.isCompleted,
    this.startDay,
    this.endDay,
    this.days,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        levelId: json['levelId'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        isUnlocked: json['isUnlocked'] as bool?,
        isCompleted: json['isCompleted'] as bool?,
        startDay: json['startDay'] as int?,
        endDay: json['endDay'] as int?,
        days: (json['days'] as List<dynamic>?)
            ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'levelId': levelId,
        'title': title,
        'description': description,
        'isUnlocked': isUnlocked,
        'isCompleted': isCompleted,
        'startDay': startDay,
        'endDay': endDay,
        'days': days?.map((e) => e.toJson()).toList(),
      };
}
