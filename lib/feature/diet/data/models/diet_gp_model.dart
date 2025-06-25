class DietGpModel {
  int? id;
  String? name;
  String? category;
  String? imageUrl;
  String? difficulty;
  int? duration;
  int? dailyCalories;

  DietGpModel({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.difficulty,
    this.duration,
    this.dailyCalories,
  });

  factory DietGpModel.fromJson(Map<String, dynamic> json) => DietGpModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        category: json['category'] as String?,
        imageUrl: json['imageUrl'] as String?,
        difficulty: json['difficulty'] as String?,
        duration: json['duration'] as int?,
        dailyCalories: json['dailyCalories'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'imageUrl': imageUrl,
        'difficulty': difficulty,
        'duration': duration,
        'dailyCalories': dailyCalories,
      };
}
