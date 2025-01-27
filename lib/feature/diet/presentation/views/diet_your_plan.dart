import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';

import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_item.dart';

class DietYourPlan extends StatelessWidget {
  const DietYourPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(16),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => verticalSpace(16),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const MealItem();
              },
            ),
          )
        ],
      ),
    );
  }
}
