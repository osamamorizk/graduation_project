import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/container_info.dart';
import 'package:graduation_project/feature/diet/data/models/diet/meal.model.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/food_meal_item.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      collapsedShape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsManger.darkerGrey, width: .5),
          borderRadius: BorderRadius.circular(24)),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsManger.darkBlue, width: .5),
          borderRadius: BorderRadius.circular(24)),
      title: Row(
        children: [
          Text(
            meal.name ?? 'Meal',
            style: TextStyles.font16BlackBold,
          ),
          const Spacer(),
          ContainerIformation(
            data: '${meal.items![0].calories} Cal',
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
        for (var item in meal.items ?? [])
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: FoodMealItem(mealItem: item),
          ),
        verticalSpace(16),
        verticalSpace(16)
      ],
    );
  }
}
