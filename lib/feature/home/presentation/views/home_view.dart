import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/functions/show_comming_soon_dialog.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';

import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/challenge_item.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/home_banner.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/scan_and_plan_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          leading: SvgPicture.asset(Assets.svgsAppIcon),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome osama!',
                style: TextStyles.font14BlackBold,
              ),
              Text(
                'Every choice brings you closer to your best self.',
                style: TextStyles.font14greyNormal.copyWith(fontSize: 11),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                    onTap: () => showCommingSoonDialog(context),
                    child: const ChanllengItem()),
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
