import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/workout/data/models/muscle_model.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/muscle_item.dart';

class MuscleGroupView extends StatelessWidget {
  const MuscleGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.pushNamed(Routes.exerciseListView,
                  arguments: exerciseList[index].name);
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
      ),
    );
  }
}
