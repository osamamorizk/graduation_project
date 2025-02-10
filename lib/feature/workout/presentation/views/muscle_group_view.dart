import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/workout/data/models/muscle_model.dart';
import 'package:graduation_project/feature/workout/presentation/manger/exercise_cubit/exercise_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/muscle_item.dart';

class MuscleGroupView extends StatelessWidget {
  const MuscleGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context
                .read<ExerciseCubit>()
                .getExerciseList(id: exerciseList[index].id);
            context.pushNamed(
              Routes.exerciseListView,
              arguments: {
                'exerciseGroup': exerciseList[index].name,
                'id': exerciseList[index].id,
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 16, top: index == 0 ? 16 : 0),
            child: MuscleItem(
              muscleModel: exerciseList[index],
            ),
          ),
        ),
        itemCount: exerciseList.length,
      ),
    );
  }
}
