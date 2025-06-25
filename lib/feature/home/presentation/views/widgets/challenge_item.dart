import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/home/data/models/chanllenge_model/chanllenge_model.dart';
import 'package:graduation_project/feature/home/presentation/manger/cubit/challenge_cubit.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/challenge_details.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/level_card_widget.dart';

class ChallengeItem extends StatelessWidget {
  const ChallengeItem({super.key, required this.challengeModel});
  final ChallengeModel challengeModel;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      initiallyExpanded: true,
      collapsedShape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.grey,
          width: .2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.grey,
          width: .5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 8),
      title: ChallengeDetails(challengeModel: challengeModel, isDark: isDark),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: challengeModel.levels?.length,
            itemBuilder: (context, index) {
              return LevelCard(
                onTap: () {
                  context.read<ChallengeCubit>().getLevelDetails(id: index + 1);
                  context.pushNamed(Routes.levelDetailsView);
                },
                levelNumber: index + 1,
                title: 'Level ${index + 1}',
                subtitle: challengeModel.levels?[index].title ?? '',
                isUnlocked: challengeModel.levels?[index].isUnlocked ?? true,
              );
            },
          ),
        )
      ],
    );
  }
}
