import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/container_info.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/exercise.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_element_data.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({
    super.key,
    required this.exercise,
  });
  final WorkoutExerciseModel exercise;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? ColorsManger.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ColorsManger.darkerGrey, width: .2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name ?? 'Exercise',
                      style: TextStyles.font14Regular,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              ContainerIformation(data: exercise.muscleGroup ?? 'Chest')
            ],
          ),
          const Divider(
            height: 10,
            thickness: .5,
            endIndent: 5,
            indent: 5,
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: WorkoutElementDataItem(
                  data1: 'Sets: ${exercise.sets}',
                  data2: 'Reps: ${exercise.reps}',
                ),
              ),
              Expanded(
                child: WorkoutElementDataItem(
                  data1: 'Rest: ${exercise.restBetweenSets}',
                  data2: 'Intensity:  ${exercise.intensity}',
                ),
              )
            ],
          ),
          ListTile(
            tileColor: isDark ? Colors.white : ColorsManger.darkCard,
            contentPadding: const EdgeInsets.only(top: 10),
            leading: const Icon(
              Icons.error_outline,
              color: ColorsManger.darkBlue,
            ),
            title: Text(
              '  ${exercise.notes}',
              style: TextStyles.font14Regular,
            ),
          )
        ],
      ),
    );
  }
}
