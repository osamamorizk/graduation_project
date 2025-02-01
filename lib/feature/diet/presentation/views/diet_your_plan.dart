import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/diet_days_list.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/diet_meal_list_view.dart';

class DietYourPlan extends StatelessWidget {
  const DietYourPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(16),
          const DietDaysList(),
          verticalSpace(16),
          const DietMealsListView()
        ],
      ),
    );
  }
}
