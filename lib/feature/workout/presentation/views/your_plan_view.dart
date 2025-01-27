import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/days_list.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_item.dart';

class WorkoutYourPlanView extends StatelessWidget {
  const WorkoutYourPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(16),
            const DaysList(),
            verticalSpace(16),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: WorkoutItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
