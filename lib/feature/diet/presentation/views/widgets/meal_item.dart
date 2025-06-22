import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/container_info.dart';
import 'package:graduation_project/feature/diet/data/models/diet_plan_model/meal.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/food_meal_item.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ExpansionTile(
      backgroundColor: isDark ? ColorsManger.darkCard : Colors.white,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      collapsedShape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsManger.darkerGrey, width: .1),
          borderRadius: BorderRadius.circular(24)),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsManger.darkBlue, width: .1),
          borderRadius: BorderRadius.circular(24)),
      title: Row(
        children: [
          Text(
            meal.mealType ?? 'Meal',
            style: TextStyles.font16BlackBold,
          ),
          const Spacer(),
          ContainerIformation(
            data: '${meal.alternatives![0].calories!.toInt()} Cal',
          ),
        ],
      ),
      children: [
        const Divider(
          thickness: .4,
          indent: 15,
          endIndent: 15,
          height: 1,
        ),
        verticalSpace(10),
        FoodMealItem(
          meal: meal,
        ),
        verticalSpace(16),
        verticalSpace(16)
      ],
    );
  }
}
