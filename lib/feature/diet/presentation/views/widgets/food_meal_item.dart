import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/or_widget.dart';
import 'package:graduation_project/feature/diet/data/models/diet/item.model.dart';

import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_listtile_with_ingrediants.dart';

class FoodMealItem extends StatelessWidget {
  const FoodMealItem({
    super.key,
    required this.item,
    this.color,
  });
  final Item item;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ColorsManger.darkGrey),
      ),
      child: Column(
        children: [
          MealListTileWithDetails(
            item: item,
          ),
          if (item.alternatives != null && item.alternatives!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrWidget(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: FoodMealItem(
                    color: Colors.white,
                    item: item.alternatives![0],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
