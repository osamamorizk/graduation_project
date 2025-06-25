import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/show_comming_soon_dialog.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/sliver_shimmer_loading.dart';
import 'package:graduation_project/feature/home/presentation/manger/cubit/challenge_cubit.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/challenge_item.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/home_banner.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/scan_and_plan_hydration_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: RefreshIndicator(
        onRefresh: () {
          return context.read<ChallengeCubit>().getChallenges();
        },
        child: CustomScrollView(
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
            const ChallengeBuilderWidget(),
          ],
        ),
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
            'Nutrix',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
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

class ChallengeBuilderWidget extends StatelessWidget {
  const ChallengeBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      sliver: BlocBuilder<ChallengeCubit, ChallengeState>(
        builder: (context, state) {
          if (state is ChallengeSuccess) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () => showCommingSoonDialog(context),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ChallengeItem(
                      challengeModel: state.challengeModel,
                    ),
                  ),
                ),
                childCount: 1,
              ),
            );
          } else if (state is ChallengeFailure) {
            return SliverFillRemaining(
                child: ErrorView(errorMessage: state.errorMessage));
          } else {
            return const SliverShimmerLoading(
              hight: 100,
              itemCount: 2,
            );
          }
        },
      ),
    );
  }
}
