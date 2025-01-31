import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/feature/workout/presentation/manger/cubit/workout_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_days_list.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_item.dart';

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
          BlocBuilder<WorkoutCubit, WorkoutState>(
            builder: (context, state) {
              if (state is WorkoutByDaySuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: WorkoutItem(
                        exercise: state.dailyWorkoutExercise[index],
                      ),
                    ),
                  ),
                );
              } else if (state is WorkoutByDayFailure) {
                return Text(state.errorMessage);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
