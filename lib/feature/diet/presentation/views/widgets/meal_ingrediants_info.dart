import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/diet/data/models/diet/item.model.dart';

class MealIngrediantsInfo extends StatelessWidget {
  const MealIngrediantsInfo({
    super.key,
    required this.item,
  });
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Carbs: ${item.macronutrients!.carbs}',
          style: TextStyles.font14BlueRegular,
        ),
        const Text('|'),
        Text('Fat:  ${item.macronutrients!.fat}',
            style: TextStyles.font14BlueRegular),
        const Text('|'),
        Text('Protein:  ${item.macronutrients!.protein}',
            style: TextStyles.font14BlueRegular),
      ],
    );
  }
}
