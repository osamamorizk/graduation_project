import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/workout/presentation/manger/worlout_cubit/workout_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/muscle_group_view.dart';
import 'package:graduation_project/feature/workout/presentation/views/general_plans_view.dart';
import 'package:graduation_project/core/widgets/custom_new_plan_button.dart';
import 'package:graduation_project/feature/workout/presentation/views/your_plan_view.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: taps.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: .4,
          automaticallyImplyLeading: false,
          toolbarHeight: 45,
          title: Text(
            'Workout',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: [
            CustomNewPlanButton(
              type: 'Do you want to create new workout plan?',
              buttonText: 'New workout plan',
              onPressed: () {
                context.pop();

                context.read<WorkoutCubit>().changeWorkoutPlans();
              },
            ),
          ],
          bottom: TabBar(
            labelPadding: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: TextStyles.font14Regular,
            tabs: const [
              Tab(
                text: 'Your plan',
              ),
              Tab(
                text: 'Exercises',
              ),
              Tab(
                text: 'General plans',
              ),
            ],
          ),
        ),
        body: TabBarView(children: taps),
      ),
    );
  }
}

List<Widget> taps = [
  const WorkoutYourPlanView(),
  const MuscleGroupView(),
  const WorkoutGeneralPlansView(),
];
