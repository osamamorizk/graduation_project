import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/day_container.dart';
import 'package:graduation_project/feature/workout/presentation/manger/worlout_cubit/workout_cubit.dart';

class WorkoutDaysList extends StatefulWidget {
  const WorkoutDaysList({
    super.key,
  });

  @override
  State<WorkoutDaysList> createState() => _WorkoutDaysListState();
}

class _WorkoutDaysListState extends State<WorkoutDaysList>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: 32,
      child: BlocBuilder<WorkoutCubit, WorkoutState>(
        buildWhen: (previous, current) =>
            current is AllWorkoutSuccess || current is AllWorkoutFailure,
        builder: (context, state) {
          if (state is AllWorkoutSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.workoutPlansList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      context.read<WorkoutCubit>().getWorkoutByDay(
                          day: state.workoutPlansList[index].day ?? 'Day');
                    });
                  },
                  child: DayContainer(
                    isSelected: currentIndex == index,
                    day: state.workoutPlansList[index].day ?? 'Day',
                  ),
                );
              },
            );
          } else if (state is AllWorkoutFailure) {
            return Text(state.errorMessage);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
