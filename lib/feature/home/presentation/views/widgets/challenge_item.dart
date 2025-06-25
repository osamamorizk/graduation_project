import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/data/models/challenge_model.dart';
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return LevelCard(
                  levelNumber: index + 1,
                  title: 'Level ${index + 1}',
                  subtitle: 'Subtitle for level ${index + 1}',
                  islocked: index > 2,
                );
              }),
        )
      ],
    );
  }
}
