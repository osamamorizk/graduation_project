import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/diet/data/models/diet_plan_model/food_meal_model.dart';

class MealIngrediantsInfo extends StatelessWidget {
  const MealIngrediantsInfo({
    super.key,
    required this.foodMealModel,
  });
  final FoodMealModel foodMealModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Carbs: ${foodMealModel.macronutrients?.carbs ?? 15}',
          // style: TextStyles.font14BlueRegular,
        ),
        const Text('|'),
        Text(
          'Fat:  ${foodMealModel.macronutrients?.fat ?? 20}',
          // style: TextStyles.font14BlueRegular,
        ),
        const Text('|'),
        Text(
          'Protein:  ${foodMealModel.macronutrients?.protein ?? 30}',
          style: TextStyles.font14BlueRegular,
        ),
      ],
    );
  }
}
