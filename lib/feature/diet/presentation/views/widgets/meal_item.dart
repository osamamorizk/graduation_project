import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/container_info.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_second_item.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/food_meal_item.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
  });

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
            'Launch',
            style: TextStyles.font16BlackBold,
          ),
          const Spacer(),
          const ContainerIformation(
            data: '200 Cal',
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
        verticalSpace(16),
        const FoodMealItem(),
        verticalSpace(16),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 8),
        //   child: Text(
        //     'With',
        //     style: TextStyles.font14BlackRegular,
        //   ),
        // ),
        const MealSecondItem(),
        verticalSpace(16)
      ],
    );
  }
}
