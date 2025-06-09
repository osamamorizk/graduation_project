import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 14,
              ),
        ),
        verticalSpace(4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isDarkMode ? ColorsManger.darkerGrey : Colors.black12,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            type,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                ),
          ),
        ),
      ],
    );
  }
}
