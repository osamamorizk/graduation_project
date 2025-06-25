import 'package:flutter/material.dart';
import 'package:graduation_project/core/functions/show_comming_soon_dialog.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/feature/home/data/models/challenge_model.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/challenge_item.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/home_banner.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/scan_and_plan_hydration_box.dart';

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
                      const ScanAndPlanAndHydartionBox(),
                      verticalSpace(16),
                      Text(
                        'Challenges',
                        style: Theme.of(context).textTheme.titleLarge,
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
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ChallengeItem(
                      challengeModel: challengesList[index],
                    ),
                  ),
                ),
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
      toolbarHeight: 50,
      titleSpacing: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Image.asset(Assets.iconsAppIcon),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hi, Osama',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'Your future body is built today',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
