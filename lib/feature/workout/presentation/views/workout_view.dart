import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/workout/presentation/views/muscle_group_view.dart';
import 'package:graduation_project/feature/workout/presentation/views/general_plans_view.dart';
import 'package:graduation_project/core/widgets/custom_new_plan_button.dart';
import 'package:graduation_project/feature/workout/presentation/views/your_plan_view.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: taps.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          title: Text(
            'Workout',
            style: TextStyles.font22BlueBold.copyWith(fontSize: 20),
          ),
          actions: const [
            CustomNewPlanButton(),
          ],
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelPadding: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: TextStyles.font14BlackRegular,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: ColorsManger.darkBlue,
            labelColor: Colors.black,
            unselectedLabelColor: ColorsManger.darkerGrey,
            tabs: const [
              Tab(
                text: 'Your plan',
              ),
              Tab(
                text: 'Exercises',
              ),
              Tab(
                text: 'General plans',
              ),
            ],
          ),
        ),
        body: TabBarView(children: taps),
      ),
    );
  }
}

List<Widget> taps = [
  const WorkoutYourPlanView(),
  const MuscleGroupView(),
  const WorkoutGeneralPlansView(),
];
