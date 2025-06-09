import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class ProfileOptionItem extends StatelessWidget {
  const ProfileOptionItem({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });
  final String image;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 64.h,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: isDark ? ColorsManger.darkCard : ColorsManger.lighterGrey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? const Color.fromARGB(255, 34, 33, 33)
                  : ColorsManger.lighterGrey,
              blurRadius: 9,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              height: 24,
              image,
              colorFilter: ColorFilter.mode(
                isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
                BlendMode.srcIn,
              ),
            ),
            horizontalSpace(16),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
