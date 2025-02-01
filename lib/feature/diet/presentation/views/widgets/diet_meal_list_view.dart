import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_cubit.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/meal_item.dart';

class DietMealsListView extends StatelessWidget {
  const DietMealsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCubit, DietCubitState>(
      buildWhen: (previous, current) =>
          current is GetMealsByDaySuccess || current is GetMealsByDayFailure,
      builder: (context, state) {
        if (state is GetMealsByDaySuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.dayMeals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: MealItem(
                    meal: state.dayMeals[index],
                  ),
                );
              },
            ),
          );
        } else if (state is GetMealsByDayFailure) {
          return Text(state.errorMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
