import 'exercise.dart';

class WorkoutPlanModel {
  String? day;
  String? focus;
  List<WorkoutExerciseModel>? exercises;

  WorkoutPlanModel({this.day, this.focus, this.exercises});

  factory WorkoutPlanModel.fromJson(Map<String, dynamic> json) =>
      WorkoutPlanModel(
        day: json['day'] as String?,
        focus: json['focus'] as String?,
        exercises: (json['exercises'] as List<dynamic>?)
            ?.map(
                (e) => WorkoutExerciseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
