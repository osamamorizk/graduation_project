import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/shimmer_loading.dart';
import 'package:graduation_project/feature/home/presentation/manger/cubit/challenge_cubit.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/daily_list_tile.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/description_card.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/mark_day_listener.dart';

class LevelDetailsView extends StatelessWidget {
  const LevelDetailsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () {
          return context.read<ChallengeCubit>().getLevelDetails(id: id);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<ChallengeCubit, ChallengeState>(
            buildWhen: (previous, current) =>
                current is LevelSuccess ||
                current is LevelLoading ||
                current is LevelFailure,
            builder: (context, state) {
              if (state is LevelSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.levelModel.title ?? "No Title",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      verticalSpace(20),
                      DescriptionCard(
                        description:
                            state.levelModel.description ?? "No Description",
                      ),
                      verticalSpace(20),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.levelModel.days?.length ?? 0,
                        itemBuilder: (context, index) {
                          final day = state.levelModel.days![index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: DayTaskTile(day: day),
                          );
                        },
                      ),
                      const MarkDayListener()
                    ],
                  ),
                );
              } else if (state is LevelFailure) {
                return Center(
                    child: ErrorView(errorMessage: state.errorMessage));
              } else {
                return const ShimmerLoadingWidget(
                  height: 90,
                  itemCount: 7,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
