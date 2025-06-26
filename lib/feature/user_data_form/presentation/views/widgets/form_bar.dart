import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

AppBar customDataFormBar(Widget icon, double? value, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return AppBar(
    scrolledUnderElevation: .5,
    // backgroundColor: Colors.white,
    leading: icon,
    iconTheme: IconThemeData(
      color: isDark ? Colors.white : ColorsManger.darkBlue,
    ),
    title: SizedBox(
      width: 250.w,
      child: LinearProgressIndicator(
        minHeight: 4,
        borderRadius: BorderRadius.circular(2),
        value: value,
        backgroundColor: Colors.grey[300],
        color: isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
      ),
    ),
  );
}
