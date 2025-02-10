class ExerciseModel {
  final String name;
  final String videoUrl;
  final String image;
  final String sets;

  ExerciseModel({
    required this.name,
    required this.videoUrl,
    required this.image,
    required this.sets,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      name: json['name'],
      sets: json['sets'],
      image: json['icon'],
      videoUrl: json['videoUrl'],
    );
  }
}
