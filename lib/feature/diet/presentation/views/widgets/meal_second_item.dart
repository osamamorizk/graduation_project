import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/or_widget.dart';
import 'package:graduation_project/feature/diet/data/models/diet/item.model.dart';

import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_listtile_with_ingrediants.dart';

class MealSecondItem extends StatelessWidget {
  const MealSecondItem({
    super.key,
    required this.mealItem,
  });
  final Item mealItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ColorsManger.darkGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealListTileWithDetails(
            item: mealItem,
          ),
          const OrWidget(),
          MealListTileWithDetails(
            item: mealItem,
          ),
        ],
      ),
    );
  }
}
