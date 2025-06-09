import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/calories_and_time.dart';
import 'package:graduation_project/core/widgets/image_and_title_widget.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/general_workout_plan_exercises.dart';

class WorkoutGeneralPlanDays extends StatelessWidget {
  const WorkoutGeneralPlanDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageAndTitleWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -25,
                    left: MediaQuery.of(context).size.width / 20,
                    child: CalorisAndTimeWidget(
                      widget: Row(
                        children: [
                          const SizedBox(
                            height: 12,
                            child: VerticalDivider(
                              thickness: 1.3,
                              width: 15,
                              color: ColorsManger.grey,
                            ),
                          ),
                          Text(
                            'Easy',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index) => const Divider(
                        color: ColorsManger.lighterGrey,
                        thickness: .4,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.exercisesByDay);
                          },
                          child: const TitleAndTimeWidget(
                            title: 'Day 1',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
