import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class GenneralPlanDietItem extends StatelessWidget {
  const GenneralPlanDietItem({
    super.key,
  });
  // final GeneralPLanModel generalPLanModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: MediaQuery.sizeOf(context).width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Assets.imagesGeneralPlansGeneralDiet),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balanced diet',
              style: TextStyles.font16whiteBold,
            ),
          ],
        ),
      ),
    );
  }
}
