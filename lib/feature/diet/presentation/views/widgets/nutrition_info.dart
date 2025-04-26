import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class NutritionItem extends StatelessWidget {
  final String title;
  final String value;

  const NutritionItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyles.font12WhiteBold.copyWith(color: Colors.grey),
        ),
        SizedBox(height: 4.h),
        Text(value, style: TextStyles.font14BlackBold),
      ],
    );
  }
}
