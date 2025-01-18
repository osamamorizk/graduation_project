import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/manger/cubit/bottom_bar_cubit.dart';

class ScanFoodBox extends StatelessWidget {
  const ScanFoodBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomBarCubit>(context).controller.jumpToTab(2);
      },
      child: Container(
        height: 94.h,
        width: MediaQuery.sizeOf(context).width / 2.35.w,
        decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.imagesScanBoxBackground)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              height: 27,
              Assets.svgsCameraIcon,
            ),
            verticalSpace(12),
            Text(
              'Scan your Meal',
              style: TextStyles.font14WhiteBold,
            )
          ],
        ),
      ),
    );
  }
}
