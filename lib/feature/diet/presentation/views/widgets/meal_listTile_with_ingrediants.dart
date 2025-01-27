import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_ingrediants_info.dart';

class MealListTileWithDetails extends StatelessWidget {
  const MealListTileWithDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            'Toast',
            style: TextStyles.font14BlackBold,
          ),
          const Spacer(),
          Text(
            '2 slice',
            style: TextStyles.font14BlackRegular,
          ),
        ],
      ),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: MealIngrediantsInfo(),
      ),
    );
  }
}
