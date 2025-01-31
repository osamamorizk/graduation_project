import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/container_info.dart';
import 'package:graduation_project/feature/diet/data/models/diet/item.model.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_ingrediants_info.dart';

class MealListTileWithDetails extends StatelessWidget {
  const MealListTileWithDetails({
    super.key,
    required this.item,
  });
  final Item item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 40,
      title: Row(
        children: [
          SizedBox(
            width: 150.w,
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              item.name ?? 'Name',
              style: TextStyles.font14BlackBold,
            ),
          ),
          const Spacer(),
          ContainerIformation(data: item.portionSize ?? 'slice')
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: MealIngrediantsInfo(
          item: item,
        ),
      ),
    );
  }
}
