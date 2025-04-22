import 'package:flutter/material.dart';
import 'package:graduation_project/core/functions/show_comming_soon_dialog.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';

import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/drink_water/presentation/views/drink_water_view.dart';
import 'package:graduation_project/feature/home/data/models/challenge_model.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/challenge_item.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/home_banner.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/scan_and_plan_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(4),
                      const HomeBanner(),
                      verticalSpace(20),
                      const ScanAndPlanBox(),
                      verticalSpace(16),
                      Text(
                        'Challenges',
                        style: TextStyles.font18BlackBold,
                      ),
                      verticalSpace(8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                    onTap: () => showCommingSoonDialog(context),
                    child: ChallengeItem(
                      challengeModel: challengesList[index],
                    )),
                childCount: challengesList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar homeAppBar(BuildContext context) {
    return AppBar(
        elevation: .5,
        toolbarHeight: 50,
        scrolledUnderElevation: .5,
        titleSpacing: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WaterTrackerScreen(),
                  ));
            },
            child: Image.asset(Assets.iconsAppIcon)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Welcome',
              style: TextStyles.font16BlueBold,
            ),
            Text(
              'Every choice brings you closer to your best self.',
              style: TextStyles.font14greyNormal.copyWith(fontSize: 13),
            ),
          ],
        ));
  }
}
