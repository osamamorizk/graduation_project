import 'exercise.dart';

class Day {
  int? day;
  String? name;
  List<Exercise>? exercises;

  Day({this.day, this.name, this.exercises});

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        day: json['day'] as int?,
        name: json['name'] as String?,
        exercises: (json['exercises'] as List<dynamic>?)
            ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'name': name,
        'exercises': exercises?.map((e) => e.toJson()).toList(),
      };
}
