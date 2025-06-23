import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class NutrientInfo extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const NutrientInfo(
      {super.key,
      required this.icon,
      required this.value,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: Theme.of(context).textTheme.bodySmall),
            Text(label, style: TextStyles.font12BlackBold),
          ],
        ),
      ],
    );
  }
}
