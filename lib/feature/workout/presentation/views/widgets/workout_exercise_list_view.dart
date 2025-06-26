import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_action_button.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/sliver_shimmer_loading.dart';
import 'package:graduation_project/feature/workout/presentation/manger/worlout_cubit/workout_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_item.dart';

class WorkoutExerciseListView extends StatelessWidget {
  const WorkoutExerciseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        if (state is WorkoutByDaySuccess) {
          return state.dailyWorkoutExercise.isEmpty
              ? const SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No exercises for this day',
                      ),
                    ],
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: WorkoutItem(
                          exercise: state.dailyWorkoutExercise[index],
                        ),
                      );
                    },
                    childCount: state.dailyWorkoutExercise.length,
                  ),
                );
        } else if (state is WorkoutByDayFailure) {
          return SliverToBoxAdapter(
              child: Column(
            children: [
              ErrorView(errorMessage: state.errorMessage),
              if (state.errorMessage == 'Not Found')
                CustomButton(
                  text: 'Update your data and create new plan',
                  onPressed: () {
                    context.pushNamed(Routes.dataForm, arguments: 'all');
                  },
                )
            ],
          ));
        } else {
          return const SliverShimmerLoading(
            height: 140,
          );
        }
      },
    );
  }
}
