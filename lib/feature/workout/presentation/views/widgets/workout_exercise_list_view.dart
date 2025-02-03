import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return SliverList(
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
              child: ErrorView(errorMessage: state.errorMessage));
        } else {
          return const SliverShimmerLoading(
            hight: 140,
          );
        }
      },
    );
  }
}
