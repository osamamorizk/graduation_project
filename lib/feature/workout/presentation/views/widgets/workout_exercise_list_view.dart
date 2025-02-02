import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/workout/presentation/manger/worlout_cubit/workout_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_item.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_shimer_list.dart';

class WorkoutExerciseListView extends StatelessWidget {
  const WorkoutExerciseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        if (state is WorkoutByDaySuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.dailyWorkoutExercise.length,
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
          return const Workoutshimerlist();
        }
      },
    );
  }
}
