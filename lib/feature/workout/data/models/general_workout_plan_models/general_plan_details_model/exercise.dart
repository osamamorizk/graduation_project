class Exercise {
  int? id;
  String? name;
  String? imageUrl;
  int? sets;
  int? reps;
  int? duration;
  int? restTime;

  Exercise({
    this.id,
    this.name,
    this.imageUrl,
    this.sets,
    this.reps,
    this.duration,
    this.restTime,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
        sets: json['sets'] as int?,
        reps: json['reps'] as int?,
        duration: json['duration'] as int?,
        restTime: json['restTime'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'sets': sets,
        'reps': reps,
        'duration': duration,
        'restTime': restTime,
      };
}
