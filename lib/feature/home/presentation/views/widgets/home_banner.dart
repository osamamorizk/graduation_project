import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/bannner_text_button.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 186,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 180.h,
            width: MediaQuery.sizeOf(context).width.w,
            decoration: BoxDecoration(
              color: isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const BannerTextButton(),
          ),
          Positioned(
              bottom: 0,
              right: -10,
              child: Image.asset(Assets.imagesManHomeBanner)),
        ],
      ),
    );
  }
}
