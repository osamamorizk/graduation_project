import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class GpMealItem extends StatelessWidget {
  const GpMealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 155.h,
            width: double.infinity,
            fit: BoxFit.fill,
            image: const AssetImage(
              Assets.imagesGeneralPlansGeneralDiet,
            ),
          ),
          Text(
            'Green beans, tomatoes, eggs',
            style: TextStyles.font14Regular,
          ),
          Row(
            spacing: 6,
            children: [
              SvgPicture.asset(Assets.svgsCalories),
              Text(
                '135 kcal',
                style: TextStyles.font14BlueRegular.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 12,
                child: VerticalDivider(
                  thickness: 1.5,
                  width: 4,
                  color: ColorsManger.grey,
                ),
              ),
              SvgPicture.asset(Assets.svgsClock),
              Text(
                'min',
                style: TextStyles.font14BlueRegular.copyWith(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
