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
        name: json['Name'] as String?,
        muscleGroup: json['MuscleGroup'] as String?,
        sets: json['Sets'] as int?,
        reps: json['Reps'] as String?,
        restBetweenSets: json['RestBetweenSets'] as String?,
        intensity: json['Intensity'] as String?,
        notes: json['Notes'][0],
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'MuscleGroup': muscleGroup,
        'Sets': sets,
        'Reps': reps,
        'RestBetweenSets': restBetweenSets,
        'Intensity': intensity,
        'Notes': notes,
      };
}
