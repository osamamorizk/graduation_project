import 'package:graduation_project/core/helpers/app_assets.dart';

class ChallengeModel {
  final String title;
  final String image;
  final int durationDays;
  final String level;

  ChallengeModel({
    required this.title,
    required this.image,
    required this.durationDays,
    required this.level,
  });
}

List<ChallengeModel> challengesList = [
  ChallengeModel(
    title: "Unbroken Streak",
    image: Assets.imagesUnbroken,
    durationDays: 30,
    level: "Advanced",
  ),
  // ChallengeModel(
  //   title: "Clean Eating",
  //   image: Assets.imagesCleanEating,
  //   durationDays: 14,
  //   level: "Intermediate",
  // ),
  // ChallengeModel(
  //   title: "Hydration",
  //   image: Assets.imagesHydration,
  //   durationDays: 30,
  //   level: "Beginner",
  // ),
];
