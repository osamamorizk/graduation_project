class Macros {
  int? fat;
  int? protein;
  int? carbs;

  Macros({this.fat, this.protein, this.carbs});

  factory Macros.fromJson(Map<String, dynamic> json) => Macros(
        fat: json['fat'] as int?,
        protein: json['protein'] as int?,
        carbs: json['carbs'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'fat': fat,
        'protein': protein,
        'carbs': carbs,
      };
}
