import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key, required this.description});

  final String description;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? ColorsManger.darkCard : const Color(0xFFFCEAE8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 8,
        children: [
          const Icon(
            Icons.description_outlined,
            color: ColorsManger.darkBlue,
            size: 30,
          ),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
