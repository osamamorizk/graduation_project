class ScanFoodModel {
  final String item;
  final String calories;
  final String protein;
  final String carbs;
  final String fats;
  final String sugar;

  ScanFoodModel({
    required this.item,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.sugar,
  });

  factory ScanFoodModel.fromJson(foodJson) {
    // final List<dynamic>? nutritionalInfo = json['nutritional_info'];

    // if (nutritionalInfo == null || nutritionalInfo.isEmpty) {
    //   throw Exception("No nutritional info available");
    // }

    // final Map<String, dynamic> foodJson = nutritionalInfo.first;

    return ScanFoodModel(
      item: foodJson["Item"],
      calories: foodJson["Calories per 100 gms"],
      protein: foodJson["Protein per 100 gms"],
      carbs: foodJson["Carbs per 100 gms"],
      fats: foodJson["Fats per 100 gms"],
      sugar: foodJson["Sugar per 100 gms"],
    );
  }
}
