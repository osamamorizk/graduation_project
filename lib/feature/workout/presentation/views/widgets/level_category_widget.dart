import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class LevelCategoryChips extends StatelessWidget {
  const LevelCategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomExerciseInfoWidget(
          title: 'Level',
          type: 'Beginner',
        ),
        CustomExerciseInfoWidget(
          title: 'Category',
          type: 'Muscle Gain',
        ),
      ],
    );
  }
}

class CustomExerciseInfoWidget extends StatelessWidget {
  const CustomExerciseInfoWidget({
    super.key,
    required this.title,
    required this.type,
  });
  final String title;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyles.font14greyNormal),
        verticalSpace(4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(type, style: TextStyles.font14BlackBold),
        ),
      ],
    );
  }
}
