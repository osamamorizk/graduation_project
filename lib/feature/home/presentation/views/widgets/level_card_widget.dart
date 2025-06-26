import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.levelNumber,
    required this.title,
    required this.subtitle,
    required this.isUnlocked,
    this.onTap,
  });

  final int levelNumber;
  final String title;
  final String subtitle;
  final bool isUnlocked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? ColorsManger.darkCard : Colors.white;
    final lockedCardColor =
        isDarkMode ? ColorsManger.darkSurface : Colors.grey.shade200;
    final bgColor = isUnlocked ? cardColor : lockedCardColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: isUnlocked ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorsManger.grey, width: .2),
          ),
          child: Row(
            children: [
              _buildNumberCircle(context),
              const SizedBox(width: 16),
              _buildTextContent(context),
              Icon(
                isUnlocked ? Icons.lock_open : Icons.lock,
                color: ColorsManger.darkBlue,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberCircle(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.blue.shade100,
          child: Text(
            '$levelNumber',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CircleAvatar(
          radius: 12,
          backgroundColor: ColorsManger.darkBlue,
          child: Text(
            '$levelNumber',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
