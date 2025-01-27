import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/or_widget.dart';

import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_listtile_with_ingrediants.dart';

class MealSecondItem extends StatelessWidget {
  const MealSecondItem({
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealListTileWithDetails(),

          OrWidget(),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10),
          //   child: Text(
          //     'Or:',
          //     style: TextStyles.font14BlackRegular,
          //   ),
          // ),
          MealListTileWithDetails(),
        ],
      ),
    );
  }
}
