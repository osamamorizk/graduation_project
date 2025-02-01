class Macronutrients {
  String? carbs;
  String? protein;
  String? fat;

  Macronutrients({this.carbs, this.protein, this.fat});

  factory Macronutrients.fromJson(Map<String, dynamic> json) {
    return Macronutrients(
      carbs: json['Carbs'] as String?,
      protein: json['Protein'] as String?,
      fat: json['Fat'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Carbs': carbs,
        'Protein': protein,
        'Fat': fat,
      };
}
