import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class WeightUniteToggle extends StatelessWidget {
  const WeightUniteToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text('KG', style: TextStyles.font14WhiteBold),
    );
  }
}
