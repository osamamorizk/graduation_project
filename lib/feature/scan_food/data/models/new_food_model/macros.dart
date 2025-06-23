class Macros {
  String? protein;
  String? fat;
  String? carbohydrates;

  Macros({this.protein, this.fat, this.carbohydrates});

  factory Macros.fromJson(Map<String, dynamic> json) => Macros(
        protein: json['protein'] as String?,
        fat: json['fat'] as String?,
        carbohydrates: json['carbohydrates'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'protein': protein,
        'fat': fat,
        'carbohydrates': carbohydrates,
      };
}
