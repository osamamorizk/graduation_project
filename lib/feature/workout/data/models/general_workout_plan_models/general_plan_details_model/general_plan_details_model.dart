import 'day.dart';

class GeneralWorkoutPlanDetailsModel {
  int? id;
  String? name;
  String? category;
  String? description;
  String? imageUrl;
  int? duration;
  int? exerciseCount;
  String? difficulty;
  String? goals;
  int? caloriesBurned;
  String? keyFeatures;
  String? benefits;
  String? targetMuscles;
  String? equipment;
  String? videoUrl;
  List<Day>? days;

  GeneralWorkoutPlanDetailsModel({
    this.id,
    this.name,
    this.category,
    this.description,
    this.imageUrl,
    this.duration,
    this.exerciseCount,
    this.difficulty,
    this.goals,
    this.caloriesBurned,
    this.keyFeatures,
    this.benefits,
    this.targetMuscles,
    this.equipment,
    this.videoUrl,
    this.days,
  });

  factory GeneralWorkoutPlanDetailsModel.fromJson(Map<String, dynamic> json) {
    return GeneralWorkoutPlanDetailsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      duration: json['duration'] as int?,
      exerciseCount: json['exerciseCount'] as int?,
      difficulty: json['difficulty'] as String?,
      goals: json['goals'] as String?,
      caloriesBurned: json['caloriesBurned'] as int?,
      keyFeatures: json['keyFeatures'] as String?,
      benefits: json['benefits'] as String?,
      targetMuscles: json['targetMuscles'] as String?,
      equipment: json['equipment'] as String?,
      videoUrl: json['videoUrl'] as String?,
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'description': description,
        'imageUrl': imageUrl,
        'duration': duration,
        'exerciseCount': exerciseCount,
        'difficulty': difficulty,
        'goals': goals,
        'caloriesBurned': caloriesBurned,
        'keyFeatures': keyFeatures,
        'benefits': benefits,
        'targetMuscles': targetMuscles,
        'equipment': equipment,
        'videoUrl': videoUrl,
        'days': days?.map((e) => e.toJson()).toList(),
      };
}
