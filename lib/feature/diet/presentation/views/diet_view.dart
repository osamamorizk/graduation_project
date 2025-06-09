import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/diet/presentation/views/diet_general_plans.dart';
import 'package:graduation_project/feature/diet/presentation/views/diet_your_plan.dart';

import 'package:graduation_project/core/widgets/custom_new_plan_button.dart';

class DietView extends StatelessWidget {
  const DietView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: taps.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 45,
          title: Text(
            'Diet',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: [
            CustomNewPlanButton(
              type: 'Do you want to create new diet plan?',
              buttonText: 'New diet plan',
              onPressed: () {
                context.pushNamed(Routes.dataForm, arguments: 'diet');
              },
            ),
          ],
          bottom: TabBar(
            labelPadding: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
            labelStyle: TextStyles.font14Regular,
            tabs: const [
              Tab(
                text: 'Your plan',
              ),
              Tab(
                text: 'General Plans',
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
  const DietYourPlan(),
  const DietGeneralPlans(),
];
