import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/widgets/container_info.dart';
import 'package:graduation_project/feature/diet/data/models/diet_plan_model/food_meal_model.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_ingrediants_info.dart';

class MealListTileWithDetails extends StatelessWidget {
  const MealListTileWithDetails({
    super.key,
    required this.foodMealModel,
  });
  final FoodMealModel foodMealModel;
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
              foodMealModel.name ?? 'Name',
            ),
          ),
          const Spacer(),
          ContainerIformation(data: '${foodMealModel.portion ?? 200}'),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: MealIngrediantsInfo(
          foodMealModel: foodMealModel,
        ),
      ),
    );
  }
}
