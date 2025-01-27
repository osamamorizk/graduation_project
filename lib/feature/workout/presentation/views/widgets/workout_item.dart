import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/container_info.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_element_data.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ColorsManger.darkGrey),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Bench press',
                style: TextStyles.font14BlackBold,
              ),
              const Spacer(),
              const ContainerIformation(data: 'Chest')
            ],
          ),
          const Divider(
            height: 10,
            thickness: .4,
            endIndent: 5,
            indent: 5,
          ),
          verticalSpace(16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WorkoutElementDataItem(
                data1: 'Sets: 4',
                data2: 'Reps: 8_10',
              ),
              WorkoutElementDataItem(
                data1: 'Rest: 60-90 sec',
                data2: 'Intensity: Moderate',
              )
            ],
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(top: 10),
            leading: Icon(
              Icons.error_outline,
              color: ColorsManger.darkBlue,
            ),
            title: Text(
              'Focus on proper form and controlled movements.',
              style: TextStyles.font14BlackRegular,
            ),
          )
        ],
      ),
    );
  }
}
