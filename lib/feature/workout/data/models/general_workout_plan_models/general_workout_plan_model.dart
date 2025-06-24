class GeneralWorkoutPLanModel {
  int? id;
  String? name;
  String? category;
  String? imageUrl;
  String? difficulty;
  int? duration;
  int? caloriesBurned;
  int? exerciseCount;

  GeneralWorkoutPLanModel(
      {this.id,
      this.name,
      this.category,
      this.imageUrl,
      this.difficulty,
      this.duration,
      this.caloriesBurned,
      this.exerciseCount});

  factory GeneralWorkoutPLanModel.fromJson(Map<String, dynamic> json) {
    return GeneralWorkoutPLanModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      imageUrl: json['imageUrl'] as String?,
      difficulty: json['difficulty'] as String?,
      duration: json['duration'] as int?,
      exerciseCount: json['exerciseCount'] as int?,
      caloriesBurned: json['caloriesBurned'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'imageUrl': imageUrl,
        'difficulty': difficulty,
        'duration': duration,
      };
}
