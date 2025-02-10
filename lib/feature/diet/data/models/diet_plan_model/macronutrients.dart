class Macronutrients {
  int? carbs;
  int? protein;
  int? fat;

  Macronutrients({this.carbs, this.protein, this.fat});

  factory Macronutrients.fromJson(Map<String, dynamic> json) {
    return Macronutrients(
      carbs: json['carbs'] as int?,
      protein: json['protein'] as int?,
      fat: json['fat'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'carbs': carbs,
        'protein': protein,
        'fat': fat,
      };
}
