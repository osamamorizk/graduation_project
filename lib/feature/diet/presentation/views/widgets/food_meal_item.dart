import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_listtile_with_ingrediants.dart';

class FoodMealItem extends StatelessWidget {
  const FoodMealItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorsManger.lightGrey,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: ColorsManger.darkGrey),
        ),
        child: const MealListTileWithDetails());
  }
}
