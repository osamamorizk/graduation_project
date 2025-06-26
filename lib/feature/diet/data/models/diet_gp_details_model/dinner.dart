class Dinner {
  int? id;
  String? name;
  String? imageUrl;
  int? calories;
  int? time;

  Dinner({this.id, this.name, this.imageUrl, this.calories, this.time});

  factory Dinner.fromJson(Map<String, dynamic> json) => Dinner(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
        calories: json['calories'] as int?,
        time: json['time'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'calories': calories,
        'time': time,
      };
}
