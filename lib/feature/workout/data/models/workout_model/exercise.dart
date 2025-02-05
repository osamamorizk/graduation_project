class WorkoutExerciseModel {
  String? name;
  String? muscleGroup;
  int? sets;
  String? reps;
  String? restBetweenSets;
  String? intensity;
  String? notes;

  WorkoutExerciseModel({
    this.name,
    this.muscleGroup,
    this.sets,
    this.reps,
    this.restBetweenSets,
    this.intensity,
    this.notes,
  });

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) =>
      WorkoutExerciseModel(
        name: json['name'] as String?,
        muscleGroup: json['muscle_group'] as String?,
        sets: json['sets'] as int?,
        reps: json['reps'] as String?,
        restBetweenSets: json['rest_between_sets'] as String?,
        intensity: json['intensity'] as String?,
        notes: json['notes'][0],
      );
}
