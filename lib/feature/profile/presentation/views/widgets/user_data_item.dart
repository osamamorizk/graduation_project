import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class UserDataItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData? trailingIcon;
  final String? trailingUnite;

  const UserDataItem({
    super.key,
    required this.label,
    required this.value,
    this.trailingIcon,
    this.trailingUnite,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 16),
        ),
        verticalSpace(5),
        Container(
          height: 50.h,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyles.font14Regular,
              ),
              if (trailingIcon != null) Icon(trailingIcon, color: Colors.green),
              if (trailingUnite != null)
                Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? ColorsManger.neonPurple
                        : ColorsManger.darkBlue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  height: 31.h,
                  width: 36.w,
                  child: Center(
                    child: Text(
                      trailingUnite!,
                      style: TextStyles.font14WhiteBold.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
