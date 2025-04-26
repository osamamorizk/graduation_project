import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/workout/data/models/general_plan_model.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/general_plan_item.dart';

class WorkoutGeneralPlansView extends StatelessWidget {
  const WorkoutGeneralPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(8),
          Expanded(
            child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (context, index) => verticalSpace(16),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.generalWorkoutPlansDays);
                      },
                      child: GeneralPlanItem(
                        generalPLanModel: fitnessPlans[0],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
