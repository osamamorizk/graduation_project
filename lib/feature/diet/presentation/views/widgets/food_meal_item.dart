import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/or_widget.dart';
import 'package:graduation_project/feature/diet/data/models/diet_plan_model/meal.dart';

import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_listtile_with_ingrediants.dart';

class FoodMealItem extends StatelessWidget {
  const FoodMealItem({
    super.key,
    this.color,
    required this.meal,
  });
  final Meal meal;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: color ??
            (isDark ? ColorsManger.darkCard : ColorsManger.lighterGrey),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ColorsManger.darkGrey, width: .3),
      ),
      child: Column(
        children: [
          MealListTileWithDetails(
            foodMealModel: meal.foodMealModel!,
          ),
          if (meal.alternatives != null && meal.alternatives!.isNotEmpty)
            Column(
              children: [
                const OrWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: MealListTileWithDetails(
                    foodMealModel: meal.alternatives![0],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
