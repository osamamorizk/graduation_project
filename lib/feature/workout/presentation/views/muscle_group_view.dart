import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/workout/data/models/muscle_model.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/muscle_item.dart';

class MuscleGroupView extends StatelessWidget {
  const MuscleGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(8),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => verticalSpace(16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.exerciseListView,
                      arguments: exerciseList[index].name);
                },
                child: MuscleItem(
                  muscleModel: exerciseList[index],
                ),
              ),
              itemCount: exerciseList.length,
            ),
          ),
        ],
      ),
    );
  }
}
