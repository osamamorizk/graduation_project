import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/feature/workout/data/models/muscle_model.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/exercise_list_view.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/muscle_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

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
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: ExerciseListView(
                      exerciseGroup: exerciseList[index].name,
                    ),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
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
