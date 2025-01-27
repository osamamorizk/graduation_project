import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class MealIngrediantsInfo extends StatelessWidget {
  const MealIngrediantsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Carbs: 45g',
          style: TextStyles.font14BlueRegular,
        ),
        const Text('|'),
        Text('Fat: 2g', style: TextStyles.font14BlueRegular),
        const Text('|'),
        Text('Protein: 50g', style: TextStyles.font14BlueRegular),
      ],
    );
  }
}
