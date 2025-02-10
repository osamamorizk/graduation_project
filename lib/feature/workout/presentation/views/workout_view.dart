import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
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
          elevation: .4,
          automaticallyImplyLeading: false,
          toolbarHeight: 45,
          title: Text('Workout', style: TextStyles.font20BlueRegular),
          actions: [
            CustomNewPlanButton(
              type: 'Do you want to create new workout plan?',
              buttonText: 'New workout plan',
              onPressed: () {
                context.pop();

                context.pushNamed(Routes.dataForm, arguments: 'workout');
              },
            ),
          ],
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelPadding: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: TextStyles.font16BlackRegular,
            dividerColor: Colors.grey.shade200,
            dividerHeight: .6,
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
