import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.levelNumber,
    required this.title,
    required this.subtitle,
    required this.islocked,
    this.onTap,
  });

  final int levelNumber;
  final String title;
  final String subtitle;
  final bool islocked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bgColor = !islocked ? Colors.white : Colors.grey.shade200;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: !islocked ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: .5),
          ),
          child: Row(
            children: [
              _buildNumberCircle(),
              const SizedBox(width: 16),
              _buildTextContent(context),
              Icon(
                !islocked ? Icons.lock_open : Icons.lock,
                color: ColorsManger.darkBlue,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberCircle() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 16,
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
