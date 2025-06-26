import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/functions/show_warrning_dailog.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class CustomNewPlanButton extends StatelessWidget {
  const CustomNewPlanButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.type,
  });
  final String buttonText;
  final String type;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        warningDialog(context, onPressed, type);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.only(right: 16),
        height: 28.h,
        // width: 85.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              size: 18,
              Icons.autorenew,
              color: Colors.white,
            ),
            Text(
              buttonText,
              style: TextStyles.font13whiteRegular,
            )
          ],
        ),
      ),
    );
  }
}
