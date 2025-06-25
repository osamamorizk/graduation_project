import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class HydrationBox extends StatelessWidget {
  const HydrationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.drinkWaterRoute);
      },
      child: Container(
        height: 94.h,
        width: MediaQuery.sizeOf(context).width / 2.35,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  ColorsManger.darkBlue.withOpacity(.6), BlendMode.darken),
              fit: BoxFit.fill,
              image: const AssetImage(Assets.imagesHydrationBox)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              height: 27,
              Assets.svgsWaterGlass,
            ),
            verticalSpace(12),
            Text(
              'Hydration',
              style: TextStyles.font14WhiteBold,
            )
          ],
        ),
      ),
    );
  }
}
