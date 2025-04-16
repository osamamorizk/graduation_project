import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/details_section.dart';

class GeneralPlanMealInformation extends StatelessWidget {
  const GeneralPlanMealInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(4),
        const DetailsSection(title: 'Ingredients', details: [
          '1 cup rolled oats',
          '2 cups water or milk',
          'Fresh fruit toppings',
          'A pinch of cinnamon',
          'Honey or maple syrup (optional)',
          'A handful of nuts or seeds for added crunch (optional)',
        ]),
        const DetailsSection(title: 'Steps', details: [
          'Cook oats with water/milk over medium heat for 5 minutes, stirring.',
          'Serve in a bowl and top with fresh fruit, cinnamon, and a drizzle of honey.',
        ]),
        const DetailsSection(title: 'Benefits', details: [
          'High in Fiber: Helps with digestion and keeps you full longer.',
          'Packed with Nutrients: Fresh fruits provide vitamins, minerals, and antioxidants.',
        ]),
      ],
    );
  }
}
