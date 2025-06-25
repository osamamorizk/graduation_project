import 'macros.dart';

class GpMealDetailsModel {
  int? id;
  String? name;
  String? imageUrl;
  String? videoUrl;
  int? calories;
  int? time;
  Macros? macros;
  List<dynamic>? ingredients;
  List<dynamic>? steps;
  List<dynamic>? benefits;

  GpMealDetailsModel({
    this.id,
    this.name,
    this.imageUrl,
    this.videoUrl,
    this.calories,
    this.time,
    this.macros,
    this.ingredients,
    this.steps,
    this.benefits,
  });

  factory GpMealDetailsModel.fromJson(Map<String, dynamic> json) {
    return GpMealDetailsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      calories: json['calories'] as int?,
      time: json['time'] as int?,
      macros: json['macros'] == null
          ? null
          : Macros.fromJson(json['macros'] as Map<String, dynamic>),
      ingredients: json['ingredients'],
      steps: json['steps'],
      benefits: json['benefits'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        'calories': calories,
        'time': time,
        'macros': macros?.toJson(),
        'ingredients': ingredients,
        'steps': steps,
        'benefits': benefits,
      };
}
