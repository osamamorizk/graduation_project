class GeneralWorkoutExerciseDetailsModel {
  int? id;
  String? name;
  String? imageUrl;
  String? videoUrl;
  int? sets;
  int? reps;
  int? duration;
  int? restTime;
  String? targetMuscle;
  String? equipment;
  String? difficulty;
  List<dynamic>? instructions;
  List<dynamic>? tips;
  List<dynamic>? benefits;

  GeneralWorkoutExerciseDetailsModel({
    this.id,
    this.name,
    this.imageUrl,
    this.videoUrl,
    this.sets,
    this.reps,
    this.duration,
    this.restTime,
    this.targetMuscle,
    this.equipment,
    this.difficulty,
    this.instructions,
    this.tips,
    this.benefits,
  });

  factory GeneralWorkoutExerciseDetailsModel.fromJson(
      Map<String, dynamic> json) {
    return GeneralWorkoutExerciseDetailsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      sets: json['sets'] as int?,
      reps: json['reps'] as int?,
      duration: json['duration'] as int?,
      restTime: json['restTime'] as int?,
      targetMuscle: json['targetMuscle'] as String?,
      equipment: json['equipment'] as String?,
      difficulty: json['difficulty'] as String?,
      instructions: json['instructions'],
      tips: json['tips'],
      benefits: json['benefits'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        'sets': sets,
        'reps': reps,
        'duration': duration,
        'restTime': restTime,
        'targetMuscle': targetMuscle,
        'equipment': equipment,
        'difficulty': difficulty,
        'instructions': instructions,
        'tips': tips,
        'benefits': benefits,
      };
}
