import 'breakfast.dart';
import 'dinner.dart';
import 'lunch.dart';

class DietGpDetailsModel {
  int? id;
  String? name;
  String? category;
  String? description;
  String? imageUrl;
  int? duration;
  int? dailyCalories;
  String? difficulty;
  String? goals;
  int? proteinPercentage;
  int? carbPercentage;
  int? fatPercentage;
  String? keyFeatures;
  String? benefits;
  String? videoUrl;
  List<Breakfast>? breakfast;
  List<Lunch>? lunch;
  List<Dinner>? dinner;

  DietGpDetailsModel({
    this.id,
    this.name,
    this.category,
    this.description,
    this.imageUrl,
    this.duration,
    this.dailyCalories,
    this.difficulty,
    this.goals,
    this.proteinPercentage,
    this.carbPercentage,
    this.fatPercentage,
    this.keyFeatures,
    this.benefits,
    this.videoUrl,
    this.breakfast,
    this.lunch,
    this.dinner,
  });

  factory DietGpDetailsModel.fromJson(Map<String, dynamic> json) {
    return DietGpDetailsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      duration: json['duration'] as int?,
      dailyCalories: json['dailyCalories'] as int?,
      difficulty: json['difficulty'] as String?,
      goals: json['goals'] as String?,
      proteinPercentage: json['proteinPercentage'] as int?,
      carbPercentage: json['carbPercentage'] as int?,
      fatPercentage: json['fatPercentage'] as int?,
      keyFeatures: json['keyFeatures'] as String?,
      benefits: json['benefits'] as String?,
      videoUrl: json['videoUrl'] as String?,
      breakfast: (json['breakfast'] as List<dynamic>?)
          ?.map((e) => Breakfast.fromJson(e as Map<String, dynamic>))
          .toList(),
      lunch: (json['lunch'] as List<dynamic>?)
          ?.map((e) => Lunch.fromJson(e as Map<String, dynamic>))
          .toList(),
      dinner: (json['dinner'] as List<dynamic>?)
          ?.map((e) => Dinner.fromJson(e as Map<String, dynamic>))
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
        'dailyCalories': dailyCalories,
        'difficulty': difficulty,
        'goals': goals,
        'proteinPercentage': proteinPercentage,
        'carbPercentage': carbPercentage,
        'fatPercentage': fatPercentage,
        'keyFeatures': keyFeatures,
        'benefits': benefits,
        'videoUrl': videoUrl,
        'breakfast': breakfast?.map((e) => e.toJson()).toList(),
        'lunch': lunch?.map((e) => e.toJson()).toList(),
        'dinner': dinner?.map((e) => e.toJson()).toList(),
      };
}
