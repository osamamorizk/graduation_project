import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/diet/presentation/views/diet_general_plans.dart';
import 'package:graduation_project/feature/diet/presentation/views/diet_your_plan.dart';

import 'package:graduation_project/core/widgets/custom_new_plan_button.dart';

class DietView extends StatefulWidget {
  const DietView({super.key});

  @override
  State<DietView> createState() => _DietViewState();
}

class _DietViewState extends State<DietView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      initialIndex: 0,
      length: taps.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 45,
          elevation: .4,
          title: Text(
            'Diet',
            style: TextStyles.font20BlueRegular,
          ),
          actions: [
            CustomNewPlanButton(
              type: 'diet',
              buttonText: 'New diet plan',
              onPressed: () {
                context.pushNamed(Routes.dataForm, arguments: 'diet');
              },
            ),
          ],
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: ColorsManger.darkBlue,
                width: 2.2,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 25.0),
            ),
            labelPadding: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: TextStyles.font14BlackRegular,
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
                text: 'General Plans',
              ),
            ],
          ),
        ),
        body: TabBarView(children: taps),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

List<Widget> taps = [
  const DietYourPlan(),
  const DietGeneralPlans(),
];
