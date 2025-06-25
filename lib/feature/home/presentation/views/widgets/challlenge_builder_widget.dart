import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/sliver_shimmer_loading.dart';
import 'package:graduation_project/feature/home/presentation/manger/cubit/challenge_cubit.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/challenge_item.dart';

class ChallengeBuilderWidget extends StatelessWidget {
  const ChallengeBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      sliver: BlocBuilder<ChallengeCubit, ChallengeState>(
        buildWhen: (previous, current) =>
            current is ChallengeFailure ||
            current is ChallengeLoading ||
            current is ChallengeSuccess,
        builder: (context, state) {
          if (state is ChallengeSuccess) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ChallengeItem(
                    challengeModel: state.challengeModel,
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
              height: 100,
              itemCount: 2,
            );
          }
        },
      ),
    );
  }
}
