import 'package:flutter/material.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_item.dart';

class DietMealsListView extends StatelessWidget {
  const DietMealsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: MealItem(),
          );
        },
      ),
    );
  }
}
