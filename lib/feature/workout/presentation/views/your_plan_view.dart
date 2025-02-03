import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/sticky_hidder_for_days.dart';
import 'package:graduation_project/feature/workout/presentation/manger/worlout_cubit/workout_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_days_list.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_exercise_list_view.dart';

class WorkoutYourPlanView extends StatelessWidget {
  const WorkoutYourPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: ColorsManger.darkBlue,
      onRefresh: () async {
        return context.read<WorkoutCubit>().getWorkoutPlans(id: 15);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: StickyHeaderDelegate(
                child: const WorkoutDaysList(),
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(8)),
            const WorkoutExerciseListView()
          ],
        ),
      ),
    );
  }
}
