import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/scan_food/data/models/new_food_model/item.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/dish_nutration_info.dart';

class FoodElementCardItem extends StatelessWidget {
  const FoodElementCardItem({
    super.key,
    required this.foodItem,
  });
  final Item foodItem;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              foodItem.foodName ?? "Unknown Food",
              style: TextStyles.font22Bold.copyWith(
                color: isDark ? Colors.white : ColorsManger.darkBlue,
              ),
            ),
            verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NutrientInfo(
                    icon: Icons.local_fire_department,
                    value: "${foodItem.calories} cal",
                    label: "Calories",
                    color: Colors.orange),
                NutrientInfo(
                    icon: Icons.egg_alt_outlined,
                    value: "${foodItem.macros?.protein}",
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
                    value: "${foodItem.macros?.fat}",
                    label: "Fat",
                    color: Colors.black),
                NutrientInfo(
                    icon: FontAwesomeIcons.cookieBite,
                    value: "${foodItem.macros?.carbohydrates}",
                    label: "Carbs",
                    color: Colors.green),
              ],
            ),
            verticalSpace(5),
          ],
        ),
      ),
    );
  }
}
