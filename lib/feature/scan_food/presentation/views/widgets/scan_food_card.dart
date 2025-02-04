import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/dish_nutration_info.dart';

class FoodElementCardItem extends StatelessWidget {
  const FoodElementCardItem({
    super.key,
    required this.scanFoodModel,
  });
  final ScanFoodModel scanFoodModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              scanFoodModel.item,
              style: TextStyles.font28DarkBlueBold,
            ),
            verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NutrientInfo(
                    icon: Icons.local_fire_department,
                    value: "${scanFoodModel.calories} cal",
                    label: "Calories",
                    color: Colors.orange),
                NutrientInfo(
                    icon: Icons.egg_alt_outlined,
                    value: "${scanFoodModel.protein} gm",
                    label: "Protein",
                    color: Colors.purple),
              ],
            ),
            verticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NutrientInfo(
                    icon: Icons.water_drop_outlined,
                    value: "${scanFoodModel.fats} gm",
                    label: "Fat",
                    color: Colors.black),
                NutrientInfo(
                    icon: FontAwesomeIcons.cookieBite,
                    value: "${scanFoodModel.carbs} gm",
                    label: "Carbs",
                    color: Colors.green),
              ],
            ),
            verticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NutrientInfo(
                    icon: FontAwesomeIcons.apple,
                    value: "${scanFoodModel.sugar} gm",
                    label: "Sugar",
                    color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
