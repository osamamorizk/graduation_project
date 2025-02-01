import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_days_list.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_exercise_list_view.dart';

class WorkoutYourPlanView extends StatelessWidget {
  const WorkoutYourPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(16),
          const WorkoutDaysList(),
          verticalSpace(16),
          const WorkoutExerciseListView(),
        ],
      ),
    );
  }
}
