import 'package:graduation_project/core/helpers/app_assets.dart';

class MuscleModel {
  final String name;
  final String image;
  final int id;

  MuscleModel({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<MuscleModel> exerciseList = [
  MuscleModel(
    id: 1,
    name: "Arm",
    image: Assets.imagesExercisesARM,
  ),
  MuscleModel(
    name: "Chest",
    image: Assets.imagesExercisesChest,
    id: 2,
  ),
  MuscleModel(
    id: 3,
    name: "Abs",
    image: Assets.imagesExercisesABS,
  ),
  MuscleModel(
    id: 4,
    name: "Leg",
    image: Assets.imagesExercisesLeg,
  ),
  MuscleModel(
    id: 5,
    name: "Back & Shoulder",
    image: Assets.imagesExercisesBack,
  ),
  MuscleModel(
    id: 6,
    name: "Stretches",
    image: Assets.imagesExercisesStretches,
  ),
];
