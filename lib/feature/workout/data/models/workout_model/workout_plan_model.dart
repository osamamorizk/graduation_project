import 'exercise.dart';

class WorkoutPlanModel {
  String? day;
  String? focus;
  List<WorkoutExerciseModel>? exercises;

  WorkoutPlanModel({this.day, this.focus, this.exercises});

  factory WorkoutPlanModel.fromJson(Map<String, dynamic> json) =>
      WorkoutPlanModel(
        day: json['Day'] as String?,
        focus: json['Focus'] as String?,
        exercises: (json['Exercises'] as List<dynamic>?)
            ?.map(
                (e) => WorkoutExerciseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Day': day,
        'Focus': focus,
        'Exercises': exercises?.map((e) => e.toJson()).toList(),
      };
}
